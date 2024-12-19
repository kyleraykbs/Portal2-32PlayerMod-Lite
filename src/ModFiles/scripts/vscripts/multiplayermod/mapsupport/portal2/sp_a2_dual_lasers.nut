//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ██╗   ██╗ █████╗ ██╗                ██╗      █████╗  ██████╗███████╗██████╗  ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██║   ██║██╔══██╗██║                ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║  ██║██║   ██║███████║██║                ██║     ███████║╚█████╗ █████╗  ██████╔╝╚█████╗ 
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║  ██║██║   ██║██╔══██║██║                ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╔╝╚██████╔╝██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ 

StartSphereLook <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(640, 224, 936), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_multiple", Vector(488, 216, 960), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_laser_over_goo:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
        StartSphereLook <- true
    }

    if (MSLoop) {
        if (StartSphereLook) {
            // Make Wheatley look at nearest player
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        }
    }
}