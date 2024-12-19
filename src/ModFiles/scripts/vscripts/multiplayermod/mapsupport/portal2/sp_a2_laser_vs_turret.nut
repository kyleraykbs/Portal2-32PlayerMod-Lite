//  ██████╗██████╗             █████╗ ██████╗            ██╗      █████╗  ██████╗███████╗██████╗            ██╗   ██╗ ██████╗           ████████╗██╗   ██╗██████╗ ██████╗ ███████╗████████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██║   ██║██╔════╝           ╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ╚██╗ ██╔╝╚█████╗               ██║   ██║   ██║██████╔╝██████╔╝█████╗     ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗            ╚████╔╝  ╚═══██╗              ██║   ██║   ██║██╔══██╗██╔══██╗██╔══╝     ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗  ╚██╔╝  ██████╔╝██████████╗   ██║   ╚██████╔╝██║  ██║██║  ██║███████╗   ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝   ╚═╝   ╚═════╝ ╚═════════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-631, 377, 322), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-672, 384, 296), 1024).Destroy()
        // Disable the bumper
        Entities.FindByClassnameNearest("func_portal_bumper", Vector(288, -316, 296), 1024).__KeyValueFromString("targetname", "mpmodbumperdis")
        EntFire("mpmodbumperdis", "Deactivate", "", 3, null)
        // Disable the placement helper
        Entities.FindByClassnameNearest("info_placement_helper", Vector(288, -320, 280), 1024).__KeyValueFromString("targetname", "mpmodinfoplacementdis")
        EntFire("mpmodinfoplacementdis", "Disable", "", 3.1, null)
                    
        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_pull_the_rug:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}