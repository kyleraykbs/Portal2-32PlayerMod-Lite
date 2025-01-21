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

        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2267, -603, -142), 200), "AddOutput", "OnTrigger p2mm_servercommand:RunScriptCode:setSpawn():0:1", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_multiple", Vector(2656, -696, -1984), 200), "AddOutput", "OnTrigger !self:Kill::0:1", 0, null, null)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_speed_tb_catch:0.45", 0, null)
        
        hCountdownEnableTrigger = Entities.FindByClassnameNearest("trigger_once", Vector(4088, -528, -2080), 32)
        EntFireByHandle(hCountdownEnableTrigger, "Disable", "", 0, null, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        foreach (player in CreateTrigger("player", 3616, -1184, -2512, 3360, -928, -2412)) {
            StartCountTransition(player)
        }
    }
}

function setSpawn() {
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(2318, -600, -142))
    }
    // Set new spawnpoint
    for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-1175, -1248, -78), 600);) {
        p.SetOrigin(Vector(2385, -600, -88))
        p.SetAngles(0 0 0)
    }
}
