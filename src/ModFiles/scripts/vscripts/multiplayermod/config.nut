//---------------------------------------------------
// Purpose: Here, you can customize several parameters
// in your server. You can change this mid-game as
// well, however, be sure to modify the one that has
// been copied into a new portal2_dlcX folder and
//          switch levels after modifying!
//---------------------------------------------------

//-----------------------------------
// Dev variables
//-----------------------------------
// Set true/false if you want to see the P2:MM debug info in the console
Config_DevMode <- false

// Set true/false if you want to use a VScript Debugger. This also sets "developer" to 1. Only works for Windows systems!
// Highly recommended to use the "VScript Debugger" by LionDoge, a extension for Visual Studio Code. https://marketplace.visualstudio.com/items?itemName=LionDoge.vscript-debug
// How debugging was implemented for P2MM has been done according to LionDoge's extension instructions. 
// This means that Config_DevMode will be automatically set to true wether or not it's been set to false as developer is needed to be enabled.
// On every map change you will need to reattach the debugger, that's just unfortunately how Valve programmed it.
//! ONLY ENABLE THIS IF YOU KNOW WHAT YOU'RE DOING! Game will freeze and won't unfreeze until a debugger is attached!
Config_VScriptDebug <- false

// Set true/false if you want to see the visual debug lines in-game for ray tracing
Config_VisualDebug <- false

// Set true/false if you are a developer and wish to load your custom player model in-game
// Currently does not work on dedicated servers
Config_UseCustomDevModels <- false

// Set false if you want to disable the prompt that appears once at the start at every play session.
Config_FirstRunPrompt <- true

// Set to true if you want to disable cut scenes for Portal Stories: Mel (can make for some funny moments)
Config_DisableMelCutscenes <- false

// Set true/false if you want to randomize every Turret's models and colors and the Frankenturret's colors.
// The second one when true will make the models and colors constantly change instead of once.
//! Don't turn Config_RandomTurretLoop on while the map is running or the game will crash because the models
//! were not precached at PostMapSpawn. Change here then reload the map.
Config_RandomTurret <- false
Config_RandomTurretLoop <- false


// Set true/false if you want the server to wait a bit to allow other players to reach the end of the level before allowing someone to start the elevator (default: true)
Config_UseCountdown <- true

//! Note: Countdown configs are useless if Config_UseCountdown is set to false.
// Set to the PERCENTAGE of players that you want to reach the end before the transition enables.
Config_CountdownPercentage <- 75

// Set to the amount of time (in seconds) you allow players to get to the end after someone reaches it (if ^ percentage isnt met in time)
Config_CountdownTimer <- 30


// Set true/false if you want to randomize the size of all portals every second
Config_RandomPortalSize <- false

// Set true/false if you want the player join messages to appear in the top left corner in-game (affects all players)
Config_UseJoinIndicator <- true

// Set true/false if you want to see the player's name when you aim at them (affects all players)
Config_UseNametags <- true

// Set true/false if you want players to be able to emote for all maps
Config_EnableEmoting <- true

// Set true/false if you want players to be able to use the ping tool for all maps
Config_EnablePinging <- true

//-----------------------------------
// Server variables
//-----------------------------------
// Set true/false if you want to enable the Safeguard functionality against server vscript functions from people connecting to you.
// "true" is highly recommended if this is a public server
Config_SafeGuard <- true

// Set to any integer from 0 to 256 to determine how much separation force exists between players.
// NOTE: THIS WILL NOT DO ANYTHING ON DEDICATED SERVERS!
// P2:MM disables solid collision between players as seen in normal Portal 2, since it causes issues with players spawning inside of each other.
// 0 - Players will not push each other away with any force when colliding.
// 256 - Players will push each other away with a moderate amount of force when colliding.
Config_SetPlayerElasticity <- 0

// Set true/false if you want to enable chat command functionality
Config_UseChatCommands <- true

// Set to true if you want chat command functionality, but everyone can't use them except the host.
// The chat commands !help, !kill, and !vote, can still be used by all players.
Config_HostOnlyChatCommands <- false

