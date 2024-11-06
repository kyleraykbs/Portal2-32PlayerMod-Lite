//  ██████╗██████╗             █████╗   ██╗██╗           ███████╗ █████╗  █████╗ ████████╗ █████╗ ██████╗ ██╗   ██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗╚██╗ ██╔╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           █████╗  ███████║██║  ╚═╝   ██║   ██║  ██║██████╔╝ ╚████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╔══╝  ██╔══██║██║  ██╗   ██║   ██║  ██║██╔══██╗  ╚██╔╝
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║     ██║  ██║╚█████╔╝   ██║   ╚█████╔╝██║  ██║   ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝     ╚═╝  ╚═╝ ╚════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝   ╚═╝

EnableLights <- false
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // elevator stuff
        EntFire("AutoInstance1-arrival_logic-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("AutoInstance1-arrival_logic-light_elevator_fill", "TurnOn")
        EntFire("AutoInstance1-arrival_logic-signs_on", "Trigger")
        EntFire("AutoInstance1-arrival_logic-light_elevator_dynamic", "TurnOn")

        Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(3408, -1872, -48))
        Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)

        // remove death fade
        Entities.FindByName(null, "AutoInstance1-darth_fader").Destroy()

        // make doors not close
        Entities.FindByName(null, "AutoInstance1-inlex_door_entry").__KeyValueFromString("targetname", "AutoInstance1-inlex_door_entry_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(3272, -1216, 84), 32), "AddOutput", "OnTrigger AutoInstance1-inlex_door_entry_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "r_door_2").__KeyValueFromString("targetname", "r_door_2_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(2798, -514, 200.5), 32), "AddOutput", "OnPressed r_door_2_p2mmoverride:SetAnimation:open", 0, null, null)
        Entities.FindByName(null, "BTS_2_Door_1").__KeyValueFromString("targetname", "BTS_2_Door_1_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(3200, -288, 240), 32), "AddOutput", "OnStartTouch BTS_2_Door_1_p2mmoverride:SetAnimation:vert_door_slow_opening", 0, null, null)
        Entities.FindByName(null, "BTS_3_Exit_Door").__KeyValueFromString("targetname", "BTS_3_Exit_Door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(5085.08, -104.76, 208), 32), "AddOutput", "OnStartTouch BTS_3_Exit_Door_p2mmoverride:SetAnimation:vert_door_slow_opening", 0, null, null)
        Entities.FindByName(null, "AutoInstance1-d_factory_end_door").__KeyValueFromString("targetname", "AutoInstance1-d_factory_end_door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(8288, -2736, 485.33), 32), "AddOutput", "OnStartTouch AutoInstance1-d_factory_end_door_p2mmoverride:SetAnimation:vert_door_opening", 0, null, null)
        Entities.FindByName(null, "AutoInstance1-do_entrance_door").__KeyValueFromString("targetname", "AutoInstance1-do_entrance_door_p2mmoverride")
        Entities.FindByName(null, "AutoInstance1-do_ap").__KeyValueFromString("targetname", "AutoInstance1-do_ap_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(9312, -2744, 624), 32), "AddOutput", "OnStartTouch AutoInstance1-do_entrance_door_p2mmoverride:SetAnimation:vert_door_opening", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(9312, -2744, 624), 32), "AddOutput", "OnStartTouch AutoInstance1-do_ap_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "AutoInstance1-BTS_4_Door_2_Trigger").__KeyValueFromString("targetname", "AutoInstance1-BTS_4_Door_2_Trigger_p2mmoverride")

        Entities.FindByName(null, "AutoInstance1-virgil").__KeyValueFromString("targetname", "AutoInstance1-virgil_p2mmoverride")
        EntFire("AutoInstance1-virgil_p2mmoverride", "DisablePickup")
        Entities.FindByName(null, "AutoInstance1-d_exit_ptex").__KeyValueFromString("targetname", "AutoInstance1-d_exit_ptex_p2mmoverride")
        EntFire("AutoInstance1-d_exit_ptex_p2mmoverride", "TurnOn")
        EntFire("cs_virgil_201", "AddOutput", "OnCompletion !self:RunScriptCode:EnableLights=true")
        Entities.FindByName(null, "cs_virgil_204").Destroy()

        // checkpoints
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_multiple", Vector(6328, -2304, 624), 32), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint(1):0:1", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(9312, -2744, 624), 32), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint(2):0:1", 0, null, null)

        // in order to stop the cubes from despawning, we have to remove the trigger that kills them instead of renaming.
        EntFire("BTS_4_Shadowlight", "TurnOn")
        Entities.FindByClassnameNearest("trigger_once", Vector(5186.18, -104, 208), 32).Destroy()
        
        // Make changing levels work
        Entities.FindByName(null, "AutoInstance1-end_command").Destroy()
        if (GetMapName().find("sp_") != null) {
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(10560, -1968, 16), 32), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_core_access", 0, null, null)
        } else EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(10560, -1968, 16), 32), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel st_a4_core_access", 0, null, null)
    }
    if (MSLoop) {
        // inside elevator room
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(10560, -1968, 624), 184);) {
            SetFlashlightState(p.entindex(), false)
        }
        // outside dark area
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(10560, -1968, 624), 184);) {
            SetFlashlightState(p.entindex(), false)
        }
        // inside dark area
        if (EnableLights) {
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(9872, -2384, 528), 580);) {
                SetFlashlightState(p.entindex(), true)
            }
        }
    }
}
function Checkpoint(point) {
    switch(point) {
        case 1:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(6328, -2304, 624))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)
            return
        case 2:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(9312, -2744, 600))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)
            return
    }
}
