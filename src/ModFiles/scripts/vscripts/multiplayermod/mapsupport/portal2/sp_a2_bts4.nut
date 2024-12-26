//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗  ██╗██╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝ ██╔╝██║
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗ ██╔╝ ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗███████║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝╚════██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝      ╚═╝

TriggerOnceSP_A2_BTS4_1 <- true
DisableLookDisablerSP_A2_BTS4 <- false
alreadyFading <- false

TestingHackStart <- function() {
    printlP2MM(0, true, "DOOR HACK START")
    WheatleyPlayerLookSP_A2_BTS4 <- false
}

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        Entities.FindByClassnameNearest("info_player_start", Vector(2715.680664, -4926.100586, 6720.031250), 320).Destroy()

        // 799.647827 -2908.963623 7232.031250;
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        GlobalSpawnClass.m_cBluePlayers.spawnpoint <- Vector(799.647827, -2908.963623, 7232.031250)
        GlobalSpawnClass.m_cRedPlayers.spawnpoint <- Vector(799.647827, -2908.963623, 7232.031250)
        GlobalSpawnClass.m_cBluePlayers.rotation <- Vector(0, -90, 0)
        GlobalSpawnClass.m_cRedPlayers.rotation <- Vector(0, -90, 0)

        // Destroy objects
        Entities.FindByName(null, "canyon_death_fade").Destroy()
        Entities.FindByName(null, "death_fade").Destroy()
        Entities.FindByName(null, "gib_conveyor_shutdown_relay").Destroy()
        Entities.FindByName(null, "dummy_shoot_entry_door_clip").Destroy()
        Entities.FindByName(null, "wheatley_comment_mission_completed").Destroy()
        Entities.FindByName(null, "control_room_blocking_doors").Destroy()
        Entities.FindByName(null, "control_room_blocking_doors").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(800, -2896, 7224), 20).Destroy()
        // We need to recreate this trigger because it destroys portals and sets up the next area (Moja)
        Entities.FindByClassnameNearest("trigger_once", Vector(2192, -6295.99, 6704), 20).Destroy()
        // Delete these because they close doors and delete parts of the map
        Entities.FindByClassnameNearest("trigger_once", Vector(-768, -7372, 6784), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-4080, -7232, 6328), 20).Destroy()
        // Fix dummy room door closing
        local ent = Entities.FindByName(null, "dummy_shoot_entry_door").__KeyValueFromString("targetname", "moja")
        EntFire("moja", "setanimation", "Open", 2, null)
        sInstantTransitionMap = "sp_a2_bts5"
    }

    if (MSPostPlayerSpawn) {
        EntFireByHandle(Entities.FindByName(null, "@transition_script"), "RunScriptCode", "OnPostTransition()", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_airlock_door-proxy"), "OnProxyRelay1", "", 1.5, null, null)
    }

    if (MSLoop) {
        TestingHackStart
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1689.0235595703, -7900.8461914062, 6707.0034179688), 78.400001525879*1.5);) {
            DisableLookDisablerSP_A2_BTS4 <- true
        }

        WheatleyPlayerLookSP_A2_BTS4 <- true
        if (!DisableLookDisablerSP_A2_BTS4) {
            // Make a custom trigger to disable player look
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824*1.5);) {
                WheatleyPlayerLookSP_A2_BTS4 <- false
            }
        }

        // On trigger hit, smash the door 18 seconds later
        if (TriggerOnceSP_A2_BTS4_1) {
            if (!Entities.FindByName(null, "wheatley_scanner_intro_vcd_trigger")) {
                printlP2MM(0, true "Wheatley Sequence Started")
                EntFire("wheatley_start_smash_window_relay", "Trigger", "", 18, null)
                EntFire("@glados", "RunScriptCode", "FactoryControlRoomHackSuccess()", 18, null)
                TriggerOnceSP_A2_BTS4_1 = false
            }
        }

        // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
        if (WheatleyPlayerLookSP_A2_BTS4) {
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}
        }

        // Make our own changelevel trigger
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-4080, -7232, 6328), 64);) {
            StartCountTransition(p)
        }
    }
}