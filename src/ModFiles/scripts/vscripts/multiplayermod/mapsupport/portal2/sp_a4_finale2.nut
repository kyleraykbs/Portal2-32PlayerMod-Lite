//  ██████╗██████╗             █████╗   ██╗██╗           ███████╗██╗███╗  ██╗ █████╗ ██╗     ███████╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██║████╗ ██║██╔══██╗██║     ██╔════╝╚════██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           █████╗  ██║██╔██╗██║███████║██║     █████╗    ███╔═╝
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╔══╝  ██║██║╚████║██╔══██║██║     ██╔══╝  ██╔══╝  
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║     ██║██║ ╚███║██║  ██║███████╗███████╗███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝     ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        PermaPotato = true
        Entities.FindByName(null, "portal_chamber_1").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "portal_chamber_2").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "areaportal_airlock_1").__KeyValueFromString("targetname", "moja3")
        Entities.FindByName(null, "portal_chamber_3").__KeyValueFromString("targetname", "moja4")
        Entities.FindByName(null, "portal_chamber_4").__KeyValueFromString("targetname", "moja5")
        Entities.FindByName(null, "crusher_ride_tbeam").__KeyValueFromString("targetname", "moja6")
        Entities.FindByName(null, "areaportal_bts_door_2").__KeyValueFromString("targetname", "moja7")
        // Here if we need to ent_fire something
        EntFireByHandle(Entities.FindByName(null, "brush_movechamber_struts"), "SetParentAttachmentMaintainOffset", "a4_chamber_fx_A_attach1", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "lighting_chamber_struts"), "SetParentAttachmentMaintainOffset", "a4_chamber_fx_A_attach1", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "relay_hatch_release"), "AddOutput", "OnTrigger moja1:Open::0.5", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "relay_hatch_release"), "AddOutput", "OnTrigger moja2:Open::0.5", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(957.7, 720, -192), 20), "AddOutput", "OnTrigger moja3:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(11835.1, 11776, 8543.99), 20), "AddOutput", "OnTrigger moja4:Open::0.5", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(11835.1, 11776, 8543.99), 20), "AddOutput", "OnTrigger moja5:Open::0.5", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-474.34, -1236.01, -448), 20), "AddOutput", "OnTrigger moja7:Open", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "entrance_door-proxy").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByName(null, "bts_door_1-close_door_fast").Destroy()
        Entities.FindByName(null, "bts_door_2-close_door_fast").Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(3903, 902, -55), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-3152, -1928, -240), 20).Destroy()
    }

    if (MSPostPlayerSpawn) {
        EntFireByHandle(Entities.FindByName(null, "entrance_door-open_door"), "Trigger", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "music01"), "PlaySound", "", 0, null, null)
    }

    if (MSLoop) {
        // Make our own changelevel trigger
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-3152, -1928, -240), 100);) {
            EntFire("global_ents-exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a4_finale3", 2)
        }
    }
}