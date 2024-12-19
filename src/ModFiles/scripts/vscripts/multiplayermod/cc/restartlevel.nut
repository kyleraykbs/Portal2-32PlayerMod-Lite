CommandList.push(
    class {
        name = "restartlevel"
        level = 3

        // !restartlevel
        function CC(p, args) {
            if (!g_bIsOnSingleplayerMaps) {
                for (local ent; ent = Entities.FindByClassname(ent, "player");) {
                    EntFireByHandle(p2mm_clientcommand, "Command", "playvideo_end_level_transition coop_bots_load 1", 0, ent, ent)
                }
            }
            EntFire("p2mm_servercommand", "command", "changelevel " + GetMapName(), 1, null)
        }
    }
)