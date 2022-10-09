//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
//    ___  _           _
//   / __|| |_   __ _ | |_
//  | (__ | ' \ / _` ||  _|
//   \___||_||_|\__,_| \__|                  _      _
//   / __| ___  _ __   _ __   __ _  _ _   __| | ___(_)
//  | (__ / _ \| '  \ | '  \ / _` || ' \ / _` |(_-< _
//   \___|\___/|_|_|_||_|_|_|\__,_||_||_|\__,_|/__/(_)
//---------------------------------------------------
// Purpose: Enable commands through the chat box.
//---------------------------------------------------

// TODO:
// 1. Fix how we work out arguments for
//    players with spaces in their names

if (Config_UseChatCommands) {
    // This can only be enabled when the plugin is loaded
    if (PluginLoaded) {
        if (GetDeveloperLevel()) {
            printl("(P2:MM): Adding chat callback for chat commands.")
        }
        AddChatCallback("ChatCommands")
    } else {
        if (GetDeveloperLevel()) {
            printl("(P2:MM): Can't add chat commands since no plugin is loaded!")
        }
        return
    }
} else {
    printl("(P2:MM): Config_UseChatCommands is false. Not adding chat callback for chat commands!")
    // If AddChatCallback() was called at one point during the session, the game will still check for chat callback even after map changes.
    // So, if someone doesn't want CC midgame, just redefine the function to do nothing.
    function ChatCommands(ccuserid, ccmessage) {}
    return
}
// The real chat command doesn't have the "!"
function RemoveCommandPrefix (s) {
    return Replace(s, "!", "")
}

function GetCommandFromString(str) {
    foreach (cmd in CommandList) {
        if (StartsWith(str.tolower(), cmd.name)) {
            return cmd
        }
    }
    return null
}

// The whole filtering process for the chat commands
function ChatCommands(ccuserid, ccmessage) {

    local Message = strip(RemoveDangerousChars(ccmessage))
    local Player = GetPlayerFromUserID(ccuserid)
    local Inputs = SplitBetween(Message, "!@", true)
    local PlayerClass = FindPlayerClass(Player)
    local Username = PlayerClass.username
    local AdminLevel = GetAdminLevel(Player)

    local Commands = []
    local Runners = []



    //--------------------------------------------------

    // Be able to tell what is and isn't a chat command
    foreach (Input in Inputs) {
        if (!StartsWith(Input, "!")) {
            return
        }
        if (Message.len() < 3) {
            return
        }
        if (Message.slice(0, 4) == "!SAR") {
            return // speedrun plugin events can interfere
        }
        if (Message.slice(0, 2) != "!!" && Message.slice(0, 2) != "! ") {
            Commands.push(RemoveCommandPrefix(Input))
        }
    }

    // Register the activating player
    if (Runners.len() == 0) {
        Runners.push(Player)
    }

    foreach (Command in Commands) {
        // Split arguments
        Command = Strip(Command)

        local Args = SplitBetween(Command, " ", true)
        if (Args.len() > 0) {
            Args.remove(0)
        }

        Command = GetCommandFromString(Command)

        // We met the criteria, run it
        foreach (CurPlayer in Runners) {
            // Do we have the correct admin level for this command?
            if (!(Command.level <= AdminLevel)) {
                return SendChatMessage("[ERROR] You do not have permission to use this command.", CurPlayer)
            }

            // Does the exact command exist?
            if (Command == null) {
                return SendChatMessage("[ERROR] Command not found.", CurPlayer)
            }

            RunChatCommand(Command, Args, CurPlayer)
        }
    }
}

//=======================================
// Chat command content
//=======================================

