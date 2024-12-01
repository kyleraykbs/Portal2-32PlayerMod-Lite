//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝╚════██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗  █████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝ ╚═════╝ 

flashOn <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Destroy objects
        Entities.FindByName(null, "death_fade").Destroy()
        Entities.FindByName(null, "death_fade").Destroy()
        Entities.FindByName(null, "death_fade").Destroy()
        Entities.FindByName(null, "blackout_teleport_player_to_wheatley").Destroy()
        Entities.FindByName(null, "laser_cutter_room_kill_relay").Destroy()
        Entities.FindByName(null, "fizzle_backtrack_trigger").Destroy()
        Entities.FindByName(null, "backtrack_portal_blocker").Destroy()
        Entities.FindByName(null, "backtrack_fun_preventer").Destroy()
        Entities.FindByName(null, "tube_scanner_room-shutdown_tube_objects").Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(4231, 990, 194), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(5952, 4624, -1736), 20).Destroy()
        EntFire("sphere_flashlight_turnon_relay", "AddOutput", "OnTrigger !self:RunScriptCode:enableFlashlights():0.1:-1")

        // Set func_portal_detector to detect all portals
        Entities.FindByName(null, "blindness_detector").__KeyValueFromString("CheckAllIDs", "1")
    }

    if (MSPostPlayerSpawn) {
        EntFireByHandle(Entities.FindByName(null, "entry_canyon_global_impact_sound"), "PlaySound", "", 1.8, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_canyon_shake"), "StartShake", "", 1.8, null, null)
        EntFireByHandle(Entities.FindByName(null, "security_door_2_door_spark_1"), "StartSpark", "", 3, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_airlock_door-proxy"), "OnProxyRelay7", "", 3, null, null)
        EntFireByHandle(Entities.FindByName(null, "entry_container_impact_relay"), "Trigger", "", 5, null, null)
    }

    if (MSLoop) {
        // Make Wheatley look at nearest player (We need wheatley to light the way for the player but since he's looking at them on loop he can't) (Moja)
        try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        } catch(exception) {}

        // Make our own changelevel trigger
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(5952, 4624, -1736), 100);) {
            EntFire("instanceauto9-exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a2_bts4", 2)
        }

        // Turn this players light off when they get to the lit up area
        foreach (p in CreateTrigger("player", 9216, 3648, -512, 9088, 3520, -384)) {
            SetFlashlightState(p.entindex(), false)
        }
    }
}

function enableFlashlights() {
    flashOn = true
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        SetFlashlightState(p.entindex(), true)
    }
}
function GEClientActive(userid, index) {
    if (flashOn) {
        SetFlashlightState(index, true)
    }
}
