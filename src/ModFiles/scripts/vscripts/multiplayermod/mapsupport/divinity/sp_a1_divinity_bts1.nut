//  ██████╗██████╗             █████╗   ███╗             ██████╗ ██╗██╗   ██╗██╗███╗  ██╗██╗████████╗██╗   ██╗           ██████╗ ████████╗ ██████╗  ███╗  
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██╔══██╗██║██║   ██║██║████╗ ██║██║╚══██╔══╝╚██╗ ██╔╝           ██╔══██╗╚══██╔══╝██╔════╝ ████║      
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║  ██║██║╚██╗ ██╔╝██║██╔██╗██║██║   ██║    ╚████╔╝            ██████╦╝   ██║   ╚█████╗ ██╔██║      
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║  ██║██║ ╚████╔╝ ██║██║╚████║██║   ██║     ╚██╔╝             ██╔══██╗   ██║    ╚═══██╗╚═╝██║      
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╔╝██║  ╚██╔╝  ██║██║ ╚███║██║   ██║      ██║   ██████████╗██████╦╝   ██║   ██████╔╝███████╗      
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝ ╚═╝   ╚═╝   ╚═╝╚═╝  ╚══╝╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚═════╝    ╚═╝   ╚═════╝ ╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(false)
        Entities.FindByClassnameNearest("info_player_start", Vector(2176, -409, 195), 128).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(1328, -320, 192), 128).Destroy()
        EntFireByHandle(Entities.FindByClassname(null, "weapon_portalgun"), "AddOutput", "OnPlayerPickup !activator:RunScriptCode:weaponEquip()", 0, null, null)
    }
}


function weaponEquip() {
    UTIL_Team.Spawn_PortalGun(true)
    a1HasDestroyedTargetPortalGun <- true

    // Force all players to receive portal gun
    GamePlayerEquip <- Entities.CreateByClassname("game_player_equip")
    GamePlayerEquip.__KeyValueFromString("weapon_portalgun", "1")
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        EntFireByHandle(GamePlayerEquip, "use", "", 0, p, p)
    }
    GamePlayerEquip.Destroy()

    // Enable secondary fire for all guns
    EntFire("weapon_portalgun", "AddOutput", "CanFirePortal2 1", 0, null)
}