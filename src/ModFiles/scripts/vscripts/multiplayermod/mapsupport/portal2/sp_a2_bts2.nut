//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ████████╗ ██████╗██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗╚══██╔══╝██╔════╝╚════██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╦╝   ██║   ╚█████╗   ███╔═╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗   ██║    ╚═══██╗██╔══╝
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██████╦╝   ██║   ██████╔╝███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═════╝    ╚═╝   ╚═════╝ ╚══════╝

OnlyOnceSp_A2_Bts2 <- true
PreviousTimeSp_A2_Bts2 <- 0
PreviousTimeSp_A2_Bts2Again <- 0
NoPlayerMadeItOnlyOnceSp_A2_Bts2 <- true
OnlyOnceSp_A2_Bts2AgainV2 <- true
WheatleyPlayerLookSP_A2_BTS2 <- true
DisableLookDisablerSP_A2_BTS2 <- false
alreadyFading <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Destroy objects
        textnobodywin <- Entities.CreateByClassname("game_text")
        Entities.FindByName(null, "player_clip").Destroy()
        Entities.FindByName(null, "player_died_relay").Destroy()
        Entities.FindByName(null, "transition_trigger").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(1332, -250, 296), 100).__KeyValueFromString("targetname", "StartDeathEventMPMod")
        Entities.FindByClassnameNearest("trigger_once", Vector(2208, 1468, 304), 100).__KeyValueFromString("targetname", "EndDeathEventMPMod")
        Entities.FindByName(null, "pillar_fx_D_start_rl").Destroy()
        Entities.FindByName(null, "container_1_catwalk_hurt_1_rl").Destroy()
    }

    if (MSPostPlayerSpawn) {
        for (local ent = null; ent = Entities.FindByModel(ent, "models/anim_wp/room_transform/arm_exterior.mdl");) {
            //ent.__KeyValueFromString("HoldAnimation", "1")
            for (local ent2 = null; ent2 = Entities.FindByClassnameWithin(ent2, "prop_dynamic", Vector(1490, -4311, 128), 300);) {
                if (ent == ent2) {
                    ent2.Destroy()
                }
            }
        }
    }

    if (MSLoop) {
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1689.0235595703, -7900.8461914062, 6707.0034179688), 78.400001525879);) {
            DisableLookDisablerSP_A2_BTS2 <- true
        }

        if (!DisableLookDisablerSP_A2_BTS2) {
            // Make a custom trigger to disable player look
            WheatleyPlayerLookSP_A2_BTS2 <- true

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1028.5295410156, -7103.0068359375, 6741.3315429688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1403.9912109375, -7096.8754882812, 6690.7314453125), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1789.1419677734, -7122.5893554688, 6749.4721679688), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1788.701171875, -7474.5654296875, 6731.2202148438), 163.19999694824);) {
                WheatleyPlayerLookSP_A2_BTS2 <- false
            }
        }

        // if a player made it teleport everyone into the elevator
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(2207.8967285156, 1452.6505126953, 264.08181762695), 40);) {
            if (OnlyOnceSp_A2_Bts2AgainV2) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(2202, 1454, 303))
                    p.SetAngles(0, -90, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
                OnlyOnceSp_A2_Bts2AgainV2 <- false
            }
        }

        // if no player made it, show a message and restart the level
        if (!Entities.FindByName(null, "StartDeathEventMPMod")) {
            if (OnlyOnceSp_A2_Bts2) {
                PreviousTimeSP_A2_BTS2 <- Time()
                OnlyOnceSp_A2_Bts2 <- false
            }
            if (PreviousTimeSP_A2_BTS2 + 31 <= Time()) {
                if (Entities.FindByName(null, "EndDeathEventMPMod")) {
                    if (NoPlayerMadeItOnlyOnceSp_A2_Bts2) {
                        printlP2MM(0, false, "No Player Made It")
                        DoEntFire("exit_fade", "fade", "", 0.1, null, null)
                        NoPlayerMadeItOnlyOnceSp_A2_Bts2 = false
                        PreviousTimeSp_A2_Bts2Again = Time()
                        Entities.FindByName(null, "EndDeathEventMPMod").__KeyValueFromString("targetname", "EndDeathEventMPModDisMain")
                        HudPrint(0, "Nobody Escaped...", Vector(0.425, -0.2, 1), 2, 0.1, Vector(230, 30, 30), 255, Vector(0, 0, 0), 0, Vector(0.15, 0.5, 3))
                    }
                }
            }
        }

        if (!NoPlayerMadeItOnlyOnceSp_A2_Bts2) {
            if (PreviousTimeSp_A2_Bts2Again + 6.75 <= Time()) {
                EntFire("p2mm_servercommand", "command", "changelevel sp_a2_bts2")
            }
        }

        // Make Wheatley look at nearest player
        if (WheatleyPlayerLookSP_A2_BTS2) {
            try {
                local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "spherebot_1_bottom_swivel_1").GetOrigin(), 10000)
                EntFireByHandle(Entities.FindByName(null, "spherebot_1_bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
            } catch(exception) {}
        }

        // Make our own changelevel trigger
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(2207, 1983, 689), 150);) {
            EntFire("p2mm_servercommand", "command", "changelevel sp_a2_bts3", 2)
            if (!alreadyFading) {
                EntFire("exit_fade", "fade")
                alreadyFading = true
            }
        }

        // Fix the player's spawn position
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(825, -3756, 240), 25);) {
            p.SetOrigin(Vector(772, -3780, 64))
            p.SetAngles(0, -90, 0)
            p.SetVelocity(Vector(0, -90, 0))
        }
    }
}