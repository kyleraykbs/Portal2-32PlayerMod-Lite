mpcoursenames <- [
    "mp_coop_start",
    "mp_coop_doors",
    "mp_coop_fling_3",
    "mp_coop_wall_intro",
    "mp_coop_tbeam_redirect",
    "mp_coop_paint_come_along",
    "mp_coop_separation_1",
]

CommandList.push(
    class {
        name = "mpcourse"
        level = 4

        // !mpcourse (course integer 1-6)
        function CC(p, args) {
            try{
                args[0] = args[0].tointeger()
            } catch (exception) {
                SendChatMessage("[ERROR] Type in a valid number from 0 to 6.", p)
                return
            }

            if (args.len() == 0 || args[0].tointeger() < 0 || args[0].tointeger() > 6) {
                SendChatMessage("[ERROR] Type in a valid number from 0 to 6.", p)
                return
            }

            local videoname = "coop_bots_load"
            if (args[0] == 0) {
                videoname = "coop_bots_load_wave"
            }

            for (local ent; ent = Entities.FindByClassname(ent, "player");) {
                EntFireByHandle(p2mm_clientcommand, "Command", "playvideo_end_level_transition " + videoname + " 1", 0, ent, ent)
            }
            EntFire("p2mm_servercommand", "command", "changelevel " + mpcoursenames[args[0]], 1, p)
        }
    }
)