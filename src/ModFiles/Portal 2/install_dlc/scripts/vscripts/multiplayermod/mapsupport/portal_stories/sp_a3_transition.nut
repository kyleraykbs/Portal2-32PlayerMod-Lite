//  ██████╗██████╗             █████╗ ██████╗            ████████╗██████╗  █████╗ ███╗  ██╗ ██████╗██╗████████╗██╗ █████╗ ███╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ╚══██╔══╝██╔══██╗██╔══██╗████╗ ██║██╔════╝██║╚══██╔══╝██║██╔══██╗████╗ ██║
// ╚█████╗ ██████╔╝           ███████║ █████╔╝              ██║   ██████╔╝███████║██╔██╗██║╚█████╗ ██║   ██║   ██║██║  ██║██╔██╗██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗              ██║   ██╔══██╗██╔══██║██║╚████║ ╚═══██╗██║   ██║   ██║██║  ██║██║╚████║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗   ██║   ██║  ██║██║  ██║██║ ╚███║██████╔╝██║   ██║   ██║╚█████╔╝██║ ╚███║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚══╝╚═════╝ ╚═╝   ╚═╝   ╚═╝ ╚════╝ ╚═╝  ╚══╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Offset coop repsawn nodes for elevators (left and right side)
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // elevator stuff
        EntFire("InstanceAuto40-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("InstanceAuto40-light_elevator_fill", "TurnOn")
        EntFire("InstanceAuto40-signs_on", "Trigger")
        EntFire("InstanceAuto40-light_elevator_dynamic", "TurnOn")
        Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(0, -2224, 64))

        // trap elevator
        EntFire("trap_player_rl", "AddOutput", "OnTrigger lift_train:StartForward::2.01")
        Entities.FindByName(null, "exit_lift").__KeyValueFromString("targetname", "exit_lift_p2mmoverride")
        // weird timing that can softlock the trap elevator logic from being enabled
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_multiple", Vector(3287.98, -462.62, 235), 32), "AddOutput", "OnTrigger scene_144_done:SetValue:1:7.4:1", 0, null, null)
        Entities.FindByName(null, "exit_tube_glass").__KeyValueFromString("targetname", "exit_tube_glass_p2mmoverride")
        EntFire("trap_player_rl", "AddOutput", "OnTrigger exit_lift_p2mmoverride:SetAnimation:doorclose")
        EntFire("trap_player_rl", "AddOutput", "OnTrigger exit_tube_glass_p2mmoverride:SetAnimation:close")
        EntFire("cs_aegis_21", "AddOutput", "OnCompletion exit_lift_p2mmoverride:SetAnimation:dooropen")
        EntFire("cs_aegis_21", "AddOutput", "OnCompletion exit_tube_glass_p2mmoverride:SetAnimation:open")
        EntFire("lift_track_3", "AddOutput", "OnPass !self:RunScriptCode:KillTrapped():5")
        EntFire("lift_blocker", "Disable")

        // make doors not close
        Entities.FindByName(null, "@entry_door").__KeyValueFromString("targetname", "entry_door_p2mmoverride")
        Entities.FindByName(null, "door1").__KeyValueFromString("targetname", "door1_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(-624, -2432, -132), 32).Destroy()
        EntFire("InstanceAuto40-leaving_elevator_trigger", "AddOutput", "OnTrigger entry_door_p2mmoverride:Open")
        EntFire("door_open_rl_branch", "AddOutput", "OnFalse door1_p2mmoverride:Open")
        EntFire("door_close_rl_branch", "AddOutput", "OnFalse door1_p2mmoverride:Close")
        Entities.FindByName(null, "bts_door_01-close_door_fast").Destroy()
        Entities.FindByName(null, "lift_exit_door-close_door").Destroy()
        Entities.FindByName(null, "testing").Destroy()
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(-81, -2560, 440.5), 32), "AddOutput", "OnPressed doorinton:SetAnimation:Open", 0, null, null)
        Entities.FindByName(null, "doorzed-close").Destroy()
        Entities.FindByName(null, "tc_fizzler_1").__KeyValueFromString("targetname", "tc_fizzler_1_p2mmoverride")
        Entities.FindByName(null, "tc_entry_door").__KeyValueFromString("targetname", "tc_entry_door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2136, -1140.92, 512), 32), "AddOutput", "OnTrigger tc_entry_door_p2mmoverride:Open", 0, null, null)
        while (Entities.FindByName(null, "tc_fizzler_1_prop")) {
            Entities.FindByName(null, "tc_fizzler_1_prop").__KeyValueFromString("targetname", "tc_fizzler_1_prop_p2mmoverride")
        }
        Entities.FindByName(null, "new_room_exit").__KeyValueFromString("targetname", "new_room_exit_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("prop_laser_catcher", Vector(2413, -640, 384), 32), "AddOutput", "OnPowered new_room_exit_p2mmoverride:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_laser_catcher", Vector(2413, -640, 384), 32), "AddOutput", "OnUnpowered new_room_exit_p2mmoverride:Close", 0, null, null)
        Entities.FindByName(null, "darth_fader").Destroy() //! I killed Darth Fader.
        Entities.FindByName(null, "bts_bipart_door_2-close").Destroy()
        Entities.FindByName(null, "ap_to_oa").__KeyValueFromString("targetname", "ap_to_oa_p2mmoverride")
        Entities.FindByName(null, "bts_door_03").__KeyValueFromString("targetname", "bts_door_03_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(3200, 110, 504), 32), "AddOutput", "OnPressed bts_door_03_p2mmoverride:SetAnimation:open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(3200, 110, 504), 32), "AddOutput", "OnPressed ap_to_oa_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "oa_fallingpanel_fall").Destroy()
        Entities.FindByName(null, "oa_entry_finish").Destroy()
        
        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2152, -944, 509.75), 32), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(2)", 0, null, null)
        EntFire("oa_lever_button", "AddOutput", "OnPressed !self:RunScriptCode:Checkpoint(3)")

        // elevator cutscene
        elevatorvcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        elevatorvcontrol.__KeyValueFromString("target_team", "-1")
        elevatorvcontrol.__KeyValueFromString("targetname", "elevatorvcontrol")
        elevatorvcontrol.__KeyValueFromString("fov", "120")
        elevatorvcontrol.SetOrigin(Vector(-688, -2445, -140))
        EntFire("elevatorvcontrol", "SetParent", "lift_up")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-688, -2445, -192), 32), "AddOutput", "OnStartTouch !self:RunScriptCode:StartScene()", 0, null, null)
        EntFire("lift_up", "AddOutput", "OnFullyOpen !self:RunScriptCode:EndScene():1")



        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("InstanceAuto28-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("InstanceAuto28-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a4_overgrown:3.5", 0, null)
        } else EntFire("InstanceAuto28-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a4_overgrown:3.5", 0, null)

    }
            
}
function Checkpoint(point) {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    switch(point) {
        case 1:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-528, -2445, 420))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)
            return
        case 2:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(2152, -944, 509.75))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
        case 3:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(3875, 580, 216))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
    }
}

function KillTrapped() {
    // reset trap elevator after death
    EntFire("lift_train", "StartBackward")
    EntFire("trap_elevator_floor", "Enable", "", 5)
    EntFire("exit_lift_p2mmoverride", "SetAnimation", "dooropen", 7)
    EntFire("exit_tube_glass_p2mmoverride", "SetAnimation", "open", 6)
    Entities.FindByName(null, "lift_track_2").SetOrigin(Vector(3264, -464, 166))
}

function EndScene() {
    EntFire("elevatorvcontrol", "Disable")
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-688, -2445, 386))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(-688, -2445, 386))
        p.SetAngles(0, 0, 0)
    }
}
function StartScene() {
    if (Config_TrollFaceMode) {
        for (local p; p = Entities.FindByClassname(p, "player");) {
            p.SetOrigin(Vector(-688, -2445, -130))
        }
    } else {
        for (local p; p = Entities.FindByClassname(p, "player");) {
            p.SetOrigin(Vector(-838, -2581, 500))
        }
        EntFire("elevatorvcontrol", "Enable")
    }
}
