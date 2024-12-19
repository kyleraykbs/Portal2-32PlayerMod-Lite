//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ██╗ █████╗  █████╗  █████╗ ██╗  ██╗███████╗████████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██║██╔══██╗██╔══██╗██╔══██╗██║  ██║██╔════╝╚══██╔══╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝██║██║  ╚═╝██║  ██║██║  ╚═╝███████║█████╗     ██║   
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗██║██║  ██╗██║  ██║██║  ██╗██╔══██║██╔══╝     ██║   
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║  ██║██║╚█████╔╝╚█████╔╝╚█████╔╝██║  ██║███████╗   ██║   
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝  ╚═╝╚═╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝   ╚═╝   

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        Entities.FindByName(null, "lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMLower_Panel_1Override")
        Entities.FindByName(null, "lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMLower_Panel_1Override")
        Entities.FindByName(null, "lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMLower_Panel_1Override")
        Entities.FindByName(null, "lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMLower_Panel_1Override")
        Entities.FindByName(null, "midroom_lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMMidroom_Lower_Panel_1Override")
        Entities.FindByName(null, "midroom_lower_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMMidroom_Lower_Panel_1Override")
        Entities.FindByName(null, "midroom_upper_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMMidroom_Upper_Panel_1Override")
        Entities.FindByName(null, "midroom_upper_panel_1-airlock_lower_panel_1").__KeyValueFromString("targetname", "P2MMMidroom_Upper_Panel_1Override")
        EntFireByHandle(Entities.FindByName(null, "lower_panel_1-close"), "AddOutput", "OnTrigger P2MMLower_Panel_1Override:SetAnimation:90down:0.3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "lower_panel_1-open"), "AddOutput", "OnTrigger P2MMLower_Panel_1Override:SetAnimation:90up:0.3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "midroom_lower_panel_1-close"), "AddOutput", "OnTrigger P2MMMidroom_Lower_Panel_1Override:SetAnimation:90down:0.3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "midroom_lower_panel_1-open"), "AddOutput", "OnTrigger P2MMMidroom_Lower_Panel_1Override:SetAnimation:90up:0.3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "midroom_upper_panel_1-close"), "AddOutput", "OnTrigger P2MMMidroom_Upper_Panel_1Override:SetAnimation:90down:0.3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "midroom_upper_panel_1-open"), "AddOutput", "OnTrigger P2MMMidroom_Upper_Panel_1Override:SetAnimation:90up:0.3", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(4008, 1152, -456), 1024).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(4064, 1152, -472), 1024).Destroy()
        
        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_bridge_intro:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}