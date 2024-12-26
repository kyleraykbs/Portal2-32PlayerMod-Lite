//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗███████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗ ██████╗
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗╚════██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝ ╚═════╝

OnlyOnceSp_A2_Bts5 <- true
OnlyOnceTPSP_A2_BTS5 <- true
LoopEnablerSP_A2_BTS5 <- false
OldTimeMapSupport <- 0

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    // We need to do something with the elevator or use teleports so all players can get up (Moja)
    // We also need to polish the point_viewcontrol somehow to better funnel the players into the vactube (Moja)
    if (MSInstantRun) {
        // Open the airlock areaportal on mapspawn
        EntFireByHandle(Entities.FindByName(null, "airlock_door_01_areaportal"), "Open", "", 0, null, null)
        // Set sv_allow_mobile_portals to 1 and set up the changelevel command entity
        EntFire("p2mm_servercommand", "command", "sv_allow_mobile_portals 1", 1, null)
        // Set the viewcontrol parent first stop to a our pathtrack
        EntFireByHandle(Entities.FindByName(null, "podtrain_player"), "target", "tube_path1", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "airlock_door_01-close_door_fast").Destroy()
        Entities.FindByName(null, "lock_door_trigger").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(3794.06, -1727.98, 3488), 20).Destroy()
    }

    if (MSPostPlayerSpawn) {
        Entities.FindByName(null, "airlock_door_01_areaportal").__KeyValueFromString("targetname", "moja")
        EntFireByHandle(Entities.FindByName(null, "@transition_script"), "RunScriptCode", "OnPostTransition()", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "exit_airlock_door-proxy"), "OnProxyRelay1", "", 0.5, null, null)
    }

    if (MSLoop) {
        if (OldTimeMapSupport + 0.1 <= Time()) {
            foreach (p in CreateTrigger(null, 2022.2529296875, 1891.5144042969, 4128.41015625, 2809.6022949219, 1490.4871826172, 3846.3054199219)) {
                if (p.GetClassname() == "npc_portal_turret_floor") {
                    if (p.GetOrigin().z > 4000) {
                        p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y-50, 4020))
                    } else {
                        p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y-40, 3890))
                    }
                }
                OldTimeMapSupport <- Time()
            }
        }


        // Find all players within
        if (!LoopEnablerSP_A2_BTS5) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(2944, 942, 4418), 80);) {
                LoopEnablerSP_A2_BTS5 <- true
            }
        }

        // Teleport everyone on the ground to the elevator
        if (LoopEnablerSP_A2_BTS5) {
            // Find all players under the elevator
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z<=4100) {
                    p.SetOrigin(Vector(2929, 942, 4418))
                    p.SetAngles(0, 180, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
            }
        }

        // Make the elevator go up with the players in it
        if (OnlyOnceTPSP_A2_BTS5) {
            if (!Entities.FindByClassnameNearest("trigger_once", Vector(2941.5, 944, 3662), 20)) {
                printlP2MM(0, true, "OnlyOnceTPSP_A2_BTS5 Triggered")
                //Find all players
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(2944, 942, 3700))
                    p.SetAngles(0, 180, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
                OnlyOnceTPSP_A2_BTS5 <- false
            }
        }

        if (OnlyOnceSp_A2_Bts5) {
            if (!Entities.FindByName(null, "exit_tube_1_exit_trigger")) {
                printlP2MM(0, true, "Suction viewcontrol activated")
                // Sp_A2_Bts5 viewcontrol
                Sp_A2_Bts5Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                Sp_A2_Bts5Viewcontrol.__KeyValueFromString("target_team", "-1")
                Sp_A2_Bts5Viewcontrol.__KeyValueFromString("fov", "100")
                Sp_A2_Bts5Viewcontrol.__KeyValueFromString("targetname", "Sp_A2_Bts5Viewcontrol")
                Sp_A2_Bts5Viewcontrol.SetOrigin(Vector(2285, 512, 4508))
                EntFire("Sp_A2_Bts5Viewcontrol", "setparent", "podtrain_player", 0, null)
                Sp_A2_Bts5Viewcontrol.SetAngles(0, 180, 0)
                EntFire("Sp_A2_Bts5Viewcontrol", "Enable", "", 0, null)

                local tube_path1 = Entities.CreateByClassname("path_track")
                tube_path1.__KeyValueFromString("targetname", "tube_path1")
                tube_path1.__KeyValueFromString("target", "tube_path2")
                tube_path1.__KeyValueFromString("orientationtype", "0")

                EntFire("p2mm_servercommand", "command", "changelevel sp_a2_bts6", 2, null)

                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-1964, 331, -2479))
                }

                OnlyOnceSp_A2_Bts5 <- false
            }
        }
        // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
        try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        } catch(exception) {}
    }
}