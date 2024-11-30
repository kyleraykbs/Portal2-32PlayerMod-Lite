//  ██████╗██████╗             █████╗ ██████╗             █████╗ ███╗  ██╗ █████╗ ███████╗           ██╗   ██╗██████╗  █████╗ ███╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗████╗ ██║██╔══██╗██╔════╝           ██║   ██║██╔══██╗██╔══██╗████╗ ██║
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║  ██║██╔██╗██║██║  ╚═╝█████╗             ██║   ██║██████╔╝██║  ██║██╔██╗██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║  ██║██║╚████║██║  ██╗██╔══╝             ██║   ██║██╔═══╝ ██║  ██║██║╚████║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗╚█████╔╝██║ ╚███║╚█████╔╝███████╗██████████╗╚██████╔╝██║     ╚█████╔╝██║ ╚███║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝ ╚════╝ ╚═╝  ╚══╝ ╚════╝ ╚══════╝╚═════════╝ ╚═════╝ ╚═╝      ╚════╝ ╚═╝  ╚══╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        // Spawn With Portal Gun
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // make doors not close
        Entities.FindByName(null, "entry_door-door_prop").__KeyValueFromString("targetname", "entry_door-door_prop_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(3072, -1200, 1900), 32).__KeyValueFromString("targetname", "entrytrigger_p2mm")
        Entities.FindByClassnameNearest("prop_under_floor_button", Vector(3024, -3016, 2168), 32).__KeyValueFromString("targetname", "button_p2mm")
        Entities.FindByName(null, "door_prop").__KeyValueFromString("targetname", "door_prop_p2mmoverride")
        EntFire("entrytrigger_p2mm", "AddOutput", "OnStartTouch entry_door-door_prop_p2mmoverride:SetAnimation:open", 0, null)
        EntFire("button_p2mm", "AddOutput", "OnPressed door_prop_p2mmoverride:SetAnimation:open:0.3", 0, null)
        EntFire("button_p2mm", "AddOutput", "OnUnPressed door_prop_p2mmoverride:SetAnimation:close:0.3", 0, null)
        Entities.FindByName(null, "end_command").Destroy()
        Entities.FindByName(null, "Test_1_Door_nocheat").Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2840, -2896, 2224), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint()", 0, null, null)

        // delete box spawn
        Entities.FindByClassnameNearest("info_player_start", Vector(7056, -384, -40), 127).Destroy()
        
        // Make changing levels work
        EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a2_past_power:3.5", 0, null)
        } else EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a2_past_power:3.5", 0, null)

    }
}

function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(2720, -2880, 2197))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 180, 0)
}
