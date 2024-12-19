//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗ █████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝██╔═══╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗ ██████╗
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗██╔══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝  ╚════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Disable nametags this load
        g_bAllowNametags = false

        // Disable color indicator this load
        g_bAllowColorIndicator = false

        // Make some blackkkkk
        inffade <- true

        // Destroy objects
        Entities.FindByName(null, "tube_ride_start_relay").Destroy()

        UTIL_Team.Spawn_PortalGun(false)
        UTIL_Team.Pinging(false)
        UTIL_Team.Taunting(false)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_core:0.3", 0, null)
    }

    if (MSOnPlayerJoin) {
        printlP2MM(0, true, "Player Joined (Reseting Viewcontrols)")
        EntFire("Sp_A2_Bts6Viewcontrol", "disable", "", 0.5, null)
        EntFire("Sp_A2_Bts6Viewcontrol", "Enable", "", 0.6, null)
    }

    if (MSLoop) {
        if (inffade) {
            EntFire("start_ride_fade", "fade", "", 0, null)
        }
    }

    if (MSPostPlayerSpawn) {
        // Fire every single event in the map
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_1"), "SetAnimation", "bts6_A5", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_2"), "SetAnimation", "bts6_A4", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_3"), "SetAnimation", "bts6_A3", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_4"), "SetAnimation", "bts6_A2", 0.6, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_ride_chell_animation"), "SetAnimationNoReset", "chell_bts6", 2, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_ride_viewproxy"), "Enable", "", 2, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_ride_wheatley_animation"), "SetAnimationNoReset", "wheatley_bts6", 2, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_5"), "SetAnimation", "bts6_A1", 2.8, null, null)
        EntFireByHandle(Entities.FindByName(null, "@glados"), "RunScriptCode", "GladosPlayVcd(392)", 3, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_6"), "SetAnimation", "bts6_A1", 4, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_7"), "SetAnimation", "bts6_A1", 5, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_8"), "SetAnimation", "bts6_A2", 7, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_9"), "SetAnimation", "bts6_A1", 9, null, null)
        EntFireByHandle(Entities.FindByName(null, "@sphere"), "DisableFlashlight", "", 10, null, null)
        EntFireByHandle(Entities.FindByName(null, "shadowed_light_01"), "TurnOn", "", 10.1, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_main_prop_10"), "SetAnimation", "bts6_A2", 12, null, null)
        EntFireByHandle(Entities.FindByName(null, "shadowed_light_02"), "TurnOn", "", 18, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_loopy_start"), "Trigger", "", 18, null, null)
        EntFireByHandle(Entities.FindByName(null, "@cube_kill_rl"), "Trigger", "", 20, null, null)
        EntFireByHandle(Entities.FindByName(null, "tuberide_section_1_areaportal_1"), "Close", "", 20, null, null)
        EntFireByHandle(Entities.FindByName(null, "tuberide_section_1_areaportal_1_blackbrush"), "Enable", "", 20, null, null)
        EntFireByHandle(Entities.FindByName(null, "@glados"), "RunScriptCode", "GladosPlayVcd(393)", 29, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_straight_start"), "Trigger", "", 32, null, null)
        EntFireByHandle(Entities.FindByName(null, "tube_collision_start"), "Trigger", "", 36.75, null, null)
        EntFireByHandle(Entities.FindByName(null, "shadowed_light_03"), "TurnOn", "", 37, null, null)
        EntFireByHandle(Entities.FindByName(null, "ending_relay"), "Trigger", "", 50.50, null, null)

        // Sp_A2_Bts6 viewcontrol creation
        Sp_A2_Bts6Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        Sp_A2_Bts6Viewcontrol.__KeyValueFromString("targetname", "Sp_A2_Bts6Viewcontrol")
        Sp_A2_Bts6Viewcontrol.__KeyValueFromString("target_team", "-1")
        Sp_A2_Bts6Viewcontrol.SetOrigin(Entities.FindByName(null, "tube_ride_chell_proxy").GetOrigin())
        Sp_A2_Bts6Viewcontrol.SetAngles(270, 0, 0)
        EntFire("Sp_A2_Bts6Viewcontrol", "setparent", "tube_ride_chell_proxy", 0, null)
        EntFire("Sp_A2_Bts6Viewcontrol", "setparentattachment", "chell_bts6_attach", 0, null)
        EntFire("Sp_A2_Bts6Viewcontrol", "Enable", "", 0, null)
        EntFire("Sp_A2_Bts6Viewcontrol", "disable", "", 51, null)

        // Remove some blackkkk
        inffade <- false
    }
}