// * If the P2:MM plugin loads and Config_UseChatCommands is true, then this is the list of players that have access to specific chat commands
// * Admins list should be changed from within the launcher at runtime, but can be changed manually here as well as long as you reset the map after editing
// * Permissions stack with increased admin level
// * The highest admin level available is [6] and is assigned automatically to the server operator (unless it's a dedicated server)
// * Everyone by default has level [0]
//
// * These can be accessed with "!" preceding them
// * Use "!help (command name)" to print a description of each command in the chat box
//
// What each admin level gives you (0 means no admin, default player permissions)
// [0]: "help", "changeteam", "kill", "rocket", "playercolor", replying to a "vote"
// [1]:
// [2]: "playercolor (for someone else)", "speed", "tp"
// [3]: "kill (someone else)", "noclip", "restartlevel", calling a vote with "vote"
// [4]: "slap", "rocket (optionally someone)", "hub", "mpcourse", "spcourse"
// [5]: "kick"
// [6]: "adminmodify" 
//
// Example on how to format the list:
// admins <- [
//     "[AdminLevel]Steam3 ID (only the numbers bit after the second ':')", // (Username to keep track)
//     "[3]123456789", // John Doe
// ]

Admins <- [
    // Add Admins Here
]

// * Custom Lobby Music Control * \\
// * Configs for the custom music controls in mp_coop_lobby_3 * \\

// Config_musicEnable: Whether to enable custom music control in the lobby.
Config_musicEnable <- true

// Config_musicDefault: Which music track in Config_musicTracks is called to start by default in the lobby. 
// Set this to -1 if you don't want any music to start in the lobby, but still want to adjust it.
// Only integers greater or equal to -1 are allowed.
Config_musicDefault <- 0

// Config_musicTracks: The music track list containing tracks to be played in mp_coop_lobby_3. For it to be heard by all players
// it must come with Portal 2, or it has to be in the same location on disk for both the host and clients for clients to hear it. 
// 
// Recommended to use .wav files, .mp3 files also work but, it's also recommended that your sound file has 
// build in looping, or you have to change to a different track then back again to start it again. The ambient_generic 
// used can not automatically rerun tracks unless they have build in looping. You can tell if your music track has 
// built in looping when you run the "snd_show 1" command in the console and you see "looped(1) to the left of the 
// music tracks file name. Built in looping can be done to .wav files but isn't possible with .mp3 files. 
// Those marked with "Doesn't loop", are some tracks that would be nice to be there by default, but they don't loop.
//
// Example track list setup: 
// Config_musicTracks <- [
//     "music/mp_coop_lobby_2_c1.wav"
// ]
Config_musicTracks <- [
    "music/mp_coop_lobby_2_c1.wav" //0 index, 1/16
    "music/mp_coop_lobby_2_c2.wav" //1 index, 2/16
    "music/mp_coop_lobby_2_c4.wav" //2 index, 3/16
    "music/mp_coop_lobby_2_c5.wav" //3 index, 4/16
    "music/mp_coop_lobby_2_c6.wav" //4 index, 5/16
    "music/mp_coop_lobby_2_c7.wav" //5 index, 6/16
    "music/mp_coop_hallway_c4.wav" //6 index, 7/16
    "music/sp_a1_wakeup_b1.wav" //7 index, 8/16
    "music/sp_a2_bts1_b1.wav" //8 index, 9/16
    "music/sp_a4_tb_catch_b1a.wav" //9 index, 10/16
    "music/sp_a4_finale1_b2p2.wav" //10 index, 11/16
    "music/portal2_want_you_gone.wav" //11 index, 12/16
    "music/portal2_robots_ftw.wav" //12 index, 13/16
    "ambient/music/looping_radio_mix.wav" //13 index, 14/16
    "music/sp_a2_dual_lasers_r1.wav" //14 index, 15/16 *Doesn't loop*
    "music/sp_a2_laser_vs_turret_r1.wav" //15 index, 16/16 *Doesn't loop*
]

//* END CONFIGURABLE OPTION *\\

//---------------------------------------------------
//   *****!Do not edit this part of the file!*****
//---------------------------------------------------
// Purpose: Verifies valid options in config.nut
//          and compensates for each variable.
//---------------------------------------------------

// Can't create a function to redefine existing variables, so do it one by one :D

local ConfigValueError = function(invalidorundefined, command) {
    printlP2MM(1, false, invalidorundefined + " value provided for " + command + "! Treating as default value. Verify valid options for this in config.nut")
}

try {
    if (typeof(Config_DevMode) != "bool") {
        Config_DevMode <- false
        ConfigValueError("Invalid", "Config_DevMode")
    }
} catch (exception) {
    Config_DevMode <- false
    ConfigValueError("Undefined", "Config_DevMode")
}

