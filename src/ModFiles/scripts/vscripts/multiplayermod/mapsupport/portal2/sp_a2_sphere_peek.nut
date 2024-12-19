//  ██████╗██████╗             █████╗ ██████╗             ██████╗██████╗ ██╗  ██╗███████╗██████╗ ███████╗           ██████╗ ███████╗███████╗██╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔════╝██╔══██╗██║  ██║██╔════╝██╔══██╗██╔════╝           ██╔══██╗██╔════╝██╔════╝██║ ██╔╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ╚█████╗ ██████╔╝███████║█████╗  ██████╔╝█████╗             ██████╔╝█████╗  █████╗  █████═╝ 
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝              ╚═══██╗██╔═══╝ ██╔══██║██╔══╝  ██╔══██╗██╔══╝             ██╔═══╝ ██╔══╝  ██╔══╝  ██╔═██╗ 
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╔╝██║     ██║  ██║███████╗██║  ██║███████╗██████████╗██║     ███████╗███████╗██║ ╚██╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝

Cardio <- true
StartSphereLook <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-544, 1096, 464), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-544, 992, 488), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_ricochet:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
        StartSphereLook <- true
    }

    if (MSLoop) {
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1259.1446533203, 1557.3728027344, 455.14566040039), 280);) {
            Cardio <- false
        }

        // Find every player within 600 units of -1953 1570 575
        if (Cardio) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1953, 1570, 575), 600);) {
                local p2 = Entities.FindByClassnameNearest("player", Vector(-1953, 1570, 575), 10620)
                if (p != p2) {
                    p.SetOrigin(Vector(-2230, 1725, -90))
                    p.SetVelocity(Vector(0, 0, 0))
                }
            }
        }

        if (StartSphereLook) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        }
    }
}