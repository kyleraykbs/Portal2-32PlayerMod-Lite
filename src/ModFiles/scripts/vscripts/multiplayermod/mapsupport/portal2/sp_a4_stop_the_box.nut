//  ██████╗██████╗             █████╗   ██╗██╗            ██████╗████████╗ █████╗ ██████╗            ████████╗██╗  ██╗███████╗           ██████╗  █████╗ ██╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗           ╚══██╔══╝██║  ██║██╔════╝           ██╔══██╗██╔══██╗╚██╗██╔╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ╚█████╗    ██║   ██║  ██║██████╔╝              ██║   ███████║█████╗             ██████╦╝██║  ██║ ╚███╔╝ 
//  ╚═══██╗██╔═══╝            ██╔══██║███████║            ╚═══██╗   ██║   ██║  ██║██╔═══╝               ██║   ██╔══██║██╔══╝             ██╔══██╗██║  ██║ ██╔██╗ 
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██████╔╝   ██║   ╚█████╔╝██║     ██████████╗   ██║   ██║  ██║███████╗██████████╗██████╦╝╚█████╔╝██╔╝╚██╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝     ╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝  ╚════╝ ╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        Entities.FindByName(null, "music.sp_a4_stop_the_box_b1").__KeyValueFromString("targetname", "moja")
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "movelinear_light_track"), "AddOutput", "OnFullyOpen moja:PlaySound", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_laser_catapult:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}