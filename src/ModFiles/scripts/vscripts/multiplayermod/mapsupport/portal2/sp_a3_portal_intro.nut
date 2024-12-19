//  ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗ ██████╗ ████████╗ █████╗ ██╗                ██╗███╗  ██╗████████╗██████╗  █████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║                ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██████╔╝██║  ██║██████╔╝   ██║   ███████║██║                ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██╔═══╝ ██║  ██║██╔══██╗   ██║   ██╔══██║██║                ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗██║     ╚█████╔╝██║  ██║   ██║   ██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝╚═╝      ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝

OnlyOnceSp_A3_Portal_Intro <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true

        Entities.FindByName(null, "1970s_door1door_lower").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "1970s_door1door_upper").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "1970s_door_1_areaportal").__KeyValueFromString("targetname", "moja3")
        Entities.FindByName(null, "1970s_door2_door_lower").__KeyValueFromString("targetname", "moja4")
        Entities.FindByName(null, "1970s_door2_door_upper").__KeyValueFromString("targetname", "moja5")
        Entities.FindByName(null, "1970s_door_2_areaportal").__KeyValueFromString("targetname", "moja6")
        Entities.FindByName(null, "bowl_areaportal").__KeyValueFromString("targetname", "moja7")
        Entities.FindByName(null, "paint_sprayer_2").__KeyValueFromString("targetname", "moja8")

        // Here if we need to ent_fire something
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "AddOutput", "OnTrigger moja4:Open", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2505.95, -48, -2384), 20), "AddOutput", "OnTrigger moja5:Open", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "sphere_entrance_lift_train_path_2"), "AddOutput", "OnPass moja8:Start", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja3"), "Open", "", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja6"), "Open", "", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja7"), "Open", "", 1, null, null)

        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "entrance_lift_train"), "StartForward", "", 0, null, null)

        // Destroy objects
        Entities.FindByName(null, "abyss_loadsaved").Destroy()
        Entities.FindByName(null, "bowl_areaportal_blackbrush").Destroy()
        Entities.FindByName(null, "damaged_sphere_door_3-door_close").Destroy()
        Entities.FindByName(null, "damaged_sphere_door_4-door_close").Destroy()
        Entities.FindByName(null, "liftshaft_entrance_door-door_close").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2400, 1360, -1920), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(2416, -128, 640.01), 20).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a3_end:0.3", 0, null)
    }

    if (MSLoop) {
        // Make the elevator teleport the players in
        if (!OnlyOnceSp_A3_Portal_Intro) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(256, -992, -1104), 100);) {
                OnlyOnceSp_A3_Portal_Intro <- true
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(256, -992, -1254))
                    p.SetAngles(0, 90, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
                EntFire("entrance_lift_train", "kill", "", 10, null)
                break
            }
        }

        if (!Entities.FindByName(null, "entrance_lift_train")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z <= -1400) {
                    p.SetOrigin(Vector(406, -561, 224))
                    p.SetAngles(0, 90, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
            }
        }

        // Goo Damage Code
        try {
            if (GooHurtTimerPred) { printl() }
        } catch (exception) {
            GooHurtTimerPred <- 0
        }

        if (GooHurtTimerPred <= Time()) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z <= -3500) {
                    EntFireByHandle(p, "sethealth", "\"-100\"", 0, null, null)
                }
            }
            GooHurtTimerPred = Time() + 1
        }
    }
}