//  ██████╗██████╗             █████╗   ███╗             ██╗███╗  ██╗████████╗██████╗  █████╗   ██╗██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗ ██╔╝██║
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║██╔██╗██║   ██║   ██████╔╝██║  ██║██╔╝ ██║
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║██║╚████║   ██║   ██╔══██╗██║  ██║███████║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝╚════██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝      ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        // Enable pinging and taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(true)
        
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "door_0-door_close_relay").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(464, 136, 72), 1024).Destroy()
        EntFireByHandle(Entities.FindByName(null, "glass_pane_intact_model"), "kill", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "glass_pane_fractured_model"), "Disable", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "glass_pane_1_door_1"), "Open", "", 0, null, null)
        Entities.FindByName(null, "glass_pane_1_door_1_blocker").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(878, -528, 137), 1024).Destroy()
        Entities.FindByName(null, "glass_shard").Destroy()
        Entities.FindByName(null, "section_2_trigger_portal_spawn_a2_rm3a").Destroy()
        Entities.FindByName(null, "portal_a_lvl3").Destroy()
        Entities.FindByName(null, "section_2_portal_a1_rm3a").Destroy()
        Entities.FindByName(null, "section_2_portal_a2_rm3a").Destroy()
        Entities.FindByName(null, "room_1_portal_activate_rl").Destroy()
        Entities.FindByName(null, "room_2_portal_activate_rl").Destroy()
        Entities.FindByName(null, "room_3_portal_activate_rl").Destroy()
        Entities.FindByName(null, "door_2-close_door_rl").Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a1_intro5:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}