CommandList <- [
    class {
        name = "noclip"
        level = 4

        // !noclip
        function CC(p, args) {
            local pclass = FindPlayerClass(p)
            if (pclass.noclip) {
                EnableNoclip(false, p)
            } else {
                EnableNoclip(true, p)
            }
        }
    }
    ,
    class {
        name = "kill"
        level = 0

        // !kill
        function CC(p, args) {
            function KillPlayer(player) {
                EntFireByHandle(player, "sethealth", "-100", 0, player, player)
            }

            function KillPlayerMessage(iTextIndex, player) {
                KillPlayerText <- [
                    "Killed yourself.",
                    "Killed player.",
                    "Killed all players."
                    "[ERROR] Player not found."
                ]
                EntFireByHandle(p2mm_clientcommand, "Command", "say " + KillPlayerText[iTextIndex], 0, player, player)
            }

            if (GetAdminLevel(p) < 2) {
                KillPlayer(p)
                KillPlayerMessage(0, p)
            }
            else if (GetAdminLevel(p) >= 2) {
                try {
                    args[0] = Strip(args[0])

                    if (args[0] != "all") {
                        local q = FindPlayerByName(args[0])
                        if (q != null) {
                            KillPlayer(q)
                            KillPlayerMessage(1, p)
                        } else {
                            KillPlayerMessage(3, p)
                        }
                    } else {
                        local p2 = null
                        while (p2 = Entities.FindByClassname(p2, "player")) {
                            KillPlayer(p2)
                        }
                        KillPlayerMessage(2, p)
                    }
                } catch (exception) {
                    KillPlayer(p)
                    KillPlayerMessage(0, p)
                }
            }
        }
    }
    ,
    class {
        name = "changeteam"
        level = 0

        // !changeteam (optionally with args)
        function CC(p, args) {
            try {
                args[0] = Strip(args[0])
                if (args[0] == "0" || args[0] == "2" || args[0] == "3" ) {
                    if (p.GetTeam() == args[0].tointeger()) {
                        return EntFireByHandle(p2mm_clientcommand, "Command", "say [ERROR] You are already on this team.", 0, p, p)
                    } else {
                        p.SetTeam(args[0].tointeger())
                        return EntFireByHandle(p2mm_clientcommand, "Command", "say Team is now set to " + teams[args[0].tointeger()] + ".", 0, p, p)
                    }
                }
                EntFireByHandle(p2mm_clientcommand, "Command", "say [ERROR] Enter a valid team number: 0, 2, or 3.", 0, p, p)
            } catch (exception) {
                // No argument, so just cycle through the teams
                if (args.len() == 0) {
                    local iNewTeam = null
                    switch (p.GetTeam()) {
                        case 0: iNewTeam = 2;   break;
                        // case 1: iNewTeam = 2;   break;
                        case 2: iNewTeam = 3;   break;
                        case 3: iNewTeam = 0;   break;
                    }
                    p.SetTeam(iNewTeam)
                    EntFireByHandle(p2mm_clientcommand, "Command", "say Toggled to " + teams[iNewTeam] + " team.", 0, p, p)
                }
            }
        }
    }
    ,
    class {
        name = "speed"
        level = 4

        // !speed (float arg)
        function CC(p, args) {
            try {
                SetSpeed(p, args[0].tofloat())
            } catch (exception) {
                EntFireByHandle(p2mm_clientcommand, "Command", "say [ERROR] Input a number.", 0, p, p)
            }
        }
    }
    ,
    class {
        name = "teleport"
        level = 4

        // !teleport (going to this username) (bring this player or "all")
        function CC(p, args) {

            if (args.len() == 0) {
                SendChatMessage("[ERROR] Input a player name.", p)
                return
            }
            if (args.len() > 2) {
                SendChatMessage("[ERROR] Too many arguments given", p)
                return
            }

            // args[0] -> player to teleport to
            // args[1] if exist -> player to bring
            args[0] = Strip(args[0])

            local plr = FindPlayerByName(args[0])

            if (plr == null) {
                SendChatMessage("[ERROR] Player not found.", p)
                return
            }

            if (args.len() == 1){
                if (plr == p) {
                    SendChatMessage("[ERROR] Can't teleport to yourself", p)
                    return
                }

                p.SetOrigin(plr.GetOrigin())
                p.SetAngles(plr.GetAngles().x, plr.GetAngles().y, plr.GetAngles().z)
                SendChatMessage("Teleported to player.", p)
                return
            }

            args[1] = Strip(args[1])
            local plr2 = FindPlayerByName(args[1])

            if (args[1] != "all" && plr2 == null){
                SendChatMessage("[ERROR] Third argument is invalid! Use \"all\" or a player's username.", p)
                return
            }

            // if second argument was "all"
            if (args[1] == "all") {
                local q = null
                while (q = Entities.FindByClassname(q, "player")) {
                    // Don't modify the player we are teleporting to
                    if (q != plr) {
                        q.SetOrigin(plr.GetOrigin())
                        q.SetAngles(plr.GetAngles().x, plr.GetAngles().y, plr.GetAngles().z)
                    }
                }
                if (plr == p) {
                    SendChatMessage("Brought all players.", p)
                } else {
                    SendChatMessage("Teleported all players.", p)
                }
                return
            }

            if (plr == p && plr == plr2) {
                return SendChatMessage("[ERROR] Can't teleport player to the same player.", p)
            }

            // if the second argument is a player
            plr2.SetOrigin(plr.GetOrigin())
            plr2.SetAngles(plr.GetAngles().x, plr.GetAngles().y, plr.GetAngles().z)
            if (plr2 == p) {
                return SendChatMessage("Teleported to player.", p)
            } else {
                return SendChatMessage("Teleported player.", p)
            }
        }
    }
    ,
    class {
        name = "rcon"
        level = 6

        // !rcon (args)
        function CC(p, args) {
            try {
                args[0] = Strip(args[0])
                local cmd = Join(args, "")
                SendToConsoleP2MM(cmd)
            } catch (exception) {
                EntFireByHandle(p2mm_clientcommand, "Command", "say [ERROR] Input a command.", 0, p, p)
            }
        }
    }
    ,
    class {
        name = "restartlevel"
        level = 5

        // !restartlevel
        function CC(p, args) {
            if (!IsOnSingleplayerMaps) {
                for (local ent; ent = Entities.FindByClassname(ent, "player");) {
                    EntFireByHandle(p2mm_clientcommand, "Command", "playvideo_end_level_transition coop_bots_load 1", 0, ent, ent)
                }
            }
            EntFire("p2mm_servercommand", "command", "changelevel " + GetMapName(), 1, null)
        }
    }
    ,
    class {
        name = "help"
        level = 0

        // !help (optionally with command name arg)
        function CC(p, args) {
            try {
                args[0] = Strip(args[0])
                if (commandtable.rawin(args[0])) {
                    EntFireByHandle(p2mm_clientcommand, "Command", "say [HELP] " + args[0] + ": " + commandtable[args[0]], 0, p, p)
                }
                else {
                    EntFireByHandle(p2mm_clientcommand, "Command", "say [HELP] Unknown chat command: " + args[0], 0, p, p)
                }
            } catch (exception) {
                SendChatMessage("[HELP] Your available commands:", p)
                foreach (command in CommandList) {
                    if (command.level <= GetAdminLevel(p)) {
                        SendChatMessage("[HELP] " + command.name, p)
                    }
                }
                SendChatMessage("[HELP] This command can also print a description for another if supplied with it.", p)
            }
        }
    }
    ,
    class {
        name = "spchapter"
        level = 5

        // !spchapter (integer arg)
        function CC(p, args) {
            try{
                args[0] = args[0].tointeger()
            } catch (err){
                SendChatMessage("Type in a valid number from 1 to 9.", p)
                return
            }

            if (args[0].tointeger() < 1 || args[0].tointeger() > 9) {
                SendChatMessage("Type in a valid number from 1 to 9.", p)
                return
            }

            EntFire("p2mm_servercommand", "command", "changelevel " + spchapternames[args[0]-1], 0, p)
        }
    }
    ,
    class {
        name = "mpcourse"
        level = 5

        // !mpcourse (integer arg)
        function CC(p, args) {
            try{
                args[0] = args[0].tointeger()
            } catch (err){
                SendChatMessage("Type in a valid number from 0 to 6.", p)
                return
            }

            if (args.len() == 0 || args[0].tointeger() < 0 || args[0].tointeger() > 6) {
                SendChatMessage("Type in a valid number from 0 to 6.", p)
                return
            }

            local videoname;
            if (args[0] == 0) {
                videoname = "coop_bots_load_wave"
            } else {
                videoname = "coop_bots_load"
            }

            for (local ent; ent = Entities.FindByClassname(ent, "player");) {
                EntFireByHandle(p2mm_clientcommand, "Command", "playvideo_end_level_transition " + videoname + " 1", 0, ent, ent)
            }
            EntFire("p2mm_servercommand", "command", "changelevel " + mpcoursenames[args[0]], 1, p)
        }
    }
    ,
    class {
        name = "playercolor"
        level = 0

        // !playercolor (r OR reset) (g) (b) (optional: someone's name)
        function CC(p, args) {
            local ErrorOut = function(p) {
                SendChatMessage("Type in three valid RGB integers from 0 to 255 separated by a space OR 'reset'.", p)
            }

            try {
                args[0] = Strip(args[0])
            } catch (exception) {
                return ErrorOut(p)
            }

            if (args[0] == "reset") {
                local pTargetPlayer = p
                local pTargetPlayerText = "your"
                try {
                    args[1] = Strip(args[1])
                    local plr = FindPlayerByName(args[1])
                    if (plr == null) {
                        return SendChatMessage("[ERROR] Player not found.", pTargetPlayer)
                    }
                    if (plr != p) {
                        pTargetPlayer = plr
                        pTargetPlayerText = FindPlayerClass(pTargetPlayer).username + "'s"
                    }

                } catch (exception) {}
                // Update the player class (RESET BACK TO DEFAULT WITH MULTIPLYING)
                FindPlayerClass(pTargetPlayer).color = GetPlayerColor(pTargetPlayer)

                // Color the player without multiplying the value
                local pColor = GetPlayerColor(pTargetPlayer, false)
                EntFireByHandle(pTargetPlayer, "color", pColor.r + " " + pColor.g + " " + pColor.b, 0, p, p)
                SendChatMessage("Successfully reset " + pTargetPlayerText + " color.", p)
                return
            }

            try {
                args[1] = Strip(args[1])
            } catch (exception) {
                return ErrorOut(p)
            }

            try {
                args[2] = Strip(args[2])
            } catch (exception) {
                return ErrorOut(p)
            }

            function IsNumberValidRGBvalue(x) {
                try {
                    x = x.tointeger()
                } catch (err) {
                    return false
                }

                if (x >= 0 && x <= 255) {
                    return true
                }
                return false
            }

            // Make sure that all args are integers
            for (local i = 0; i < 3 ; i++) {
                if (!IsNumberValidRGBvalue(args[i])) {
                    return ErrorOut(p)
                }
                args[i] = args[i].tointeger()
            }

            local pTargetPlayer = p
            local pTargetPlayerText = "your"

            // Is there a player name specified?
            args[3] = Strip(args[3])
            local plr = FindPlayerByName(args[3])

            if (plr == null) {
                return SendChatMessage("[ERROR] Player not found.", p)
            }

            if (GetAdminLevel(p) < 2 && plr != p) {
                return SendChatMessage("[ERROR] You need to have admin level 2 or higher to use on others.", p)
            }

            if (plr != p) {
                pTargetPlayer = plr
                pTargetPlayerText = FindPlayerClass(plr).username + "'s"
            }

            // Doing this so that if someone picks a color that we actually
            // have a preset name for, it will switch the name to it
            local NewColorName = "Custom Color"
            for (local i = 1; i <= 16; i++) {
                local color = GetPlayerColor(i, false)
                if (color.r == args[0] && color.g == args[1] && color.b == args[2]) {
                    NewColorName = color.name
                    break
                }
            }

            // Update the player class
            // Note that the color member variable stores the MULTIPLIED versions
            class FindPlayerClass(pTargetPlayer).color {
                r = MultiplyRGBValue(args[0])
                g = MultiplyRGBValue(args[1])
                b = MultiplyRGBValue(args[2])
                name = NewColorName
            }

            EntFireByHandle(pTargetPlayer, "color", args[0].tostring() + " " + args[1].tostring() + " " + args[2].tostring(), 0, p, p)
            SendChatMessage("Successfully changed " + pTargetPlayerText + " color.", p)
        }
    }
    ,
    class {
        name = "adminmodify"
        level = 6

        // !adminmodify (player name) (new admin level)
        function CC(p, args) {
            try {
                args[0] = Strip(args[0])
                local plr = FindPlayerByName(args[0])
                try {
                    args[1] = Strip(args[1])
                    args[1] = args[1].tointeger()
                    try {
                        if (typeof args[1] == "integer") {
                            if (args[1] >= 0 && args[1] <= 6) {
                                SetAdminLevel(args[1].tostring(), plr.entindex())
                            }
                        }
                    } catch (exception) {
                        SendChatMessage("[ERROR] Input a number after the player name to set a new admin level.", p)
                        return
                    }
                } catch (exception) {
                    if (plr != null) {
                        SendChatMessage(GetPlayerName(plr.entindex()) + "'s admin level: " + GetAdminLevel(plr), p)
                    } else {
                        SendChatMessage("[ERROR] Player not found.", p)
                    }
                }
            } catch (exception) {
                EntFireByHandle(p2mm_clientcommand, "Command", "say [ERROR] Input a player name.", 0, p, p)
            }
        }
    }
    // ,
    // class {
    //     name = "spectate"
    //     level = 0

    //     // !spectate
    //     function CC(p, args) {
    //         EntFireByHandle(p, "addoutput", "teamnumber 3", 0, p, p)
    //         EntFireByHandle(p2mm_clientcommand, "command", "spectate", 0, p, p)
    //         EntFireByHandle(p, "addoutput", "teamnumber 3", 3.71, p, p)
    //         EntFireByHandle(p2mm_clientcommand, "command", "spectate", 3.72, p, p)
    //     }
    // }
]

