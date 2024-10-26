//  ██████╗██████╗             █████╗   ██╗██╗            █████╗ ██╗   ██╗███████╗██████╗  ██████╗ ██████╗  █████╗  ██╗       ██╗███╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔══██╗██║   ██║██╔════╝██╔══██╗██╔════╝ ██╔══██╗██╔══██╗ ██║  ██╗  ██║████╗ ██║
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║  ██║╚██╗ ██╔╝█████╗  ██████╔╝██║  ██╗ ██████╔╝██║  ██║ ╚██╗████╗██╔╝██╔██╗██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║  ██║ ╚████╔╝ ██╔══╝  ██╔══██╗██║  ╚██╗██╔══██╗██║  ██║  ████╔═████║ ██║╚████║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗╚█████╔╝  ╚██╔╝  ███████╗██║  ██║╚██████╔╝██║  ██║╚█████╔╝  ╚██╔╝ ╚██╔╝ ██║ ╚███║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝ ╚════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚════╝    ╚═╝   ╚═╝  ╚═╝  ╚══╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        tploop <- -1
        // Offset coop repsawn nodes for elevators (left and right side)
        GlobalSpawnClass.m_bUseAutoSpawn <- false
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)



        // delete elevator start trigger
        Entities.FindByName(null, "intro_elevator_1_interior_start_trigger").Destroy()

        // stop the intro sequence and prepare for cutscene
        Entities.FindByClassnameNearest("logic_auto", Vector(-1936, -3144, -295), 32).Destroy()
        Entities.FindByName(null, "fall_fade-proxy").Destroy()
        
        if (GetMapName().find("sp_") != null) { // why the hell are they different lol
            Entities.FindByClassnameNearest("info_player_start", Vector(1120, -816, 132), 128).Destroy()
        } else {
            Entities.FindByClassnameNearest("info_player_start", Vector(-1497, -2070, 516), 128).Destroy()
        }
        

        // make doors not close
        Entities.FindByClassnameNearest("trigger_once", Vector(-570, -2636, -48.01), 32).Destroy()
        Entities.FindByName(null, "intro_ug_door").__KeyValueFromString("targetname", "intro_ug_door_p2mmoverride")
        Entities.FindByName(null, "office_ap").__KeyValueFromString("targetname", "office_ap_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(-350, -2228, 56.5), 32), "AddOutput", "OnPressed intro_ug_door_p2mmoverride:SetAnimation:open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("func_button", Vector(-350, -2228, 56.5), 32), "AddOutput", "OnPressed office_ap_p2mmoverride:Open", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(144, -1424, 63.99), 32).Destroy()
        Entities.FindByName(null, "intro_lift_entrance").__KeyValueFromString("targetname", "intro_lift_entrance_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(336, -1424, 63.99), 32), "AddOutput", "OnTrigger intro_lift_entrance_p2mmoverride:SetAnimation:vert_door_slow_opening:1", 0, null, null)
        Entities.FindByName(null, "@entry_door1").__KeyValueFromString("targetname", "entry_door1_p2mmoverride")
        EntFire("AutoInstance1-leaving_elevator_trigger", "AddOutput", "OnTrigger entry_door1_p2mmoverride:Open::0.5")
        Entities.FindByClassnameNearest("trigger_once", Vector(704, -48, 64), 32).Destroy()
        Entities.FindByName(null, "door_3").__KeyValueFromString("targetname", "door_3_p2mmoverride")
        EntFire("door_3_manager", "AddOutput", "OnChangeToAnyFalse door_3_p2mmoverride:Close")
        EntFire("door_3_manager", "AddOutput", "OnChangeToAllTrue door_3_p2mmoverride:Open")
        Entities.FindByName(null, "door_4").__KeyValueFromString("targetname", "door_4_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1744, 32, 64), 32), "AddOutput", "OnStartTouch door_4_p2mmoverride:Open", 0, null, null)
        Entities.FindByName(null, "@exit_door").__KeyValueFromString("targetname", "exit_door_p2mmoverride")
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(2464, 1184, 299), 32), "AddOutput", "OnPressed exit_door_p2mmoverride:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("prop_floor_button", Vector(2464, 1184, 299), 32), "AddOutput", "OnUnPressed exit_door_p2mmoverride:Close", 0, null, null)

        // remove death fade
        Entities.FindByName(null, "fall_fade-fade_to_death").Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(608, -1424, 38.87), 32), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(1)", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1824, 464, 64), 32), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(2)", 0, null, null)

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        if (GetMapName().find("sp_") != null) {
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2336, 1920, 1016), 32), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_tb_over_goo:1.5", 0, null, null)
        } else EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2336, 1920, 1016), 32), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel st_a4_tb_over_goo:1.5", 0, null, null)

    }
    
    if (MSPostPlayerSpawn) {
        EntFire("cs_virgil_151", "Start", null, 1)
	    EntFire("intro_elevator_train", "StartForward", null, 1.2)
	    EntFire("lift_shake", "StartShake")
        EntFire("intro_elevator_train", "MoveToPathNode", "AutoInstance1-@elevator_1_bottom_path_1", 0.1)
        EntFire("intro_light_elevator_dynamic", "TurnOn")

        if (Config_TrollFaceMode) {
            Entities.FindByName(null, "intro_elevator").__KeyValueFromString("targetname", "intro_elevator_p2mmoverride")
            EntFireByHandle(Entities.FindByClassname(null, "info_player_start"), "setparent", "intro_elevator_p2mmoverride", 0, null, null)
            EntFire("intro_lift_flicker_timer", "AddOutput intro_elevator:Skin:3", "OnTimer ", 0)
            EntFire("intro_lift_flicker_timer", "AddOutput intro_elevator:Skin:2:0.5", "OnTimer ", 0)
            EntFire("cs_virgil_154", "AddOutput", "OnCompletion !self:RunScriptCode:EndSceneAlternate():1")
            tploop = 0
        } else {
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-2312, -3201, -181)) 
            for (local p; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-2312, -3201, -181))
            }
            EntFire("cs_virgil_154", "AddOutput", "OnCompletion !self:RunScriptCode:EndScene():1")
            EntFire("p2mm_servercommand", "Command", "script StartScene()", 0.1)
        }
    }

    if (MSLoop) {
        if (tploop > -1) {
            if (tploop < 1) {
                for (local p; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(p.GetOrigin().x p.GetOrigin().y p.GetOrigin().z + 1))
                }
                tploop = 60
                }
            tploop--
        }
    }
}

