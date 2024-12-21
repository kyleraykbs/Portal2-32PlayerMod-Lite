//  ██████╗██████╗             █████╗   ██╗██╗           ████████╗ ██╗       ██╗ █████╗             █████╗ ███████╗            █████╗            ██╗  ██╗██╗███╗  ██╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ╚══██╔══╝ ██║  ██╗  ██║██╔══██╗           ██╔══██╗██╔════╝           ██╔══██╗           ██║ ██╔╝██║████╗ ██║██╔══██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║              ██║    ╚██╗████╗██╔╝██║  ██║           ██║  ██║█████╗             ███████║           █████═╝ ██║██╔██╗██║██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║              ██║     ████╔═████║ ██║  ██║           ██║  ██║██╔══╝             ██╔══██║           ██╔═██╗ ██║██║╚████║██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗   ██║     ╚██╔╝ ╚██╔╝ ╚█████╔╝██████████╗╚█████╔╝██║     ██████████╗██║  ██║██████████╗██║ ╚██╗██║██║ ╚███║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝   ╚═╝      ╚═╝   ╚═╝   ╚════╝ ╚═════════╝ ╚════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════════╝╚═╝  ╚═╝╚═╝╚═╝  ╚══╝╚═════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // elevator stuff
        EntFire("arrival_logic-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("arrival_logic-light_elevator_fill", "TurnOn")
        EntFire("arrival_logic-signs_on", "Trigger")
        EntFire("arrival_logic-light_elevator_dynamic", "TurnOn")

        // set spawn
        Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
        
        // make doors not close
        Entities.FindByName(null, "r1_entrance_door").__KeyValueFromString("targetname", "r1_entrance_door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(64, -480, 440), 32), "AddOutput", "OnTrigger r1_entrance_door_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "r1_exit_door").__KeyValueFromString("targetname", "r1_exit_door_p2mmoverride")
        EntFire("r1_exit_counter", "AddOutput", "OnHitMax r1_exit_door_p2mmoverride:Open")
        EntFire("r1_exit_counter", "AddOutput", "OnChangedFromMax r1_exit_door_p2mmoverride:Close")
        Entities.FindByClassnameNearest("trigger_once", Vector(-672, 3464, 704), 32).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-664, 2416, 448), 32).Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-536, 2416, 448), 32), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint()", 0, null, null)

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("end_trigger", "Enable")
        EntFire("InstanceAuto26-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("InstanceAuto26-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a4_destroyed:3.5", 0, null)
        } else EntFire("InstanceAuto26-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a4_destroyed:3.5", 0, null)

    }
}
function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-707, 2367, 448))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 115, 0)
}
