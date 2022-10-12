//------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                   COPYRIGHT                                                                    //
//                                                        © 2022 Portal 2: Multiplayer Mod                                                        //
//                                      https://github.com/kyleraykbs/Portal2-32PlayerMod/blob/main/LICENSE                                       //
// In the case that this file does not exist at all or in the GitHub repository, this project will fall under a GNU LESSER GENERAL PUBLIC LICENSE //
//------------------------------------------------------------------------------------------------------------------------------------------------//

//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
//   __  __
//  |  \/  |  __ _  _ __   ___  _ __    __ _ __      __ _ __   _
//  | |\/| | / _` || '_ \ / __|| '_ \  / _` |\ \ /\ / /| '_ \ (_)
//  | |  | || (_| || |_) |\__ \| |_) || (_| | \ V  V / | | | | _
//  |_|  |_| \__,_|| .__/ |___/| .__/  \__,_|  \_/\_/  |_| |_|(_)
//                 |_|         |_|
//---------------------------------------------------
// Purpose: The heart of the mod's content. Runs on
// every map transition to bring about features and
//                 fixes for 3+ MP.
//---------------------------------------------------

// mapspawn.nut is called twice on map transitions for some reason...
// Prevent the second run
if (!("Entities" in this)) { return }

printl("\n-------------------------")
printl("==== calling mapspawn.nut")
printl("-------------------------\n")

// Make sure we know whether the plugin is loaded or not
// before including other files that depend on its value
IncludeScript("multiplayermod/pluginfunctionscheck.nut")

// Directly after including the user config, we need to make sure that
// nothing is invalid, and to take care of anything that is
IncludeScript("multiplayermod/config.nut")
IncludeScript("multiplayermod/configcheck.nut")

// Create a global point_servercommand entity for us to pass through commands
// We don't want to create multiple when it is called on
Entities.CreateByClassname("point_servercommand").__KeyValueFromString("targetname", "p2mm_servercommand")

function MakeProgressCheck() {
    local ChangeToThisMap = "mp_coop_start"
    for (local course = 1; course <= 6; course++) {
        // 9 levels is the highest that a course has
        for (local level = 1; level <= 9; level++) {
            if (IsLevelComplete(course - 1, level - 1)) {
                ChangeToThisMap = "mp_coop_lobby_3"
            }
        }
    }
    EntFire("p2mm_servercommand", "command", "changelevel " + ChangeToThisMap, 0)
}

// Facilitate first load after game launch
if (GetDeveloperLevel() == 918612) {
    // This function is called only once under this developer level condition
    // No need to use it any other time!
    // Reset dev level
    if (Config_DevMode) {
        EntFire("p2mm_servercommand", "command", "developer 1")
    }
    else {
        EntFire("p2mm_servercommand", "command", "clear; developer 0")
    }

    if (!PluginLoaded) {
        // Remove Portal Gun (Map transition will sound less abrupt)
        Entities.CreateByClassname("info_target").__KeyValueFromString("targetname", "supress_blue_portalgun_spawn")
        Entities.CreateByClassname("info_target").__KeyValueFromString("targetname", "supress_orange_portalgun_spawn")

        EntFire("p2mm_servercommand", "command", "script printl(\"(P2:MM): Attempting to load the P2:MM plugin...\")", 0.03)
        EntFire("p2mm_servercommand", "command", "plugin_load 32pmod", 0.05)
        EntFire("p2mm_servercommand", "command", "script MakeProgressCheck()", 1) // Must be delayed
        return
    }
}

IncludeScript("multiplayermod/variables.nut")
IncludeScript("multiplayermod/safeguard.nut")
IncludeScript("multiplayermod/functions.nut")
IncludeScript("multiplayermod/loop.nut")
IncludeScript("multiplayermod/hooks.nut")
IncludeScript("multiplayermod/chatcommands.nut")

// Always have global root functions imported for any level
IncludeScript("multiplayermod/mapsupport/#propcreation.nut")
IncludeScript("multiplayermod/mapsupport/#rootfunctions.nut")

