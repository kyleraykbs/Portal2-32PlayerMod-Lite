//  ██████╗██████╗             █████╗ ██████╗            ████████╗██╗   ██╗██████╗ ██████╗ ███████╗████████╗           ██████╗ ██╗      █████╗  █████╗ ██╗  ██╗███████╗██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝           ██╔══██╗██║     ██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝              ██║   ██║   ██║██████╔╝██████╔╝█████╗     ██║              ██████╦╝██║     ██║  ██║██║  ╚═╝█████═╝ █████╗  ██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝                ██║   ██║   ██║██╔══██╗██╔══██╗██╔══╝     ██║              ██╔══██╗██║     ██║  ██║██║  ██╗██╔═██╗ ██╔══╝  ██╔══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗   ██║   ╚██████╔╝██║  ██║██║  ██║███████╗   ██║   ██████████╗██████╦╝███████╗╚█████╔╝╚█████╔╝██║ ╚██╗███████╗██║  ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════════╝╚═════╝ ╚══════╝ ╚════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "blast_door").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(64, 1704, 64), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(64, 1776, 40), 1024).Destroy()
                    
        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_laser_vs_turret:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}