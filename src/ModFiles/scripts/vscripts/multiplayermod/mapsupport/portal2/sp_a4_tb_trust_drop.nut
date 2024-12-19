//  ██████╗██████╗             █████╗   ██╗██╗           ████████╗██████╗            ████████╗██████╗ ██╗   ██╗ ██████╗████████╗           ██████╗ ██████╗  █████╗ ██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ╚══██╔══╝██╔══██╗           ╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║              ██║   ██████╦╝              ██║   ██████╔╝██║   ██║╚█████╗    ██║              ██║  ██║██████╔╝██║  ██║██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║███████║              ██║   ██╔══██╗              ██║   ██╔══██╗██║   ██║ ╚═══██╗   ██║              ██║  ██║██╔══██╗██║  ██║██╔═══╝ 
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗   ██║   ██████╦╝██████████╗   ██║   ██║  ██║╚██████╔╝██████╔╝   ██║   ██████████╗██████╔╝██║  ██║╚█████╔╝██║     
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝   ╚═╝   ╚═════╝ ╚═════════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝   ╚═════════╝╚═════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝     

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        Entities.FindByName(null, "music1").__KeyValueFromString("targetname", "moja")
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(320, 1456, 832), 20), "AddOutput", "OnTrigger moja:PlaySound", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(624, 448, 960), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(704, 448, 968), 20).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_tb_wall_button:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}