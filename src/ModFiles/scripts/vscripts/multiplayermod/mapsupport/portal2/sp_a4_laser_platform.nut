//  ██████╗██████╗             █████╗   ██╗██╗           ██╗      █████╗  ██████╗███████╗██████╗            ██████╗ ██╗      █████╗ ████████╗███████╗ █████╗ ██████╗ ███╗   ███╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██╔══██╗████╗ ████║
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ██████╔╝██║     ███████║   ██║   █████╗  ██║  ██║██████╔╝██╔████╔██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗           ██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝  ██║  ██║██╔══██╗██║╚██╔╝██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗██║     ███████╗██║  ██║   ██║   ██║     ╚█████╔╝██║  ██║██║ ╚═╝ ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝

Sp_A4_Laser_Platform_1 <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "entrance_door-close_door_rl").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2949, -1210, -2266.13), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2267, -603, -142), 200).__KeyValueFromString("targetname", "mpmoddrop")
        Entities.FindByClassnameNearest("trigger_multiple", Vector(2656, -696, -1984), 200).__KeyValueFromString("targetname", "doortriggeroverride")
        EntFire("doortriggeroverride", "AddOutput", "OnStartTouch doortriggeroverride:kill::0.01", 1, null)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_speed_tb_catch:0.45", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        if (!Entities.FindByName(null, "mpmoddrop")) {
            if (!Sp_A4_Laser_Platform_1) {
                Sp_A4_Laser_Platform_1 <- true
                for (local p; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(2318, -600, -142))
                }
            }

            // Set new spawnpoint
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-1175, -1248, -78), 600);) {
                p.SetOrigin(Vector(2385, -600, -88))
                p.SetAngles(0 0 0)
            }
        }
    }
}