//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
// Purpose: Enable commands through the chat box.
//---------------------------------------------------

// TODO: 
// - Fix how we work out arguments for players with spaces in their names
// - Fix adminmodify pushing players instead of changing existing slot

if (!Config_UseChatCommands) {
    printlP2MM(1, true, "Config_UseChatCommands is false. Not adding chat callback for chat commands!")
    return
}

function RunChatCommand(cmd, args, plr) {
    printlP2MM(0, true, "Running chat command \"" + cmd.name + "\" from player \"" + FindPlayerClass(plr).username + "\"")
    cmd.CC(plr, args)
}

// The whole filtering process for the chat commands
function ChatCommands(rawText, iUserIndex) {
    local Message = strip(RemoveDangerousChars(rawText))

    local pPlayer = UTIL_PlayerByIndex(iUserIndex)
    if ((pPlayer == null)) { return } // Invalid player or dedicated server console

    local AdminLevel = GetAdminLevel(pPlayer)

    //--------------------------------------------------

    // Be able to tell what is and isn't a chat command
    if (Message.slice(0, 1) != "!" || Message.len() < 2) {
        return
    }
    if (Message.slice(0, 2) == "!!" || Message.slice(0, 2) == "! ") {
        return
    }
    if (Message.len() > 3) {
        if (Message.slice(0, 4) == "!SAR") {
            return // speedrun plugin events can interfere
        }
    }

    // The real chat command doesn't have the "!". Also split arguments
    local szTargetCommand = strip(Replace(Message, "!", ""))

    local Args = SplitBetween(szTargetCommand, " ", true)
    if (Args.len() > 0) {
        Args.remove(0)
    }

    foreach (cmd in CommandList) {
        if (StartsWith(szTargetCommand.tolower(), cmd.name)) {
            szTargetCommand = cmd
            break
        }
    }

    //--------------------------------------------------
    
    // Confirmed that it's a command that follows our syntax, now try to run it

    // Check if the command exists
    if (typeof(szTargetCommand) != "class") {
        SendChatMessage("[ERROR] Command not found. Use !help to list some commands!", pPlayer)
        return
    }

    // Check if the caller has the right admin level as well as if Config_HostOnlyChatCommands is enabled and if it is still a allowed command
    if ((szTargetCommand.level > AdminLevel) || (Config_HostOnlyChatCommands && !(iUserIndex == 1) && !(szTargetCommand.name == "help" || szTargetCommand.name == "kill" || szTargetCommand.name == "vote"))) {
        SendChatMessage("[ERROR] You do not have permission to use this command!", pPlayer)
        return
    }

    RunChatCommand(szTargetCommand, Args, pPlayer)
}

//=======================================
// Import chat command content
//=======================================

CommandList <- []

local IncludeScriptCC = function(script) {
    try {
        IncludeScript("multiplayermod/cc/" + script + ".nut")
    } catch (exception) {
        printlP2MM("Failed to load: multiplayermod/cc/" + script + ".nut")
    }
}

// Include the scripts that will push each
// chat command to the CommandList array

// The order of the CC list will be dependent on what is included first
// Organized alphabetically...

IncludeScriptCC("adminmodify")
IncludeScriptCC("changeteam")
IncludeScriptCC("help")
IncludeScriptCC("kick")
IncludeScriptCC("kill")
IncludeScriptCC("noclip")
IncludeScriptCC("playercolor")
IncludeScriptCC("restartlevel")
IncludeScriptCC("rocket")
IncludeScriptCC("slap")
IncludeScriptCC("speed")
IncludeScriptCC("tp")
IncludeScriptCC("vote")
switch (GetGameMainDir()) {
    case "portal2":
        IncludeScriptCC("mpcourse")
        IncludeScriptCC("hub")
        IncludeScriptCC("spchapterp2")

    case "portal_stories":
        IncludeScriptCC("spchaptermel")
}
//--------------------------------------
// Chat command function dependencies
//
// Note: These aren't in functions.nut
// since there's no need to define them
// if the player chooses not to use CC
//--------------------------------------

function GetAdminLevel(plr) {
    foreach (admin in Admins) {
        // Separate the SteamID and the admin level
        local level = split(admin, "[]")[0]
        local SteamID = split(admin, "]")[1]

        if (SteamID == FindPlayerClass(plr).steamid.tostring()) {
            if (SteamID == GetSteamID(1).tostring()) {
                // Host always has max perms even if defined lower
                if (level.tointeger() < 6) {
                    return 6
                }
                // In case more admin levels are added, return values defined higher than 6
                return level.tointeger()
            } else {
                // Use defined value for others
                return level.tointeger()
            }
        }
    }

    // For people who were not defined, check if it's the host
    if (!IsDedicatedServer() && (FindPlayerClass(plr).steamid.tostring() == GetSteamID(1).tostring())) {
        // Automatically give max perms to the listen server host
        Admins.push("[6]" + FindPlayerClass(plr).steamid)
        if (GetDeveloperLevelP2MM()) {
            SendChatMessage("Added max permissions for " + FindPlayerClass(plr).username + " as server operator.", plr)
        }
        return 6
    } else {
        // Not in Admins array nor are they the host, or it is a dedicated server
        return 0
    }
}

function SetAdminLevel(NewLevel, iPlayerIndex) {
    if (!IsDedicatedServer() && iPlayerIndex == 1) {
        SendChatMessage("[ERROR] Cannot change admin level of server operator!")
        return
    }

    local iAdminIndex = 0
    local bFoundIndex = false
    local tPlayerClass = FindPlayerClass(UTIL_PlayerByIndex(iPlayerIndex))
    foreach (admin in Admins) {
        // Separate the SteamID and the admin level
        local level = split(admin, "[]")[0]
        local SteamID = split(admin, "]")[1]

        if (SteamID == tPlayerClass.steamid.tostring()) {
            if (level == NewLevel) {
                SendChatMessage(tPlayerClass.username + "'s admin level is already " + level + ".")
                return
            }
            bFoundIndex = true
            break
        }
        iAdminIndex++
    }

    if (!bFoundIndex) {
        Admins.push("[" + NewLevel + "]" + tPlayerClass.steamid) // Add a new index in the Admins array
    } else {
        Admins.insert(iAdminIndex, "[" + NewLevel + "]" + tPlayerClass.steamid) // Insert updated admin at the existing index
        Admins.remove(iAdminIndex + 1) // REMOVE old copy of admin at the next index
    }

    // Send to everyone
    SendChatMessage("Set " + tPlayerClass.username + "'s admin level to " + NewLevel + ".")
}