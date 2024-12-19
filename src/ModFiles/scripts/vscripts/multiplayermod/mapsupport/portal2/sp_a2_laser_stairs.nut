//  ██████╗██████╗             █████╗ ██████╗            ██╗      █████╗  ██████╗███████╗██████╗             ██████╗████████╗ █████╗ ██╗██████╗  ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔════╝╚══██╔══╝██╔══██╗██║██╔══██╗██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ╚█████╗    ██║   ███████║██║██████╔╝╚█████╗ 
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗            ╚═══██╗   ██║   ██╔══██║██║██╔══██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗██████╔╝   ██║   ██║  ██║██║██║  ██║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_multiple", Vector(144, 600, 94.82), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(144, 704, 72), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_dual_lasers:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}