//  ██████╗██████╗             █████╗   ██╗██╗           ██████╗ ███████╗ ██████╗████████╗██████╗  █████╗ ██╗   ██╗███████╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║  ██║█████╗  ╚█████╗    ██║   ██████╔╝██║  ██║ ╚████╔╝ █████╗  ██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║  ██║██╔══╝   ╚═══██╗   ██║   ██╔══██╗██║  ██║  ╚██╔╝  ██╔══╝  ██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██████╔╝███████╗██████╔╝   ██║   ██║  ██║╚█████╔╝   ██║   ███████╗██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═════╝ ╚══════╝╚═════╝    ╚═╝   ╚═╝  ╚═╝ ╚════╝    ╚═╝   ╚══════╝╚═════╝

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

        Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)

        // make doors not close
        Entities.FindByName(null, "@entry_door").__KeyValueFromString("targetname", "entry_door_p2mmoverride")
        EntFire("arrival_logic-leaving_elevator_trigger", "AddOutput", "OnTrigger entry_door_p2mmoverride:Open")
        Entities.FindByName(null, "destroyed_door_1").__KeyValueFromString("targetname", "destroyed_door_1_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(-64, 352, 826), 32), "AddOutput", "OnPressed destroyed_door_1_p2mmoverride:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(-64, 352, 826), 32), "AddOutput", "OnUnPressed destroyed_door_1_p2mmoverride:Close", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(-171.11, 864.93, 880), 32).Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-224, 600, 880), 32), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint()", 0, null, null)

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("departure_logic-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("departure_logic-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a4_factory:3.5", 0, null)
        } else EntFire("departure_logic-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a4_factory:3.5", 0, null)

    }
}
function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-224, 709, 840))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
}
