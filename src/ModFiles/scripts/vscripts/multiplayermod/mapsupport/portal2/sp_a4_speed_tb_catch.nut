//  ██████╗██████╗             █████╗   ██╗██╗            ██████╗██████╗ ███████╗███████╗██████╗            ████████╗██████╗             █████╗  █████╗ ████████╗ █████╗ ██╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗           ╚══██╔══╝██╔══██╗           ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║  ██║
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ╚█████╗ ██████╔╝█████╗  █████╗  ██║  ██║              ██║   ██████╦╝           ██║  ╚═╝███████║   ██║   ██║  ╚═╝███████║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║            ╚═══██╗██╔═══╝ ██╔══╝  ██╔══╝  ██║  ██║              ██║   ██╔══██╗           ██║  ██╗██╔══██║   ██║   ██║  ██╗██╔══██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██████╔╝██║     ███████╗███████╗██████╔╝██████████╗   ██║   ██████╦╝██████████╗╚█████╔╝██║  ██║   ██║   ╚█████╔╝██║  ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═════╝ ╚═╝     ╚══════╝╚══════╝╚═════╝ ╚═════════╝   ╚═╝   ╚═════╝ ╚═════════╝ ╚════╝ ╚═╝  ╚═╝   ╚═╝    ╚════╝ ╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    // Music doesn't play at the end (Moja)
    if (MSInstantRun) {
        PermaPotato = true
        // GlobalSpawnClass.m_cBluePlayers.spawnpoint <- Vector(-609.265137, 1875.096680, -100)
        // GlobalSpawnClass.m_cRedPlayers.spawnpoint <- Vector(-609.265137, 1875.096680, -100)
        // GlobalSpawnClass.m_cBluePlayers.rotation <- Vector(0, -90, 0)
        // GlobalSpawnClass.m_cRedPlayers.rotation <- Vector(0, -90, 0)
        // Here if we need to ent_fire something
        //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
        // Destroy objects
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByName(null, "exit_door-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-736, 1572, -128), 20).Destroy()
        Entities.FindByClassnameNearest("info_player_start", Vector(1969.073364, -3621.362305, 0.031250), 120).Destroy()

        for (local ent = null; ent = Entities.FindByClassname(ent, "func_portal_detector");) {
            ent.__KeyValueFromString("CheckAllIDs", "1")
        }

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_jump_polarity:0.3", 0, null)
    }
}