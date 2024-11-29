//  ██████╗██████╗             █████╗ ██████╗            ███████╗██╗██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███╗   ███╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔════╝██║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗████╗ ████║
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           █████╗  ██║██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝██╔████╔██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══╝  ██║██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██║╚██╔╝██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║     ██║██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║██║ ╚═╝ ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝

OnlyOnce_a2_firestorm <- false
OnlyOnce_a2_firestorm2 <- false
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        // elevator stuff
        Entities.FindByClassnameNearest("info_player_start", Vector(-96, 288, 996), 64).Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(192, -2672, 404), 64).Destroy()
        Entities.FindByName(null, "InstanceAuto15-start_trigger").Destroy()
        EntFire("InstanceAuto15-entrance_lift_train", "StartForward", null, 0)

        // prevent doors/pathways from closing
        Entities.FindByName(null, "intro_door_trigger").__KeyValueFromString("targetname", "intro_door_trigger_p2mmoverride")
        Entities.FindByName(null, "p1_exit_door").__KeyValueFromString("targetname", "p1_exit_door_p2mmoverride")
        Entities.FindByName(null, "p1_ap_end").__KeyValueFromString("targetname", "p1_ap_end_p2mmoverride")
        Entities.FindByName(null, "Pre_Pump_Transition_Door").__KeyValueFromString("targetname", "Pre_Pump_Transition_Door_p2mmoverride")
        Entities.FindByName(null, "Pre_Pump_Transition_Door_areaportal").__KeyValueFromString("targetname", "Pre_Pump_Transition_Door_areaportal_p2mmoverride")
        Entities.FindByClassnameNearest("func_button", Vector(1164, 1392, 308), 64).__KeyValueFromString("targetname", "func_button_p2mmoverride")
        Entities.FindByClassnameNearest("func_button", Vector(4712, 2160, 313), 64).__KeyValueFromString("targetname", "func_button_p2mmoverride_2")
        EntFire("func_button_p2mmoverride", "AddOutput", "OnPressed p1_exit_door_p2mmoverride:SetAnimation:open")
        EntFire("func_button_p2mmoverride", "AddOutput", "OnPressed p1_ap_end_p2mmoverride:Open")
        EntFire("func_button_p2mmoverride_2", "AddOutput", "OnPressed Pre_Pump_Transition_Door_areaportal_p2mmoverride:Open")
        EntFire("func_button_p2mmoverride_2", "AddOutput", "OnPressed Pre_Pump_Transition_Door_p2mmoverride:SetAnimation:open")
        Entities.FindByName(null, "o1_collapse_fire").Destroy()
        Entities.FindByName(null, "o1_collapse_clip").Destroy()
        Entities.FindByName(null, "o1_door_1-close").Destroy()
        Entities.FindByName(null, "wc_door_1-close").Destroy()
        while(Entities.FindByName(null, "o1_collapse_props")) {Entities.FindByName(null, "o1_collapse_props").Destroy()}
        
        // remove death fade
        Entities.FindByName(null, "death_fade-fade_to_death").Destroy()

        // checkpoints
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_multiple", Vector(0, 104, 320), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(1)", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1272, 1392, 320), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(2)", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(5192, 2160, 448), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(3)", 0, null, null)
        EntFire("pumproom_lift_ascend_trigger", "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(4)")
        EntFire("pumproom_lift_tracktrain_path_top", "AddOutput", "OnPass !self:RunScriptCode:Checkpoint(5)")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(3240, 2300, 320.25), 128), "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint(6)", 0, null, null)
        // // teleport everyone when lift is activated
        // Entities.FindByName(null, "Achievement_Fire_Fighter").__KeyValueFromString("targetname", "doteleport")
        // Entities.FindByName(null, "explosion_ambience_sound_1").__KeyValueFromString("targetname", "doteleport1")

        //! This line is completely useless, but I couldn't just ignore hoopy like that :)
        Entities.FindByClassnameNearest("prop_dynamic_override", Vector(-876, 1626, 26), 64).__KeyValueFromString("targetname", "Hoopy_The_Hoop")

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        if (GetMapName().find("sp_") != null) {
            EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(4976, 2160, 2497.13), 64), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a3_junkyard:3", 0, null, null)
        } else EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(4976, 2160, 2497.13), 64), "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel st_a3_junkyard:3", 0, null, null)

    }
    
    if (MSPostPlayerSpawn) {
        Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(192, -2672, 816))
        
    }
}
function Checkpoint(point) {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    printlP2MM(0, true, "Checkpoint() called!")
    switch(point) {
        case 1:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(90, 266, 300))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 106, 0)
            return
        case 2:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(1366, 1306, 320))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 73, 0)
            return
        case 3:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(5250, 2157, 352))
            Entities.FindByClassname(null, "info_player_start").SetAngles(-30, 0, 0)
            return
        case 4:
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(6004, 2004, 705))
                p.SetAngles(0, 0, 0)
                p.SetVelocity(Vector(0, 0, 0))
            }
            return
        case 5:
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(6004, 1795, 2420))
                p.SetAngles(0, 90, 0)
                p.SetVelocity(Vector(0, 0, 0))
            }
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(6004, 1795, 2420))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
        case 6:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(3240, 2300, 290))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 90, 0)
            return
    }
}
