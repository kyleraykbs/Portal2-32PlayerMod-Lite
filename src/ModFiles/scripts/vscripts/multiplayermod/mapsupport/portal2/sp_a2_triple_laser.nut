//  ██████╗██████╗             █████╗ ██████╗            ████████╗██████╗ ██╗██████╗ ██╗     ███████╗           ██╗      █████╗  ██████╗███████╗██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ╚══██╔══╝██╔══██╗██║██╔══██╗██║     ██╔════╝           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝              ██║   ██████╔╝██║██████╔╝██║     █████╗             ██║     ███████║╚█████╗ █████╗  ██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝                ██║   ██╔══██╗██║██╔═══╝ ██║     ██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗   ██║   ██║  ██║██║██║     ███████╗███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝     ╚══════╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        // We should do something sussy in this map, probably something the observation room (Kinda Moja)
        Entities.FindByClassnameNearest("trigger_once", Vector(6984, -5376, 40), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(6912, -5376, 40), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_bts1:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Elevator env_projectedtexture
        try {
            EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
        } catch(exception) {}
    }
}