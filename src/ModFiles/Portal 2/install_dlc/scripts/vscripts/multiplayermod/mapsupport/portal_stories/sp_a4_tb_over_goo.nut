//  ██████╗██████╗             █████╗   ██╗██╗           ████████╗██████╗             █████╗ ██╗   ██╗███████╗██████╗             ██████╗  █████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ╚══██╔══╝██╔══██╗           ██╔══██╗██║   ██║██╔════╝██╔══██╗           ██╔════╝ ██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║              ██║   ██████╦╝           ██║  ██║╚██╗ ██╔╝█████╗  ██████╔╝           ██║  ██╗ ██║  ██║██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║              ██║   ██╔══██╗           ██║  ██║ ╚████╔╝ ██╔══╝  ██╔══██╗           ██║  ╚██╗██║  ██║██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗   ██║   ██████╦╝██████████╗╚█████╔╝  ╚██╔╝  ███████╗██║  ██║██████████╗╚██████╔╝╚█████╔╝╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝   ╚═╝   ╚═════╝ ╚═════════╝ ╚════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═════════╝ ╚═════╝  ╚════╝  ╚════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // elevator stuff
        EntFire("arrival_elevator-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("arrival_elevator-light_elevator_fill", "TurnOn")
        EntFire("arrival_elevator-signs_on", "Trigger")
        EntFire("arrival_elevator-light_elevator_dynamic", "TurnOn")

        // prevent doors from closing
        Entities.FindByName(null, "Entrance_Door").__KeyValueFromString("targetname", "Entrance_Door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(0, -1512, 336), 32), "AddOutput", "OnStartTouch Entrance_Door_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "Exit_Door").__KeyValueFromString("targetname", "Exit_Door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(256, -3104, 539), 32), "AddOutput", "OnPressed Exit_Door_p2mmoverride:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(256, -3104, 539), 32), "AddOutput", "OnUnPressed Exit_Door_p2mmoverride:Close", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(544, -3624, 592), 32).Destroy()
        Entities.FindByName(null, "r2_exit_door").__KeyValueFromString("targetname", "r2_exit_door_p2mmoverride")
        EntFire("exit_door_manager", "AddOutput", "OnChangeToAllTrue r2_exit_door_p2mmoverride:Open")
        EntFire("end_trigger", "Enable")

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(440, -3520, 592), 32), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint()", 0, null, null)

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("InstanceAuto32-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("InstanceAuto32-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a4_two_of_a_kind:3.5")
        } else EntFire("InstanceAuto32-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a4_two_of_a_kind:3.5")

    }
}
function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(600, -3592, 592))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, -54, 0)
}
