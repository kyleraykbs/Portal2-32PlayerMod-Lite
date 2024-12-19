//  ██████╗██████╗             █████╗   ███╗             ██╗███╗  ██╗████████╗██████╗  █████╗ ███████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗╚════██║
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║██╔██╗██║   ██║   ██████╔╝██║  ██║    ██╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║██║╚████║   ██║   ██╔══██╗██║  ██║   ██╔╝
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝  ██╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝   ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        g_bOverridePluginGrabController = false

        // Enable pinging and taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(true)

        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        EntFire("@sphere", "AddOutput", "OnPlayerPickup p2mm_servercommand:command:script disablewheatleyplayerpickup()", 0, null)
        EntFire("@sphere", "AddOutput", "OnPlayerDrop p2mm_servercommand:command:script enablewheatleyplayerpickup()", 0, null)

        // Destroy objects
        Entities.FindByName(null, "arrival_elevator-elevator_1_interior_start_trigger").Destroy()
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "relay_portab_spawn").Destroy()
        Entities.FindByName(null, "portal_blocker").Destroy()

        // bts_panel_door-LR_heavydoor_close
        Entities.FindByName(null, "bts_panel_door-LR_heavydoor_close").Destroy()

        // heavy_door_backtrack_clip
        Entities.FindByName(null, "heavy_door_backtrack_clip").Destroy()

        //-------------------
        // sphere_filter
        //-------------------

        // filtername -1334 -414 1291.87
        Entities.FindByName(null, "find_elevator_trigger").__KeyValueFromString("spawnflags", "4105")
        // Entities.FindByClassnameNearest("trigger_once", Vector(-1334, -414, 1291.87), 20).__KeyValueFromString("filtername", "")
        Entities.FindByClassnameNearest("trigger_once", Vector(-1334, -414, 1291.87), 20).__KeyValueFromString("spawnflags", "4105")
        Entities.FindByClassnameNearest("trigger_once", Vector(-1334, -414, 1291.87), 20).__KeyValueFromString("targetname", "TRIG1")
        // filtername -2544 -416 1272
        // Entities.FindByClassnameNearest("trigger_once", Vector(-2544, -416, 1272), 20).__KeyValueFromString("filtername", "")
        Entities.FindByClassnameNearest("trigger_once", Vector(-2544, -416, 1272), 20).__KeyValueFromString("spawnflags", "4105")
        Entities.FindByClassnameNearest("trigger_once", Vector(-2544, -416, 1272), 20).__KeyValueFromString("targetname", "TRIG2")
        // filtername -2688 -208 1272
        // Entities.FindByClassnameNearest("trigger_once", Vector(-2688, -208, 1272), 20).__KeyValueFromString("filtername", "")
        Entities.FindByClassnameNearest("trigger_once", Vector(-2688, -208, 1272), 20).__KeyValueFromString("spawnflags", "4105")
        Entities.FindByClassnameNearest("trigger_once", Vector(-2688, -208, 1272), 20).__KeyValueFromString("targetname", "TRIG3")

        EntFire("InstanceAuto9-socket_powered_rl", "AddOutput", "OnTrigger @sphere:setparentattachment:sphere_attach:0.1")
        EntFire("InstanceAuto9-socket_powered_rl", "AddOutput", "OnTrigger @glados:RunScriptCode:sp_a1_intro7_TurnAroundNow():5")
        EntFire("InstanceAuto9-socket_powered_rl", "AddOutput", "OnTrigger @sphere:disablepickup::0.11")
        EntFire("sphere_impact_trigger", "AddOutput", "OnTrigger p2mm_servercommand:command:script SphereBotFix():0")

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a1_wakeup:2.45", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        if (!HasPickedUpWheatley) {
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_top_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_top_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) { }
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) { }
        }
        // portal_detector
        Entities.FindByName(null, "portal_in_wheatley_room_detector").__KeyValueFromString("CheckAllIDs", "1")
        Entities.FindByName(null, "portal_detector").__KeyValueFromString("CheckAllIDs", "1")

        // Wheatley made it past the locked door (pancake one)
        if (Entities.FindByNameWithin(null, "@sphere", Vector(-1500, -415.95, 1280), 128)) {
            g_bOverridePluginGrabController = true
        }
    }
}

HasPickedUpWheatley <- false
function SphereBotFix() {
    HasPickedUpWheatley = true
    EntFire("@sphere", "enablepickup", "", 1)
    Entities.FindByName(null, "sphere_filter").__KeyValueFromString("Negated", "1")
    EntFire("spherebot_1_top_swivel_1", "deactivate", "", 0.1)
}