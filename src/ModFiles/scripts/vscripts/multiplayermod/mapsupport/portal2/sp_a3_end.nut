//  ██████╗██████╗             █████╗ ██████╗            ███████╗███╗  ██╗██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔════╝████╗ ██║██╔══██╗
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           █████╗  ██╔██╗██║██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔══╝  ██║╚████║██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗███████╗██║ ╚███║██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚══════╝╚═╝  ╚══╝╚═════╝

OnlyOnceSp_A3_End <- false
OnlyOnceSp_A3_End_1 <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        PermaPotato = true
        Entities.FindByName(null, "entrance_door_prop").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "paint_trickle_blue_1").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "paint_trickle_white_1").__KeyValueFromString("targetname", "moja3")
        Entities.FindByName(null, "paint_trickle_orange_1").__KeyValueFromString("targetname", "moja4")
        Entities.FindByName(null, "paint_trickle_blue_2").__KeyValueFromString("targetname", "moja5")
        Entities.FindByName(null, "paint_trickle_blue_2").__KeyValueFromString("targetname", "moja5")
        Entities.FindByName(null, "paint_trickle_white_2").__KeyValueFromString("targetname", "moja6")

        Entities.FindByName(null, "departure_elevator-elevator_1").__KeyValueFromString("dmg", "100")

        // Here if we need to ent_fire something
        EntFireByHandle(Entities.FindByName(null, "entrance_door_button"), "AddOutput", "OnPressed moja1:SetAnimation:open", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "AddOutput", "OnTrigger moja3:Start", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "AddOutput", "OnTrigger moja4:Start", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(192, 256, -3336), 20), "AddOutput", "OnTrigger moja5:Start", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-552, 256, -2200), 20), "AddOutput", "OnTrigger moja6:Start", 1, null, null)
        EntFire("big_door_open_relay", "AddOutput", "OnTrigger big_door_save:kill::57", 0, 0)
        EntFire("pumproom_lift_tracktrain", "spawnflags", "3", 0, null)
        // Fix func_portal_detectors
        for (local ent = null; ent = Entities.FindByClassname(ent, "func_portal_detector");) {
            ent.__KeyValueFromString("CheckAllIDs", "1")
        }
        // Change name of a thing (look moxxie a thing) so we can yell at him
        Entities.FindByName(null, "achievement_all_gels_entity").__KeyValueFromString("targetname", "look_moxxie_a_thing")
        // Destroy objects
        Entities.FindByName(null, "fade_to_death").Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_intro:0.3", 0, null)
    }

    if (MSOnPlayerJoin) {
        // fix collision on the lift
        local sp_a3_end_custom_prop_44 = CreateProp("prop_dynamic", Vector(-1537.98828125, 320.0397644043, 2935.9768066406), "models/props_underground/walkway_end_a.mdl", 0)
        sp_a3_end_custom_prop_44.SetAngles(-4.3527151660783e-07, 89.999946594238, 0)
        sp_a3_end_custom_prop_44.__KeyValueFromString("solid", "6")
        sp_a3_end_custom_prop_44.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a3_end_custom_prop_44, "color", "255 0 0 255", 0, null, null)
        EntFireByHandle(sp_a3_end_custom_prop_44, "setparent", "pumproom_lift_tracktrain", 0.5, null, null)
        EntFireByHandle(sp_a3_end_custom_prop_44, "disabledraw", "", 0.5, null, null)

        local sp_a3_end_custom_prop_45 = CreateProp("prop_dynamic", Vector(-1458.0981445312, 320.02264404297, 2935.9987792969), "models/props_underground/walkway_128a.mdl", 0)
        sp_a3_end_custom_prop_45.SetAngles(-1.2119098259655e-11, -89.915504455566, 0)
        sp_a3_end_custom_prop_45.__KeyValueFromString("solid", "6")
        sp_a3_end_custom_prop_45.__KeyValueFromString("targetname", "genericcustomprop")
        EntFireByHandle(sp_a3_end_custom_prop_45, "color", "255 0 0 255", 0, null, null)
        EntFireByHandle(sp_a3_end_custom_prop_45, "setparent", "pumproom_lift_tracktrain", 0.5, null, null)
        EntFireByHandle(sp_a3_end_custom_prop_45, "disabledraw", "", 0.5, null, null)

        // Find all players
        for (local p = null; p = Entities.FindByClassname(p, "player");) {
            EntFireByHandle(p2mm_clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
            EntFireByHandle(p, "setfogcontroller", "@environment_lake_fog", 0, null, null)
        }
    }

    if (MSLoop) {

        if (!OnlyOnceSp_A3_End) {
            if (!Entities.FindByName(null, "big_door_save")) {
                foreach (player in CreateTrigger("player", -1902.8851318359, 373.5451965332, 810.53570556641, -1751.1909179688, 269.85140991211, 954.68353271484)) {
                    if (player.GetClassname() == "player") {
                        for (local p = null; p = Entities.FindByClassname(p, "player");) {
                            p.SetOrigin(Vector(-1833, 317, 870))
                            p.SetAngles(0, -180, 0)
                            p.SetVelocity(Vector(0, 0, 0))
                            EntFire("look_moxxie_a_thing", "kill", "", 25, null)
                        }
                        OnlyOnceSp_A3_End <- true
                    }
                }
            }
        }

        if (!OnlyOnceSp_A3_End_1) {
            if (!Entities.FindByName(null, "look_moxxie_a_thing")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-1478, 319, 2980))
                    p.SetAngles(0, 0, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
                OnlyOnceSp_A3_End_1 <- true
            }
        }

        // Goo Damage Code
        try {
            if (GooHurtTimerPred) { printl() }
        } catch (exception) {
            GooHurtTimerPred <- 0
        }

        if (GooHurtTimerPred<=Time()) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z <= -5100) {
                    EntFireByHandle(p, "sethealth", "\"-100\"", 0, null, null)
                }
            }
            GooHurtTimerPred = Time() + 1
        }
    }
}