try {
    if (typeof(Config_VScriptDebug) != "bool") {
        Config_VScriptDebug <- false
        ConfigValueError("Invalid", "Config_VScriptDebug")
    }
} catch (exception) {
    Config_VScriptDebug <- false
    ConfigValueError("Undefined", "Config_VScriptDebug")
}

try {
    if (typeof(Config_VisualDebug) != "bool") {
        Config_VisualDebug <- false
        ConfigValueError("Invalid", "Config_VisualDebug")
    }
} catch (exception) {
    Config_VisualDebug <- false
    ConfigValueError("Undefined", "Config_VisualDebug")
}

try {
    if (typeof(Config_UseCustomDevModels) != "bool") {
        Config_UseCustomDevModels <- false
        ConfigValueError("Invalid", "Config_UseCustomDevModels")
    }
} catch (exception) {
    Config_UseCustomDevModels <- false
    ConfigValueError("Undefined", "Config_UseCustomDevModels")
}

try {
    if (typeof(Config_DisableMelCutscenes) != "bool") {
        Config_DisableMelCutscenes <- false
        ConfigValueError("Invalid", "Config_DisableMelCutscenes")
    }
} catch (exception) {
    Config_DisableMelCutscenes <- false
    ConfigValueError("Undefined", "Config_DisableMelCutscenes")
}

try {
    if (typeof(Config_FirstRunPrompt) != "bool") {
        Config_FirstRunPrompt <- true
        ConfigValueError("Invalid", "Config_FirstRunPrompt")
    }
} catch (exception) {
    Config_FirstRunPrompt <- true
    ConfigValueError("Undefined", "Config_FirstRunPrompt")
}

try {
    if (typeof(Config_RandomTurret) != "bool") {
        Config_RandomTurret <- false
        ConfigValueError("Invalid", "Config_RandomTurret")
    }
} catch (exception) {
    Config_RandomTurret <- false
    ConfigValueError("Undefined", "Config_RandomTurret")
}

try {
    if (typeof(Config_RandomTurretLoop) != "bool") {
        Config_RandomTurretLoop <- false
        ConfigValueError("Invalid", "Config_RandomTurretLoop")
    }
} catch (exception) {
    Config_RandomTurretLoop <- false
    ConfigValueError("Undefined", "Config_RandomTurretLoop")
}

try {
    if (typeof(Config_UseCountdown) != "bool") {
        Config_UseCountdown <- false
        ConfigValueError("Invalid", "Config_UseCountdown")
    }
} catch (exception) {
    Config_UseCountdown <- false
    ConfigValueError("Undefined", "Config_UseCountdown")
}

try {
    if (typeof(Config_CountdownPercentage) != "integer") {
        Config_CountdownPercentage <- 75
        ConfigValueError("Invalid", "Config_CountdownPercentage")
    }
} catch (exception) {
    Config_CountdownPercentage <- 75
    ConfigValueError("Undefined", "Config_CountdownPercentage")
}

try {
    if (typeof(Config_CountdownTimer) != "integer") {
        Config_CountdownTimer <- 30
        ConfigValueError("Invalid", "Config_CountdownTimer")
    }
} catch (exception) {
    Config_CountdownTimer <- 30
    ConfigValueError("Undefined", "Config_CountdownTimer")
}

try {
    if (typeof(Config_RandomPortalSize) != "bool") {
        Config_RandomPortalSize <- false
        ConfigValueError("Invalid", "Config_RandomPortalSize")
    }
} catch (exception) {
    Config_RandomPortalSize <- false
    ConfigValueError("Undefined", "Config_RandomPortalSize")
}

try {
    if (typeof(Config_UseJoinIndicator) != "bool") {
        Config_UseJoinIndicator <- true
        ConfigValueError("Invalid", "Config_UseJoinIndicator")
    }
} catch (exception) {
    Config_UseJoinIndicator <- true
    ConfigValueError("Undefined", "Config_UseJoinIndicator")
}

try {
    if (typeof(Config_UseNametags) != "bool") {
        Config_UseNametags <- true
        ConfigValueError("Invalid", "Config_UseNametags")
    }
} catch (exception) {
    Config_UseNametags <- true
    ConfigValueError("Undefined", "Config_UseNametags")
}

try {
    if (typeof(Config_SafeGuard) != "bool") {
        Config_SafeGuard <- false
        ConfigValueError("Invalid", "Config_SafeGuard")
    }
} catch (exception) {
    Config_SafeGuard <- false
    ConfigValueError("Undefined", "Config_SafeGuard")
}

