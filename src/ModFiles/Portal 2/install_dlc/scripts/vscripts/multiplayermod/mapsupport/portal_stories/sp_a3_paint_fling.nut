//  ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗ ██╗███╗  ██╗████████╗           ███████╗██╗     ██╗███╗  ██╗ ██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝           ██╔════╝██║     ██║████╗ ██║██╔════╝
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██████╔╝███████║██║██╔██╗██║   ██║              █████╗  ██║     ██║██╔██╗██║██║  ██╗
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔═══╝ ██╔══██║██║██║╚████║   ██║              ██╔══╝  ██║     ██║██║╚████║██║  ╚██╗
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗██║     ██║  ██║██║██║ ╚███║   ██║   ██████████╗██║     ███████╗██║██║ ╚███║╚██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═════════╝╚═╝     ╚══════╝╚═╝╚═╝  ╚══╝ ╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // elevator stuff
        EntFire("InstanceAuto52-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("InstanceAuto52-light_elevator_fill", "TurnOn")
        EntFire("InstanceAuto52-signs_on", "Trigger")
        EntFire("InstanceAuto52-light_elevator_dynamic", "TurnOn")

        // make doors not close
        Entities.FindByName(null, "Entrance_Door").__KeyValueFromString("targetname", "Entrance_Door_p2mm_override")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-104, -384, 32), 16), "AddOutput", "OnStartTouch Entrance_Door_p2mm_override:Open", 0, null, null)
        Entities.FindByName(null, "@exit_room_1_door").__KeyValueFromString("targetname", "exit_room_1_door_p2mmoverride")
        EntFire("AutoInstance1-button", "AddOutput", "OnPressed exit_room_1_door_p2mmoverride:Open")
        EntFire("AutoInstance1-button", "AddOutput", "OnUnPressed exit_room_1_door_p2mmoverride:Close")
        Entities.FindByName(null, "Entry_Door_2").__KeyValueFromString("targetname", "Entry_Door_2_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(-864, 912, 256), 16).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-512, 2272, 488), 16).Destroy()
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-664, 832.01, 256), 16), "AddOutput", "OnStartTouch Entry_Door_2_p2mmoverride:Open", 0, null, null)

        // checkpoints
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-896, 1103.99, 256), 128), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint()", 0, null, null)

        // remove death fade
        Entities.FindByName(null, "fade_to_death-fade_to_death").Destroy()

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("InstanceAuto33-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("InstanceAuto33-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a3_faith_plate:3.5", 0, null)
        } else EntFire("InstanceAuto33-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a3_faith_plate:3.5", 0, null)
    }
}
function Checkpoint() {
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-896, 1103.99, 256))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
}
