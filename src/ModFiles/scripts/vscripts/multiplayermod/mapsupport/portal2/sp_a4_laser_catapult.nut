//  ██████╗██████╗             █████╗   ██╗██╗           ██╗      █████╗  ██████╗███████╗██████╗             █████╗  █████╗ ████████╗ █████╗ ██████╗ ██╗   ██╗██╗     ████████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██║     ╚══██╔══╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ██║  ╚═╝███████║   ██║   ███████║██████╔╝██║   ██║██║        ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗           ██║  ██╗██╔══██║   ██║   ██╔══██║██╔═══╝ ██║   ██║██║        ██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗╚█████╔╝██║  ██║   ██║   ██║  ██║██║     ╚██████╔╝███████╗   ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝ ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚══════╝   ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        Entities.FindByName(null, "lift_1_door_ride").__KeyValueFromString("dmg", "100")
        Entities.FindByName(null, "lift_1_door_1").__KeyValueFromString("dmg", "100")
        Entities.FindByName(null, "lift_1_door_2").__KeyValueFromString("dmg", "100")
        Entities.FindByName(null, "lift_1_door_3").__KeyValueFromString("dmg", "100")
        EntFireByHandle(Entities.FindByClassnameNearest("prop_laser_catcher", Vector(405, -832, 32), 20), "AddOutput", "OnPowered lift_1_powered_rl:Trigger", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "@entry_door-close_door_rl").Destroy()
        Entities.FindByName(null, "lift_1_powered_branch").Destroy()
        Entities.FindByName(null, "lift_1_under_clip").Destroy()
        Entities.FindByClassnameNearest("trigger_multiple", Vector(256, -512, 124), 20).Destroy()
        Entities.FindByName(null, "@exit_door-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(624, -512, 576), 20).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_laser_platform:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(9268, 9268, 9268), 500);) {
            if (p.GetTeam() == TEAM_RED) {
                p.SetOrigin(Vector(-1004, -1146, 35))
                p.SetAngles(0, 90, 0)
                p.SetVelocity(Vector(0, 0, 0))
            } else {
                p.SetOrigin(Vector(-1292, -1171, 35))
                p.SetAngles(0, 90, 0)
                p.SetVelocity(Vector(0, 0, 0))
            }
        }
    }
}