//  ██████╗██████╗             █████╗ ██████╗                 ██╗██╗   ██╗███╗   ███╗██████╗            ██╗███╗  ██╗████████╗██████╗  █████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗                ██║██║   ██║████╗ ████║██╔══██╗           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║ █████╔╝                ██║██║   ██║██╔████╔██║██████╔╝           ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╗  ██║██║   ██║██║╚██╔╝██║██╔═══╝            ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝

doTeleport <- true
ElevatorFinishMoving <- null
GooHurtTimerPred <- 0

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoCountEnd <- true
        // Destroy objects
        Entities.FindByName(null, "fade_to_death-proxy").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-8880, 2096, -412), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-676, 896, 448), 20).Destroy()
    }

    if (MSPostPlayerSpawn) {
        EntFireByHandle(Entities.FindByName(null, "InstanceAuto12-entrance_lift_train"), "StartForward", "", 2, null, null)
        ElevatorFinishMoving <- Time() + 5
        EntFire("p2mm_servercommand", "RunScriptCode", "doTeleport=false", 2)
    }

    if (MSLoop) {
        // Box check
        if (ElevatorFinishMoving <= Time()) {
            for (local boxp = null; boxp = Entities.FindByClassnameWithin(boxp, "player", Vector(-704, -9152, -335.97), 64);) {
                boxp.SetOrigin(Vector(-8880, 2096, -57.97))
            }
        }

        // Goo Damage Code
        if (GooHurtTimerPred + 0.8 <= Time()) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-667, 977, 1100), 6000);) {
                if (p.GetOrigin().z <= -350) {
                    EntFireByHandle(p, "sethealth", "-100", 0, null, null)
                }
            }
            GooHurtTimerPred = Time()
        }

        if (doTeleport) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-8880, 2096, -458))
            }
        }

        // Elevator changelevel
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-668, 2080, 2314), 100);) {
            EntFire("instanceauto15-exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a3_bomb_flings", 2)
        }
    }
}