function StartScene() {
    EntFire("elevator_viewcontrol", "Enable")
    elevator_viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
    elevator_viewcontrol.__KeyValueFromString("targetname", "elevator_viewcontrol")
    elevator_viewcontrol.__KeyValueFromString("fov", "120")
    elevator_viewcontrol.SetOrigin(Vector(-1983.74, -3288.72, -462))
    EntFire("elevator_viewcontrol", "setparent", "intro_elevator_train", 0, null)
    elevator_viewcontrol.SetAngles(0, 90, 0)
}

function EndScene() {
    EntFire("elevator_viewcontrol", "Disable")
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(-1211, -3296, -40))
        p.SetAngles(0, 90, 0)
    }
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-1198, -3202, -40)) 

}

function EndSceneAlternate() {
	EntFire("intro_elevator_train", "StartForward", "", 1.2)
	EntFire("lift_rotate", "Start", "", 1.2)
	EntFire("lift_shake", "StartShake", "", 0)
	EntFire("lift_crash_noise_2", "PlaySound", "", 0.9)
	EntFire("lift_crash_noise_3", "PlaySound", "", 1)
	EntFire("intro_light_elevator_dynamic", "TurnOff", "", 0)
	EntFire("cs_virgil_155", "Start", "", 1)

    // i sure do love race conditions ;D
    EntFire("info_player_start", "setparent", "", 0, null)
    EntFire("p2mm_servercommand", "Command", "script Entities.FindByClassname(null, \"info_player_start\").SetOrigin(Vector(-1198, -3202, -40))", 0.1)
    EntFire("p2mm_servercommand", "Command", "script tploop = -1", 2.4)

    // there is a death trigger, but incase a player blocks the path of the elevator (making everyone stuck) we have to do this
    for (local p; p = Entities.FindByClassname(p, "player");) {
        EntFireByHandle(p, "sethealth", "-100", 3, p, p)
    }
}

function Checkpoint(point) {
    switch(point) {
        case 1:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(704, -919, -136))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
        case 2:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(1824, 464, 64))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
    }
}
