//  ██████╗██████╗             █████╗ ██████╗             █████╗  █████╗ ██╗     ██╗   ██╗███╗   ███╗███╗  ██╗           ██████╗ ██╗      █████╗  █████╗ ██╗  ██╗███████╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██║     ██║   ██║████╗ ████║████╗ ██║           ██╔══██╗██║     ██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║  ╚═╝██║  ██║██║     ██║   ██║██╔████╔██║██╔██╗██║           ██████╦╝██║     ██║  ██║██║  ╚═╝█████═╝ █████╗  ██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║  ██╗██║  ██║██║     ██║   ██║██║╚██╔╝██║██║╚████║           ██╔══██╗██║     ██║  ██║██║  ██╗██╔═██╗ ██╔══╝  ██╔══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗╚█████╔╝╚█████╔╝███████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚███║██████████╗██████╦╝███████╗╚█████╔╝╚█████╔╝██║ ╚██╗███████╗██║  ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝ ╚════╝  ╚════╝ ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚══╝╚═════════╝╚═════╝ ╚══════╝ ╚════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

OnlyOnceSpA2ColumBlocker1 <- true
OnlyOnceSpA2ColumBlocker2 <- true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        // Enable pinging and taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(true)

        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        // Kill the point_teleport so we aren't teleporting 33 players to the exact same place
        Entities.FindByName(null, "blackout_teleport_player_to_surprise").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-976, 256, 32), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-1056, 256, 40.25), 1024).Destroy()

        Entities.FindByName(null, "officedoor_1").__KeyValueFromString("targetname", "MPModOfficeDoorOverride")

        EntFire("surprise_room_door_relay", "AddOutput", "OnTrigger MPModOfficeDoorOverride:SetAnimation:Open", 0, null)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_laser_chaining:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()

        Entities.FindByClassnameNearest("trigger_once", Vector(-1394, 108, -1906) 5).__KeyValueFromString("spawnflags", "4201")
        Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -1215.75) 5).__KeyValueFromString("spawnflags", "4201")
        Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -1375.75) 5).__KeyValueFromString("spawnflags", "4201")
        Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -2591.75) 5).__KeyValueFromString("spawnflags", "4201")

        Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -3007.75), 1024).__KeyValueFromString("spawnflags", "4201")
        EntFire(Entities.FindByClassnameNearest("trigger_once", Vector(-1472, 256, -3007.75), 1024), "AddOutput", "OnTrigger p2mm_servercommand:command:script UTIL_Team.Pinging(true, \"all\"); script UTIL_Team.Taunting(true, \"all\")", 0, null)
    }

    if (MSLoop) {
        // Teleport players after blackout
        if (OnlyOnceSpA2ColumBlocker1) {
            if (!Entities.FindByClassnameNearest("trigger_once", Vector(-76, -1040, 311.5), 3)) {
                // Find all players
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-64, -1088, 256))
                    p.SetAngles(0, 90, 0)
                }
                OnlyOnceSpA2ColumBlocker1 <- false
            }
        }

        // Elevator viewcontrol and changelevel
        if (OnlyOnceSpA2ColumBlocker2) {
            if (!Entities.FindByClassnameNearest("trigger_once", Vector(-1486, 256, -139.75), 10)) {
                OnlyOnceSpA2ColumBlocker2 <- false
                printlP2MM(0, true, "Elevator viewcontrol activated!")
                SpA2ColumBlockerViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
                SpA2ColumBlockerViewcontrol.__KeyValueFromString("target_team", "-1")
                SpA2ColumBlockerViewcontrol.__KeyValueFromString("fov", "100")
                SpA2ColumBlockerViewcontrol.__KeyValueFromString("targetname", "SpA2ColumBlockerViewcontrol")
                SpA2ColumBlockerViewcontrol.SetOrigin(Vector(-1475, 256, -90))
                EntFire("SpA2ColumBlockerViewcontrol", "setparent", "departure_elevator-elevator_1", 0, null)
                SpA2ColumBlockerViewcontrol.SetAngles(0, 0, 0)
                EntFire("SpA2ColumBlockerViewcontrol", "Enable", "", 0, null)
                EntFireByHandle(Entities.FindByName(null, "departure_elevator-spherebot_1_bottom_swivel_1"), "SetTargetEntity", "SpA2ColumBlockerViewcontrol", 0, null, null)

                UTIL_Team.Pinging(false)
                UTIL_Team.Taunting(false)

                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-1964, 331, -2479))
                }
            }
        }
    }
}
