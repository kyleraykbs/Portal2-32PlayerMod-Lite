//  ██████╗██████╗             █████╗   ███╗             ██╗     ██╗███████╗████████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██║     ██║██╔════╝╚══██╔══╝
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║     ██║█████╗     ██║
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║     ██║██╔══╝     ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║██║        ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝╚═╝        ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Remove Portal Gun
        UTIL_Team.Spawn_PortalGun(false)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)
        
        Entities.FindByClassnameNearest("logic_auto", Vector(244, 1435, 9816), 16).Destroy()
        Entities.FindByName(null, "cs_cave_10").__KeyValueFromString("targetname", "cs_cave_10_p2mmoverride")
        EntFireByHandle(Entities.FindByClassname(null, "info_player_start"), "SetParent", "Lift_Mover", 0, null, null)

        // Make changing levels work
        if (GetMapName().find("sp_") != null) {
            EntFire("lift_track_9", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel sp_a1_garden:3.5", 0, null)
        } else EntFire("lift_track_9", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel st_a1_garden:3.5", 0, null)
    }
    
    if (MSPostPlayerSpawn) {
        EntFire("global_ents-proxy", "OnProxyRelay6", null, 0, null)
        EntFire("music", "PlaySound", null, 1.5, null)
        EntFire("cs_cave_10_p2mmoverride", "Start", null, 9)
        EntFire("Lift_Mover", "StartForward", null, 3.5, null)
    }
}
