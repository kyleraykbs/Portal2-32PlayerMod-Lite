//  ██████╗██████╗             █████╗ ██████╗            ██╗      █████╗  ██████╗███████╗██████╗             █████╗ ██╗   ██╗███████╗██████╗             ██████╗  █████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔══██╗██║   ██║██╔════╝██╔══██╗           ██╔════╝ ██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ██║  ██║╚██╗ ██╔╝█████╗  ██████╔╝           ██║  ██╗ ██║  ██║██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗           ██║  ██║ ╚████╔╝ ██╔══╝  ██╔══██╗           ██║  ╚██╗██║  ██║██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗╚█████╔╝  ╚██╔╝  ███████╗██║  ██║██████████╗╚██████╔╝╚█████╔╝╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝ ╚════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═════════╝ ╚═════╝  ╚════╝  ╚════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_01bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_02bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_03bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_04bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_05bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_06bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_07bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_08bendy02").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "@repair_wall_kill_all").Destroy()
        Entities.FindByName(null, "door_1-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2552, -1056, 142.82), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2432, -1056, 72), 1024).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_catapult_intro:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_01bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_01_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_02bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_02_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_03bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_03_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_04bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_04_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_05bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_05_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_06bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_06_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_07bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_07_override")
        Entities.FindByName(null, "wall_panel_2-robo_powerup_corridor_08bendy02").__KeyValueFromString("targetname", "P2MM_Wall_Panel_2-Robo_Powerup_Corridor_08_override")
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_01_override:SetAnimation:powerup_corridor_01bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_02_override:SetAnimation:powerup_corridor_02bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_03_override:SetAnimation:powerup_corridor_03bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_04_override:SetAnimation:powerup_corridor_04still", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_05_override:SetAnimation:powerup_corridor_05bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_06_override:SetAnimation:powerup_corridor_06bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_07_override:SetAnimation:powerup_corridor_07bendy02", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_08_override:SetAnimation:powerup_corridor_08still", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_01_override:SetDefaultAnimation:powerup_corridor_01bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_02_override:SetDefaultAnimation:powerup_corridor_02bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_03_override:SetDefaultAnimation:powerup_corridor_03bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_04_override:SetDefaultAnimation:powerup_corridor_04still_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_05_override:SetDefaultAnimation:powerup_corridor_05bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_06_override:SetDefaultAnimation:powerup_corridor_06bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_07_override:SetDefaultAnimation:powerup_corridor_07bendy02_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "wall_panel_2-repair_wall"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_08_override:SetDefaultAnimation:powerup_corridor_08still_idleend:0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_01_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_02_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_03_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_04_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_05_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_06_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_07_override:DisableDraw::7.65", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_landing_open_relay"), "AddOutput", "OnTrigger P2MM_Wall_Panel_2-Robo_Powerup_Corridor_08_override:DisableDraw::7.65", 0, null, null)
    }
}