//--------------------------------------
// Chat command function dependencies
//
// Note: These aren't in functions.nut
// since there's no need to define them
// if the player chooses not to use CC
//--------------------------------------

function SendChatMessage(message, pActivatorAndCaller = null) {
    // We try to use server command since that allows the host
    // to send instant messages without any chat refresh delay
    local pEntity = Entities.FindByName(null, "p2mm_servercommand")
    if (pActivatorAndCaller != null && pActivatorAndCaller != Entities.FindByClassname(null, "player")) {
        // Send messages from a specific client
        pEntity = p2mm_clientcommand
    }
    EntFireByHandle(pEntity, "command", "say " + message, 0, pActivatorAndCaller, pActivatorAndCaller)
}

function RunChatCommand(cmd, args, plr) {
    printl("(P2:MM): Running chat command: " + cmd.name)
    printl("(P2:MM): Player: " + GetPlayerName(plr.entindex()))
    cmd.CC(plr, args)
}

function GetPlayerFromUserID(userid) {
    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        if (p.entindex() == userid) {
            return p
        }
    }
    return null
}

function RemoveDangerousChars(str) {
    str = Replace(str, "%n", "") // Can cause crashes!
    if (StartsWith(str, "^")) {
        return ""
    }
    return str
}

// preserve = true : means that the symbol at the beginning of the string will be included in the first part
function SplitBetween(str, keysymbols, preserve = false) {
    local keys = StrToList(keysymbols)
    local lst = StrToList(str)

    local contin = false
    foreach (key in keys) {
        if (Contains(str, key)) {
            contin = true
            break
        }
    }

    if (!contin) {
        return []
    }


    // FOUND SOMETHING

    local split = []
    local curslice = ""

    foreach (indx, letter in lst) {
        local contains = false
        foreach (key in keys) {
            if (letter == key) {
                contains = key
                if (indx == 0 && preserve) {
                    curslice = curslice + letter
                }
            }
        }

        if (contains != false) {
            if (Len(curslice) > 0 && indx > 0) {
                split.push(curslice)
                if (preserve) {
                    curslice = contains
                } else {
                    curslice = ""
                }
            }
        } else {
            curslice = curslice + letter
        }
    }

    if (Len(curslice) > 0) {
        split.push(curslice)
    }

    return split
}

