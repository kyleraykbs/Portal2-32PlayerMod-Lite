//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗  ███╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝ ████║
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗ ██╔██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗╚═╝██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝ ╚══════╝

OneTimeRunSp_A2_Bts1 <- true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "chamber_door-close_door_rl").Destroy()
        Entities.FindByName(null, "jailbreak_chamber_unlit-toxin_death_fade").Destroy()
        Entities.FindByName(null, "jailbreak_chamber_unlit-toxin_death_trigger").Destroy()
        Entities.FindByName(null, "pre_solved_chamber-toxin_fade").Destroy()
        Entities.FindByName(null, "transition_trigger").Destroy()

        Entities.FindByClassnameNearest("trigger_once", Vector(-2816, -1576, 32), 1024).Destroy()

        Entities.FindByName(null, "pre_solved_chamber-sliding_door_2_5").__KeyValueFromString("targetname", "MPModSliding_Door_2_5Override")
        Entities.FindByName(null, "pre_solved_chamber-jailbreak_wall_2_5_close_logic").__KeyValueFromString("targetname", "MPModWall_2_5_Close_LogicOverride")
        Entities.FindByName(null, "pre_solved_chamber-sliding_door_2_6").__KeyValueFromString("targetname", "MPModSliding_Door_2_6Override")
        Entities.FindByName(null, "pre_solved_chamber-jailbreak_wall_2_6_close_logic").__KeyValueFromString("targetname", "MPModWall_2_6_Close_LogicOverride")
        Entities.FindByName(null, "pre_solved_chamber-chamber_bridge").__KeyValueFromString("targetname", "MPModBridgeOverride")
        Entities.FindByName(null, "pre_solved_chamber-toxin_kill_trigger").__KeyValueFromString("damagecap", "25")
        Entities.FindByName(null, "pre_solved_chamber-toxin_kill_trigger").__KeyValueFromString("damage", "25")

        EntFire("pre_solved_chamber-jailbreak_wall_row_5_open_logic", "AddOutput", "OnTrigger MPModSliding_Door_2_5Override:Open", 0, null)
        EntFire("pre_solved_chamber-jailbreak_wall_row_6_open_logic", "AddOutput", "OnTrigger MPModSliding_Door_2_6Override:Open", 0, null)
        EntFire("@pre_solved_chamber_start_rl", "AddOutput", "OnTrigger MPModBridgeOverride:Enable::2.5", 0, null)

        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(864, -1488, -16), 16), "AddOutput", "OnTrigger MPModBridgeOverride:Disable", 0, null, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Exit Test Trigger
        if (OneTimeRunSp_A2_Bts1) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-3004.51953125, -1652.0881347656, 58.625823974609), 72.800002098083);) {
                EntFire("jailbreak_chamber_unlit-jailbreak_flashlight", "TurnOff", "", 1, null)
                EntFire("@sphere", "DisableFlashlight", "", 0, null)
                EntFire("@glados", "RunScriptCode", "JailbreakWheatleyCloseChamber()", 0, null)
                OneTimeRunSp_A2_Bts1 <- false
            }
        }

        // Make Wheatley look at nearest player
        try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        } catch(exception) {}

        // Teleport players to spawn
        if (Entities.FindByName(null, "jailbreak_chamber_lit-jailbreak_trigger")) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-3792, -1128, 142), 350);) {
                if (p.GetTeam() == TEAM_RED) {
                    p.SetOrigin(Vector(-10066, -2281, 0))
                } else {
                    p.SetOrigin(Vector(-10066, -2581, 0))
                }
            }
        } else {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-9915.5029296875, -2433.4301757812, -34.047546386719), 369.50420379639);) {
                p.SetOrigin(Vector(-3482.0803222656, -2117.7331542969, 20.649803161621))
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-9241.060546875, -2418.1635742188, 104.73459625244), 200);) {
                p.SetOrigin(Vector(-3481.3332519531, -2119.4982910156, 20.3405418396))
            }
        }

        // Make our own changelevel trigger
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(1253.4089355469, -1319.4395751953, -320.2317199707), 104.79999542236);) {
            EntFire("instanceauto91-exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a2_bts2", 2)
        }
    }
}