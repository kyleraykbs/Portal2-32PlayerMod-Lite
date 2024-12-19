spchapternamesmel <- [
    "_a1_tramride",
    "_a2_garden_de",
    "_a3_junkyard",
    "_a4_overgrown",
    "_a4_core_access"
]

CommandList.push(
    class {
        name = "spchapter"
        level = 4
        // !spchapter (chapter integer 1-5) for ps:mel
        function CC(p, args) {
            local gamemode = "sp"

            try {
                args[0] = args[0].tointeger()
            } catch (err){
                SendChatMessage("[ERROR] Type in a valid number from 1 to 5, followed optionally by hard or story.", p)
                return
            }

            if (args[0].tointeger() < 1 || args[0].tointeger() > 5) {
                SendChatMessage("[ERROR] Type in a valid number from 1 to 5, followed optionally by hard or story.", p)
                return
            }

            if (args.len() < 2) {
                args.append("hard")
            }

            if (args[1] == "hard" || args[1] == "story") {
                if (args[1] == "hard") {
                    gamemode = "sp"
                } else {
                    gamemode = "st"
                }
            } else {
                gamemode = "sp"
            }
            EntFire("p2mm_servercommand", "command", "changelevel " + gamemode + spchapternamesmel[args[0]-1], 0, p)
        }
    }
)
