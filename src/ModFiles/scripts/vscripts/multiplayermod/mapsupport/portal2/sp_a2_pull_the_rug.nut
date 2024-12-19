//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ██╗   ██╗██╗     ██╗                ████████╗██╗  ██╗███████╗           ██████╗ ██╗   ██╗ ██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██║   ██║██║     ██║                ╚══██╔══╝██║  ██║██╔════╝           ██╔══██╗██║   ██║██╔════╝ 
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝██║   ██║██║     ██║                   ██║   ███████║█████╗             ██████╔╝██║   ██║██║  ██╗ 
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔═══╝ ██║   ██║██║     ██║                   ██║   ██╔══██║██╔══╝             ██╔══██╗██║   ██║██║  ╚██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║     ╚██████╔╝███████╗███████╗██████████╗   ██║   ██║  ██║███████╗██████████╗██║  ██║╚██████╔╝╚██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝      ╚═════╝ ╚══════╝╚══════╝╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "exit_lift").__KeyValueFromString("dmg", "100")
        Entities.FindByClassnameNearest("prop_dynamic", Vector(80, -755, 256), 1024).SetOrigin(Vector(72, -777, 192))
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "prevent_ratman_backtrack").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(64, 896, 104), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(64, 888, 96), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_column_blocker:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}