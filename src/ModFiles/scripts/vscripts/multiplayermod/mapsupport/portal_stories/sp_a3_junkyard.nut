//  ██████╗██████╗             █████╗ ██████╗                 ██╗██╗   ██╗███╗  ██╗██╗  ██╗██╗   ██╗ █████╗ ██████╗ ██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗                ██║██║   ██║████╗ ██║██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║ █████╔╝                ██║██║   ██║██╔██╗██║█████═╝  ╚████╔╝ ███████║██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╗  ██║██║   ██║██║╚████║██╔═██╗   ╚██╔╝  ██╔══██║██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝╚██████╔╝██║ ╚███║██║ ╚██╗   ██║   ██║  ██║██║  ██║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝  ╚═════╝ ╚═╝  ╚══╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // Prevent doors from closing
        Entities.FindByName(null, "Junkyard_Entrance_Door").__KeyValueFromString("targetname", "Junkyard_Entrance_Door_p2mmoverride")
        Entities.FindByClassnameNearest("func_button", Vector(1380, -3624, -263.5), 32).__KeyValueFromString("targetname", "func_button_p2mmoverride1")
        Entities.FindByName(null, "junkyard_entrance_prop").__KeyValueFromString("targetname", "junkyard_entrance_prop_p2mmoverride")
        Entities.FindByName(null, "junkyard_entrance_ap").__KeyValueFromString("targetname", "junkyard_entrance_ap_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(432, -352, 112), 32).__KeyValueFromString("targetname", "triggeronce_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(-264, 544, 80), 32).Destroy()

        EntFire("triggeronce_p2mmoverride", "AddOutput", "OnStartTouch junkyard_entrance_ap_p2mmoverride:Open")
        EntFire("triggeronce_p2mmoverride", "AddOutput", "OnStartTouch junkyard_entrance_prop_p2mmoverride:SetAnimation:vert_door_opening")
        EntFire("func_button_p2mmoverride1", "AddOutput", "OnPressed Junkyard_Entrance_Door_p2mmoverride:SetAnimation:open")

        // make virgil face the right way when put onto the rail
        Entities.FindByName(null, "virgil_tank").SetAngles(0, 270, 0)
        Entities.FindByName(null, "virgil_no_drop").Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-192, 464, 80), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint()", 0, null, null)


        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        if (GetMapName().find("sp_") != null) {
            EntFire("lift_track_3", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel sp_a3_concepts:1.5")
        } else EntFire("lift_track_3", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel st_a3_concepts:1.5")
    }
}
function Checkpoint() {
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-196, 579, 64))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
}