function FindPlayerByName(name) {
    name = name.tolower()
    local best = null
    local bestnamelen = 99999
    local bestfullname = ""

    local p = null
    while (p = Entities.FindByClassname(p, "player")) {
        local username = FindPlayerClass(p).username
        username = username.tolower()

        if (username == name) {
            return p
        }

        if (Len(Replace(username, name, "")) < Len(username) && Len(Replace(username, name, "")) < bestnamelen) {
            best = p
            bestnamelen = Len(Replace(username, name, ""))
            bestfullname = username
        } else if (Len(Replace(username, name, "")) < Len(username) && Len(Replace(username, name, "")) == bestnamelen) {
            if (Find(username, name) < Find(bestfullname, name)) {
                best = p
                bestnamelen = Len(Replace(username, name, ""))
                bestfullname = username
            }
        }
    }
    return best
}

function GetAdminLevel(plr) {
    foreach (admin in Admins) {
        // Seperate the SteamID and the admin level
        local level = split(admin, "[]")[0]
        local SteamID = split(admin, "]")[1]

        if (SteamID == FindPlayerClass(plr).steamid.tostring()) {
            if (SteamID == GetSteamID(1).tostring()) {
                // Host always has max perms even if defined lower
                if (level.tointeger() < 6) {
                    return 6
                }
                // In case we add more admin levels, return values defined higher than 6
                return level.tointeger()
            } else {
                // Use defined value for others
                return level.tointeger()
            }
        }
    }

    // For people who were not defined, check if it's the host
    if (FindPlayerClass(plr).steamid.tostring() == GetSteamID(1).tostring()) {
        // It is, so we automatically give the host max perms
        Admins.push("[6]" + GetSteamID(1))
        SendChatMessage("Added max permissions for " + GetPlayerName(1) + " as server operator.")
        return 6
    } else {
        // Not in Admins array nor are they the host
        return 0
    }
}

function SetAdminLevel(NewLevel, iPlayerIndex) {
    if (iPlayerIndex == 1) {
        SendChatMessage("[ERROR] Cannot change admin level of server operator!")
        return
    }
    Admins.push("[" + NewLevel + "]" + GetSteamID(iPlayerIndex))
    SendChatMessage("Set " + GetPlayerName(iPlayerIndex) + "'s admin level to " + NewLevel + ".")
}