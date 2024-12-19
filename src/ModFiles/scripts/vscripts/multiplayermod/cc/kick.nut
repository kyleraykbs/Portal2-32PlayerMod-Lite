CommandList.push(
    class {
        name = "kick"
        level = 5

        // !kick (target arg: player)
        function CC(p, args) {
            if (args.len() == 0) {
                SendChatMessage("[ERROR] Input a player name!", p)
                return
            }

            args[0] = strip(args[0])

            if (FindPlayerByName(args[0]) == null) {
                SendChatMessage("[ERROR] Player not found!", p)
                return
            }
            if (FindPlayerByName(args[0]) == p) {
                SendChatMessage("[ERROR] Cannot kick yourself!", p)
                return
            }
            if (!IsDedicatedServer()) {
                if (FindPlayerByName(args[0]) == UTIL_PlayerByIndex(1)) {
                    SendChatMessage("[ERROR] Cannot kick server operator!", p)
                    return
                }
            }

            // Send this message right before kicking in case the class gets destroyed
            SendChatMessage("[KICK] Kicked " + FindPlayerClass(FindPlayerByName(args[0])).username + " from the server.")

            // Players can still join the game again if you use this
            EntFire("p2mm_servercommand", "command", "kick " + FindPlayerClass(FindPlayerByName(args[0])).username)
        }
    }
)