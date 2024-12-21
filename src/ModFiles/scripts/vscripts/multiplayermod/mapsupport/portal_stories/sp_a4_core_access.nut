//  ██████╗██████╗             █████╗   ██╗██╗            █████╗  █████╗ ██████╗ ███████╗            █████╗  █████╗  █████╗ ███████╗ ██████╗ ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔══██╗██╔══██╗██╔══██╗██╔════╝           ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║  ╚═╝██║  ██║██████╔╝█████╗             ███████║██║  ╚═╝██║  ╚═╝█████╗  ╚█████╗ ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║  ██╗██║  ██║██╔══██╗██╔══╝             ██╔══██║██║  ██╗██║  ██╗██╔══╝   ╚═══██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗╚█████╔╝╚█████╔╝██║  ██║███████╗██████████╗██║  ██║╚█████╔╝╚█████╔╝███████╗██████╔╝██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝ ╚════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝  ╚═╝ ╚════╝  ╚════╝ ╚══════╝╚═════╝ ╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        Entities.FindByClassnameNearest("info_player_start", Vector(560, 1072, 1696), 32).Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(96, 368, 832), 32).Destroy()

        // make doors not close
        Entities.FindByName(null, "generator_area_noback_trigger").Destroy()
        Entities.FindByName(null, "security_area_noback_trigger").Destroy()
        Entities.FindByName(null, "factory_area_noback_trigger").Destroy()
        Entities.FindByName(null, "Security_Final_Trigger").Destroy()
        Entities.FindByName(null, "turret_door_trigger").__KeyValueFromString("targetname", "turret_door_trigger_p2mmoverride")

        // remove death fade
        Entities.FindByName(null, "Death_Fade").Destroy()

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("transition_trigger", "Enable")
        if (GetMapName().find("sp_") != null) {
            EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_finale:2", 0, null)
        } else EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel st_a4_finale:2", 0, null)
    }
    
    if (MSPostPlayerSpawn) {
        EntFire("hub_death_fizzler-proxy", "OnProxyRelay2", null, 0.8)
        EntFire("hub_lift", "Open")
        EntFire("global_ents-proxy", "OnProxyRelay3")
        EntFire("@finale_lw_open_rl", "Trigger")
        EntFire("cs_virgil_212", "Start")
        EntFire("@display_chapter_titlef", "Trigger", null, 2.5)
    }
}
