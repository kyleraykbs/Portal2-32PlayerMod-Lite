//  ██████╗██████╗             █████╗   ███╗             ██████╗ ██╗██╗   ██╗██╗███╗  ██╗██╗████████╗██╗   ██╗           ██╗███╗  ██╗████████╗██████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██╔══██╗██║██║   ██║██║████╗ ██║██║╚══██╔══╝╚██╗ ██╔╝           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗        
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║  ██║██║╚██╗ ██╔╝██║██╔██╗██║██║   ██║    ╚████╔╝            ██║██╔██╗██║   ██║   ██████╔╝██║  ██║        
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║  ██║██║ ╚████╔╝ ██║██║╚████║██║   ██║     ╚██╔╝             ██║██║╚████║   ██║   ██╔══██╗██║  ██║        
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╔╝██║  ╚██╔╝  ██║██║ ╚███║██║   ██║      ██║   ██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝        
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝ ╚═╝   ╚═╝   ╚═╝╚═╝  ╚══╝╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(false)
        printlP2MM(0, true, "!!!!!!!!!!!!!!!!!!!!!!!!!!")
        Entities.FindByName(null, "wakeup").__KeyValueFromString("targetname", "wakeup_p2mmoverride")
        Entities.FindByName(null, "wakeup_camera").Destroy()
        Entities.FindByClassnameNearest("info_player_start", Vector(-704, -1984, 539), 128).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(1008, -832, -64), 32).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-116, -516, 128), 32).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-952, -880, 256), 32).Destroy()

        local camera = Entities.CreateByClassname("point_viewcontrol_multiplayer")
        camera.__KeyValueFromString("angles", "0 270 0")
        camera.__KeyValueFromString("spawnflags", "28")
        camera.__KeyValueFromString("targetname", "wakeup_camera")
        EntFireByHandle(camera, "SetParent", "wakeup_animation", 0, null, null)
    }
}
