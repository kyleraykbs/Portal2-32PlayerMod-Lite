//  ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗ ███╗   ███╗██████╗            ███████╗██╗     ██╗███╗  ██╗ ██████╗  ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗████╗ ████║██╔══██╗           ██╔════╝██║     ██║████╗ ██║██╔════╝ ██╔════╝
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██████╦╝██║  ██║██╔████╔██║██████╦╝           █████╗  ██║     ██║██╔██╗██║██║  ██╗ ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔══██╗██║  ██║██║╚██╔╝██║██╔══██╗           ██╔══╝  ██║     ██║██║╚████║██║  ╚██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗██████╦╝╚█████╔╝██║ ╚═╝ ██║██████╦╝██████████╗██║     ███████╗██║██║ ╚███║╚██████╔╝██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚═════╝  ╚════╝ ╚═╝     ╚═╝╚═════╝ ╚═════════╝╚═╝     ╚══════╝╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "InstanceAuto8-entrance_lift_train"), "StartForward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "fade_to_death-proxy").Destroy()
    }

    if (MSLoop) {
        // Goo Damage Code
        try {
            if (GooHurtTimerPred) { printl() }
        } catch (exception) {
            GooHurtTimerPred <- 0
        }

        if (GooHurtTimerPred<=Time()) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z < -1481) {
                    EntFireByHandle(p, "sethealth", "-20", 0, null, null)
                }
            }
            GooHurtTimerPred = Time() + 1
        }

        // Elevator changelevel
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-256, 1570, 1288), 100);) { 
            EntFire("exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a3_crazy_box", 2)
        }
    }
}