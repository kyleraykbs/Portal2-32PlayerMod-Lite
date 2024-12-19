// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗████████╗ █████╗ ██████╗ ████████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ╚█████╗    ██║   ███████║██████╔╝   ██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝             ╚═══██╗   ██║   ██╔══██║██╔══██╗   ██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗██████╔╝   ██║   ██║  ██║██║  ██║   ██║
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝

// Coop guns are automatically stripped
blue_picked_up_gun <- false
orange_picked_up_gun <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {


        Entities.FindByClassnameNearest("trigger_once", Vector(-9901.26, -3504, 306.26), 10).__KeyValueFromString("targetname", "p2mm_blue_get_gun_trigger")
        Entities.FindByClassnameNearest("trigger_once", Vector(-10118.1, -3504, 302.92), 10).__KeyValueFromString("targetname", "p2mm_orange_get_gun_trigger")

        // Must be delayed by at least 0.25 so that they are closed by default
        EntFire("blue_door-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("blue_door_1-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("blue_door_4-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("blue_door_5-airlock_entry_door_close_rl", "Disable", "", 0.5)

        EntFire("orange_door-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("orange_door_1-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("orange_door_4-airlock_entry_door_close_rl", "Disable", "", 0.5)
        EntFire("orange_door_5-airlock_entry_door_close_rl", "Disable", "", 0.5)

        EntFire("coop_man_close_box2_door", "AddOutput" "OnChangeToAnyTrue blue_door_6-airlock_entry_door_close_rl:Disable")
        EntFire("coop_man_close_box2_door", "AddOutput" "OnChangeToAnyTrue orange_door_6-airlock_entry_door_close_rl:Disable")

        EntFire("coopman_exit_level", "AddOutput", "OnChangeToAllTrue p2mm_servercommand:command:changelevel mp_coop_lobby_3:10")
    }

    if (MSLoop) {
        if (!blue_picked_up_gun && !Entities.FindByName(null, "portalgun_blue")) {
            if (Entities.FindByName(null, "p2mm_blue_get_gun_trigger")) {
                Entities.FindByName(null, "p2mm_blue_get_gun_trigger").Destroy()
                EntFire("floor_anim_panles_2-proxy", "OnProxyRelay1")
                EntFire("floor_blue", "Enable")

                // Make sure blue players don't get stuck where gun is revealed
                for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-9816, -3504, 22.03), 128);) {
                    if (p.GetOrigin().z < 8) {
                        p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, 10))
                    }
                }
            }

            // Someone picked up the blue portal gun
            blue_picked_up_gun <- true
            coop_startHasPortalGun("blue")
        }
        if (!orange_picked_up_gun && !Entities.FindByName(null, "portalgun_orange")) {
            if (Entities.FindByName(null, "p2mm_orange_get_gun_trigger")) {
                Entities.FindByName(null, "p2mm_orange_get_gun_trigger").Destroy()
                EntFire("floor_anim_panles_1-proxy", "OnProxyRelay1")
                EntFire("floor_orange", "Enable")

                // Make sure orange players don't get stuck where gun is revealed
                for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-10200, -3504, 22.03), 128);) {
                    if (p.GetOrigin().z < 8) {
                        p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, 10))
                    }
                }
            }

            // Someone picked up the orange portal gun
            orange_picked_up_gun <- true
            coop_startHasPortalGun("orange")
        }
    }

    if (MSPostPlayerSpawn) {
        EntFire("@relay_start_both_connected", "Trigger")
    }
}

function coop_startHasPortalGun(args) {
    // Force players to receive portal gun
    GamePlayerEquip <- Entities.CreateByClassname("game_player_equip")
    GamePlayerEquip.__KeyValueFromString("weapon_portalgun", "1")

    for (local p; p = Entities.FindByClassname(p, "player");) {
        if (args == "blue") {
            // Check is done this way to compensate for players on other teams
            if (p.GetTeam() != TEAM_RED) {
                EntFireByHandle(GamePlayerEquip, "use", "", 0, p, p)
            }
        }
        else if (args == "orange") {
            if (p.GetTeam() == TEAM_RED) {
                EntFireByHandle(GamePlayerEquip, "use", "", 0, p, p)
            }
        }
    }

    GamePlayerEquip.Destroy()

    // Enable secondary fire for all guns
    EntFire("weapon_portalgun", "AddOutput", "CanFirePortal2 1", 0, null)
}