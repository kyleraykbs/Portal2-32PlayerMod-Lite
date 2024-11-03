spchapternames <- [
    "sp_a1_intro1",
    "sp_a2_laser_intro",
    "sp_a2_sphere_peek",
    "sp_a2_column_blocker",
    "sp_a2_bts3",
    "sp_a3_00",
    "sp_a3_speed_ramp",
    "sp_a4_intro",
    "sp_a4_finale1"
]

CommandList.push(
    class {
        name = "spchapter"
        level = 4

        // !spchapter (chapter integer 1-9)
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
)
