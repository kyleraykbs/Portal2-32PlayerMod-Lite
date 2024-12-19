//  ██████╗██████╗             █████╗   ███╗             ██╗███╗  ██╗████████╗██████╗  █████╗ ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗╚════██╗
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║██╔██╗██║   ██║   ██████╔╝██║  ██║  ███╔═╝
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║██║╚████║   ██║   ██╔══██╗██║  ██║██╔══╝
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ ╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Offset coop repsawn nodes for elevators (left and right side)
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        // This could be repurposed for speedrun mode where the teleport node
        // is offset exactly where we want to spawn players in the actual elevator
        // teleport <- Entities.FindByName(null, "@arrival_teleport")
        // elevator <- Entities.FindByName(null, "arrival_elevator-elevator_1")
        // teleport.SetOrigin(Vector(elevator.GetOrigin().x, elevator.GetOrigin().y, elevator.GetOrigin().z - 60.97))
        // EntFireByHandle(Entities.FindByName(null, "@arrival_teleport"), "setparent", "arrival_elevator-elevator_1", 0, null, null)

        // Make the first player spawn on the right side
        // Entities.FindByClassnameNearest("trigger_once", Vector(1296, 512, 112), 50).Destroy()

        // Remove Portal Gun
        UTIL_Team.Spawn_PortalGun(false)

        // Enable pinging and taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(true)
        
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(-320, 832, -24), 100).Destroy()
        Entities.FindByName(null, "Fizzle_Trigger").Destroy()
        Entities.FindByName(null, "@entry_door-door_close_relay").Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a1_intro3:0.3", 0, null)

        while (Entities.FindByName(null, "block_boxes")) {
            Entities.FindByName(null, "block_boxes").Destroy()
        }
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}