//  ██████╗██████╗             █████╗ ██████╗            ███████╗ █████╗ ██╗████████╗██╗  ██╗           ██████╗ ██╗      █████╗ ████████╗███████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔════╝██╔══██╗██║╚══██╔══╝██║  ██║           ██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           █████╗  ███████║██║   ██║   ███████║           ██████╔╝██║     ███████║   ██║   █████╗
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔══╝  ██╔══██║██║   ██║   ██╔══██║           ██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗██║     ██║  ██║██║   ██║   ██║  ██║██████████╗██║     ███████╗██║  ██║   ██║   ███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚═╝     ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // Elevator stuff
        EntFire("InstanceAuto53-elevator_1", "MoveToPathNode", "@elevator_1_bottom_path_1", 0.1, null)
        EntFire("InstanceAuto53-light_elevator_fill", "TurnOn")
        EntFire("InstanceAuto53-signs_on", "Trigger")
        EntFire("InstanceAuto53-light_elevator_dynamic", "TurnOn")

        // Make doors/paths not close
        Entities.FindByName(null, "Entry_Door").__KeyValueFromString("targetname", "Entry_Door_p2mm_override")
        Entities.FindByName(null, "Entry_Door_Areaportal").__KeyValueFromString("targetname", "Entry_Door_Areaportal_p2mm_override")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(0, 764.01, 208), 16), "AddOutput", "OnStartTouch Entry_Door_p2mm_override:Open", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(0, 764.01, 208), 16), "AddOutput", "OnStartTouch Entry_Door_Areaportal_p2mm_override:Open", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(736, 4296, 192), 32).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(1008, 4576, 208), 32).Destroy()
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1264, 4576, 192), 32), "AddOutput", "OnStartTouch Entry_Door_Areaportal_p2mm_override:Open", 0, null, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(3200.5, 4960, 592), 32).Destroy()
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(736, 3760, 464), 32), "AddOutput", "OnTrigger Test_1_Exit_Door:Open::1", 0, null, null)

        // remove death fade
        Entities.FindByName(null, "Death_Fade").Destroy()

        if (!Config_TrollFaceMode) {
            // elevator cutscene setup
            EntFire("AutoInstance2-elevator_1_player_teleport", "AddOutput", "OnStartTouch !self:RunScriptCode:StartScene():1")
            elevator_viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
            elevator_viewcontrol.__KeyValueFromString("targetname", "elevator_viewcontrol")
            elevator_viewcontrol.__KeyValueFromString("fov", "120")
            elevator_viewcontrol.SetOrigin(Vector(3472, 4128, 436))
            EntFire("elevator_viewcontrol", "setparent", "AutoInstance2-elevator_1", 0, null)
            elevator_viewcontrol.SetAngles(0, 90, 0)
            EntFire("AutoInstance2-elevator_1_path_3", "AddOutput", "OnPass elevator_viewcontrol:Disable::1.9")
            EntFire("AutoInstance2-elevator_1_player_teleport", "Enable")
        }

        // Make "trap" not close up
        Cooridor_1_Floor_Panels_Open_Relay <- Entities.FindByName(null, "Cooridor_1_Floor_Panels_Open_Relay")
        EntFireByHandle(Cooridor_1_Floor_Panels_Open_Relay, "AddOutput", "OnTrigger Cooridor_1_Floor_Panel_1:AddOutput:targetname P2MMCooridor_1_Floor_Panel_1:1:-1", 0, null, null)
        EntFireByHandle(Cooridor_1_Floor_Panels_Open_Relay, "AddOutput", "OnTrigger Cooridor_1_Floor_Panel_2:AddOutput:targetname P2MMCooridor_1_Floor_Panel_2:1:-1", 0, null, null)
        EntFireByHandle(Cooridor_1_Floor_Panels_Open_Relay, "AddOutput", "OnTrigger Cooridor_1_Floor_Panel_3:AddOutput:targetname P2MMCooridor_1_Floor_Panel_3:1:-1", 0, null, null)
        EntFireByHandle(Cooridor_1_Floor_Panels_Open_Relay, "AddOutput", "OnTrigger Cooridor_1_Floor_Panel_4:AddOutput:targetname P2MMCooridor_1_Floor_Panel_4:1:-1", 0, null, null)
        
        // Make the ramps to the second test chamber become stairs
        Entities.FindByName(null, "M_ramp_up").Destroy()
        Entities.FindByName(null, "r2_p_up_blocker_2").Destroy()
        M_ramp_down <- Entities.FindByName(null, "M_ramp_down")
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_01:SetAnimation:rampa_stair01_up:0.7:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_01b:SetAnimation:rampa_stair01_up:0.7:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_02:SetAnimation:rampa_stair02_up:0.8:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_02b:SetAnimation:rampa_stair02_up:0.8:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_03:SetAnimation:rampa_stair03_up:0.9:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_03b:SetAnimation:rampa_stair03_up:0.9:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_04:SetAnimation:rampa_stair04_up:1:-1", 0, null, null)
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger robo_rampa_04b:SetAnimation:rampa_stair04_up:1:-1", 0, null, null)
        robo_rampa_04 <- Entities.FindByName(null, "robo_rampa_04")
        robo_rampa_04.SetOrigin(Vector(robo_rampa_04.GetOrigin().x, robo_rampa_04.GetOrigin().y, robo_rampa_04.GetOrigin().z - 5))
        robo_rampa_04b <- Entities.FindByName(null, "robo_rampa_04b")
        robo_rampa_04b.SetOrigin(Vector(robo_rampa_04b.GetOrigin().x, robo_rampa_04b.GetOrigin().y, robo_rampa_04b.GetOrigin().z - 5))
        Entities.FindByClassnameNearest("trigger_once", Vector(1240, 4576, 336), 50).Destroy()

        // checkpoint
        EntFireByHandle(M_ramp_down, "AddOutput", "OnTrigger !self:RunScriptCode:Checkpoint()", 0, null, null)

        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("AutoInstance2-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("AutoInstance2-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a3_transition:3.5")
        } else EntFire("AutoInstance2-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a3_transition:3.5")
    }
}
function StartScene() {
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.__KeyValueFromString("rendermode", "10")
        p.SetOrigin(Vector(3184, 4120, -1512))
    }
    EntFire("elevator_viewcontrol", "Enable")
    EntFire("AutoInstance2-floor_clip", "Disable", 0.9)
    EntFire("AutoInstance2-elevator_1", "RunScriptCode:StartMoving()", 1)
    EntFire("AutoInstance2-signs_off", "Trigger", 1)
    EntFire("AutoInstance2-elevator_doorclose_playerclip", "Enable")
    EntFire("@glados:RunScriptCode", "ExitStarted()")
    EntFire("AutoInstance2-close", "Trigger")
    EntFire("AutoInstance2-elevator_1", "StartForward", 1)
}
function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(1400, 4575, 300))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 0, 0)
}