try {
    if (typeof(Config_SetPlayerElasticity) != "integer") {
        Config_SetPlayerElasticity <- 0
        ConfigValueError("Invalid", "Config_SetPlayerElasticity")
    }
} catch (exception) {
    Config_SetPlayerElasticity <- 0
    ConfigValueError("Undefined", "Config_SetPlayerElasticity")
}

try {
    if (typeof(Config_UseChatCommands) != "bool") {
        Config_UseChatCommands <- true
        ConfigValueError("Invalid", "Config_UseChatCommands")
    }
} catch (exception) {
    Config_UseChatCommands <- true
    ConfigValueError("Undefined", "Config_UseChatCommands")
}

try {
    if (typeof(Config_HostOnlyChatCommands) != "bool") {
        Config_HostOnlyChatCommands <- false
        ConfigValueError("Invalid", "Config_HostOnlyChatCommands")
    }
} catch (exception) {
    Config_UseChatCommands <- false
    ConfigValueError("Undefined", "Config_HostOnlyChatCommands")
}

local SetDefaultAdminList = function() {
    Admins <- []
}

try {
    if (typeof(Admins) != "array") {
        SetDefaultAdminList()
        ConfigValueError("Invalid", "Admins")
    } else {
        foreach (admin in Admins) {
            local level = split(admin, "[]")[0]
            local SteamID = split(admin, "]")[1]

            if (typeof(level.tointeger()) != "integer" || typeof(SteamID.tointeger()) != "integer") {
                SetDefaultAdminList()
                ConfigValueError("Invalid", "Admins")
                return
            }
        }
    }
} catch (exception) {
    SetDefaultAdminList()
    ConfigValueError("Undefined", "Admins")
}

try {
    if (typeof(Config_musicEnable) != "bool") {
        Config_musicEnable <- true
        ConfigValueError("Invalid", "Config_musicEnable")
    }
} catch (exception) {
    Config_musicEnable <- true
    ConfigValueError("Undefined", "Config_musicEnable")
}

try {
    if (typeof(Config_musicDefault) != "integer" || Config_musicDefault < -1) {
        Config_musicDefault <- 0
        ConfigValueError("Invalid", "Config_musicDefault")
    }
} catch (exception) {
    Config_musicDefault <- 0
    ConfigValueError("Undefined", "Config_musicDefault")
}

local SetDefaultMusicTracksArray = function() {
    Config_musicTracks <- [
        "music/mp_coop_lobby_2_c1.wav" //0 index, 1/16
        "music/mp_coop_lobby_2_c2.wav" //1 index, 2/16
        "music/mp_coop_lobby_2_c4.wav" //2 index, 3/16
        "music/mp_coop_lobby_2_c5.wav" //3 index, 4/16
        "music/mp_coop_lobby_2_c6.wav" //4 index, 5/16
        "music/mp_coop_lobby_2_c7.wav" //5 index, 6/16
        "music/mp_coop_hallway_c4.wav" //6 index, 7/16
        "music/sp_a1_wakeup_b1.wav" //7 index, 8/16
        "music/sp_a2_bts1_b1.wav" //8 index, 9/16
        "music/sp_a4_tb_catch_b1a.wav" //9 index, 10/16
        "music/sp_a4_finale1_b2p2.wav" //10 index, 11/16
        "music/portal2_want_you_gone.wav" //11 index, 12/16
        "music/portal2_robots_ftw.wav" //12 index, 13/16
        "ambient/music/looping_radio_mix.wav" //13 index, 14/16
        "music/sp_a2_dual_lasers_r1.wav" // Doesn't loop  //14 index, 15/16
        "music/sp_a2_laser_vs_turret_r1.wav" // Doesn't loop  //15 index, 16/16
    ]
}

try {
    if (typeof(Config_musicTracks) != "array") {
        SetDefaultMusicTracksArray()
        ConfigValueError("Invalid", "Config_musicTracks")
    } else {
        foreach (track in Config_musicTracks) {
            if (typeof(track) != "string") {
                SetDefaultMusicTracksArray()
                ConfigValueError("Invalid", "Config_musicTracks")
                return
            }
        }
    }
} catch (exception) {
    SetDefaultMusicTracksArray()
    ConfigValueError("Undefined", "Config_musicTracks")
}