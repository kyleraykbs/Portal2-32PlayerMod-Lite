// ██████╗██████╗             █████╗ ██████╗             █████╗   ███╗
//██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗ ████║
//╚█████╗ ██████╔╝           ███████║ █████╔╝           ██║  ██║██╔██║
// ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██║  ██║╚═╝██║
//██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝███████╗
//╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝ ╚══════╝

HasStartedSp_A3_01 <- false
OnlyOnceSp_A3_01 <- true
stoprenable <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Disable pinging and taunting
        UTIL_Team.Pinging(false)
        UTIL_Team.Taunting(false)

        Entities.FindByName(null, "AutoInstance1-circuit_breaker_lever").__KeyValueFromString("solid", "0")

        // Destroy objects
        Entities.FindByName(null, "transition_trigger").Destroy()
        Entities.FindByName(null, "knockout-teleport").Destroy()
        Entities.FindByName(null, "knockout-teleport-destination").Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(-10304, 2544, 112), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_multiple", Vector(-640, -1520, 456), 20).Destroy()
        
    }

    if (MSPostPlayerSpawn) {
        HasStartedSp_A3_01 <- true
        EntFireByHandle(Entities.FindByName(null, "global_ents-proxy"), "OnProxyRelay8", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "knockout_start"), "Trigger", "", 1, null, null)

        printlP2MM(0, true, "MSPostPlayerSpawn Ran")
        Sp_A3_01Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        Sp_A3_01Viewcontrol.__KeyValueFromString("targetname", "Sp_A3_01Viewcontrol")
        Sp_A3_01Viewcontrol.__KeyValueFromString("target_team", "-1")
        Sp_A3_01Viewcontrol.SetOrigin(Entities.FindByName(null, "knockout-viewcontroller").GetOrigin())
        Sp_A3_01Viewcontrol.SetAngles(0, 270, 0)
        EntFire("Sp_A3_01Viewcontrol", "setparent", "knockout-viewcontroller", 0, null)
        EntFire("Sp_A3_01Viewcontrol", "setparentattachment", "knockout-viewcontroller", 0, null)
        EntFire("Sp_A3_01Viewcontrol", "Enable", "", 0, null)
        EntFire("Sp_A3_01ViewcontrolTele", "disable", "", 13, null)
        EntFire("Sp_A3_01Viewcontrol", "AddOutput", "targetname Sp_A3_01ViewcontrolTele", 0.25, null)
        EntFire("Sp_A3_01ViewcontrolTele", "AddOutput", "targetname Sp_A3_01ViewcontrolDone", 13, null)
        EntFire("basement_elevator_complete_rl", "AddOutput", "OnTrigger p2mm_servercommand:command:script UTIL_Team.Pinging(true, 0.5)")
        EntFire("basement_elevator_complete_rl", "AddOutput", "OnTrigger p2mm_servercommand:command:script UTIL_Team.Taunting(true, 0.5)")
    }

    if (MSOnPlayerJoin) {
        if (stoprenable) {
            printlP2MM(0, true, "Player Joined (Reseting Viewcontrols)")
            EntFire("Sp_A3_01Viewcontrol", "disable", "", 0.5, null)
            EntFire("Sp_A3_01Viewcontrol", "Disable", "", 0.6, null)
        }
    }

    if (MSLoop) {
        local p = Entities.FindByClassnameWithin(null, "player", Vector(-10240, 3072, 36), 128)
        try {
            if (p.GetOrigin().z >= -128) {
                p.SetOrigin(Vector(-720, -1852, 14))
                p.SetAngles(0, 60, 0)
            }
        } catch(exception) {}

        if (!HasStartedSp_A3_01) {
            EntFireByHandle(Entities.FindByName(null, "knockout-fadeout"), "fade", "", 0, null, null)
        }

        if (Entities.FindByName(null, "Sp_A3_01ViewcontrolTele")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-162, -1966, 0))
                p.SetVelocity(Vector(0, 0, 0))
                p.SetAngles(-80, 90, 0)
            }
        }

        if (OnlyOnceSp_A3_01) {
            if (Entities.FindByName(null, "Sp_A3_01ViewcontrolDone")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-720, -1852, 14))
                    p.SetAngles(0, 60, 0)
                }
                UTIL_Team.Pinging(true, "all", 1)
                UTIL_Team.Taunting(true, "all", 1)
                stoprenable <- true
                Entities.FindByName(null, "knockout-viewcontroller-prop").Destroy()
                Entities.FindByName(null, "knockout-portalgun").Destroy()
                OnlyOnceSp_A3_01 <- false
            }
        }

        // Elevator changelevel
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(6016, 4496, -448), 100);) {
            EntFire("instanceauto1-exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a3_03", 2)
        }
    }
}