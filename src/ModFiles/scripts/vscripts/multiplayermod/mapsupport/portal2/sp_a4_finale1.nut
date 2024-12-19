//  ██████╗██████╗             █████╗   ██╗██╗           ███████╗██╗███╗  ██╗ █████╗ ██╗     ███████╗  ███╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██║████╗ ██║██╔══██╗██║     ██╔════╝ ████║
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           █████╗  ██║██╔██╗██║███████║██║     █████╗  ██╔██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╔══╝  ██║██║╚████║██╔══██║██║     ██╔══╝  ╚═╝██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║     ██║██║ ╚███║██║  ██║███████╗███████╗███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝     ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

Sp_A4_Finale1_One_Time_Beam <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "entrance_door-close_door_rl").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByName(null, "final_door-close_door_fast").Destroy()
        Entities.FindByName(null, "hatch_door_1").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "hatch_door_2").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "hatch_door_3").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "hatch_door_4").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "hatch_door_5").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "hatch_door_6").__KeyValueFromString("wait", "-1")
        Entities.FindByName(null, "areaportal_trapdoor").__KeyValueFromString("targetname", "areaportal_disable_mp")
        // Entities.FindByName(null, "catapult_3").__KeyValueFromString("playerSpeed", "14400")
        Entities.FindByName(null, "areaportal_bounce2").__KeyValueFromString("targetname", "areaportal_disable_mp_2")
        //Entities.FindByName(null, "tbeam_crusher_delivery").__KeyValueFromString("targetname", "beam_override_mp")
        EntFire("relay_hatch", "AddOutput", "OnTrigger areaportal_disable_mp:open", 1, null)
        Entities.FindByClassnameNearest("trigger_once", Vector(-10792, -2048.01, 144), 20).Destroy()
        Entities.FindByName(null, "backstop").Destroy()

        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "spawnpoint1")

        EntFire("catapult_3", "AddOutput", "OnCatapulted tbeam_crusher_delivery:disable", 1, null)
        EntFire("catapult_3", "AddOutput", "OnCatapulted tbeam_crusher_delivery:enable::0.2", 1, null)

        EntFire("hurt_crushers", "AddOutput", "OnHurtPlayer hurt_crushers:kill::0.2", 1, null)

        // Make changing levels work
        Entities.FindByClassnameNearest("trigger_once", Vector(-12832, -3040, -112), 20).__KeyValueFromString("targetname", "transition_trigger")
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_finale2:0.45", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }

    if (MSLoop) {
        // Slow down player so they land on the platform
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-8905, -2048, -196), 100);) {
            try {
            Entities.FindByName(null, "spawnpoint1").Destroy()
            } catch (e) {}
            if (p.GetVelocity().x > 900 || p.GetVelocity().x < -900 || p.GetVelocity().y > 900 || p.GetVelocity().y < -900 || p.GetVelocity().z > 900 || p.GetVelocity().z < -900) {
                p.SetVelocity(Vector(p.GetVelocity().x/2, p.GetVelocity().y/2, p.GetVelocity().z/2))
            }
        }

        // Set spawn to be on the platform
        if (!Entities.FindByName(null, "spawnpoint1")) {
            if (Entities.FindByName(null, "hurt_crushers")) {
                for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-1596, -7680, 0), 1200);) {
                    p.SetOrigin(Vector(-8903, -2055, -196))
                    p.SetAngles(-16, -167, 0)
                }
            } else {
                for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-1596, -7680, 0), 1200);) {
                    p.SetOrigin(Vector(-9622, -2460, 141))
                    p.SetAngles(18, 37, -0)
                }
            }
        }
    }
}