// Load the custom save system after everything else has been loaded
IncludeScript("multiplayermod/savesystem.nut")

// Print P2:MM game art in console
foreach (line in ConsoleAscii) { printl(line) }

//---------------------------------------------------

// Now, manage everything the player has set in config.nut
// If the gamemode has exceptions of any kind, it will revert to standard mapsupport

// This is how we communicate with all mapsupport files. In case no mapsupport file exists, it will fall back to "nothing"
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn, MSOnSave, MSOnSaveCheck) {}

// Import map support code
function LoadMapSupportCode(gametype) {
    printl("\n=============================================================")
    printl("(P2:MM): Attempting to load " + gametype + " mapsupport code!")
    printl("=============================================================\n")

    local MapName = FindAndReplace(GetMapName().tostring(), "maps/", "")
    MapName = FindAndReplace(MapName.tostring(), ".bsp", "")

    if (gametype != "standard") {
        try {
            // Import the core functions before the actual mapsupport
            IncludeScript("multiplayermod/mapsupport/" + gametype + "/#" + gametype + "functions.nut")
        } catch (exception) {
            printl("(P2:MM): Failed to load the " + gametype + " core functions file!")
        }
    }

    try {
        IncludeScript("multiplayermod/mapsupport/" + gametype + "/" + MapName.tostring() + ".nut")
    } catch (exception) {
        if (gametype == "standard") {
            printl("(P2:MM): Failed to load standard mapsupport for " + GetMapName() + "\n")
        } else {
            printl("(P2:MM): Failed to load " + gametype + " mapsupport code! Reverting to standard mapsupport...")
            return LoadMapSupportCode("standard")
        }
    }
}

try {
    switch (Config_GameMode) {
        case 0: LoadMapSupportCode("standard");     break;
        case 1: LoadMapSupportCode("speedrun");     break;
        case 2: LoadMapSupportCode("deathmatch");   break;
        case 3: LoadMapSupportCode("futbol");       break;
    }
} catch (exception) {
    printl("(P2:MM): \"Config_GameMode\" value in config.nut is invalid! Be sure it is set to an integer from 0-3. Reverting to standard mapsupport.")
    LoadMapSupportCode("standard")
}

//---------------------------------------------------

// Second, run init() shortly AFTER spawn

function init() {
    // Trigger map-specific code
    MapSupport(true, false, false, false, false, false, false, false)

    // Create an entity to loop the loop() function every 0.1 second
    Entities.CreateByClassname("logic_timer").__KeyValueFromString("targetname", "p2mm_timer")
    for (local timer; timer = Entities.FindByClassname(timer, "logic_timer");) {
        if (timer.GetName() == "p2mm_timer") {
            p2mm_timer <- timer
            break
        }
    }
    EntFireByHandle(p2mm_timer, "AddOutput", "RefireTime " + TickSpeed, 0, null, null)
    EntFireByHandle(p2mm_timer, "AddOutput", "classname move_rope", 0, null, null)
    EntFireByHandle(p2mm_timer, "AddOutput", "OnTimer worldspawn:RunScriptCode:loop():0:-1", 0, null, null)
    EntFireByHandle(p2mm_timer, "Enable", "", looptime, null, null)

    // Delay the creation of our map-specific entities before so
    // that we don't get an engine error from the entity limit
    EntFire("p2mm_servercommand", "command", "script CreateOurEntities()", 0.05)
}

try {
    // Make sure that the user is in multiplayer mode before initiating everything
    if (!IsMultiplayer()) {
        printl("(P2:MM): This is not a multiplayer session! Disconnecting client...")
        EntFire("p2mm_servercommand", "command", "disconnect \"You cannot play the singleplayer mode when Portal 2 is launched from the Multiplayer Mod launcher. Please unmount and launch normally to play singleplayer.\"")
    }

    // init() must be delayed
    EntFire("p2mm_servercommand", "command", "script init()", 0.02)
} catch (e) {
    printl("(P2:MM): Initializing our custom support!\n")
}
