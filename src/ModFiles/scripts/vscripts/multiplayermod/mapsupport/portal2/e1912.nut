// ███████╗  ███╗   █████╗   ███╗  ██████╗
// ██╔════╝ ████║  ██╔══██╗ ████║  ╚════██╗
// █████╗  ██╔██║  ╚██████║██╔██║    ███╔═╝
// ██╔══╝  ╚═╝██║   ╚═══██║╚═╝██║  ██╔══╝
// ███████╗███████╗ █████╔╝███████╗███████╗
// ╚══════╝╚══════╝ ╚════╝ ╚══════╝╚══════╝

HasStartedE1912 <- false
OnlyOnceE1912 <- true
OnlyOnce2E1912 <- true
OnlyOnce3E1912 <- true
NewSpawnPoint <- false
DisableJumpmsp <- true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(false)
        UTIL_Team.Pinging(false)
        UTIL_Team.Taunting(false)

        Entities.FindByName(null, "crash-vehicle_outro").__KeyValueFromString("targetname", "p2mmcrashvehicleoutrooverride")
        Entities.FindByName(null, "crash-movie_logo").__KeyValueFromString("targetname", "p2mmcrashmovielogooverride")
        EntFireByHandle(Entities.FindByName(null, "timescale"), "SetTimescaleBlendTime", "0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "timescale"), "SetDesiredTimescale", "0.5", 0.5, null, null)
        EntFireByHandle(Entities.FindByName(null, "crash-trigger_scare"), "AddOutput", "OnStartTouch crash-relay_cannisters_monster_expolode:Trigger::0.1", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "crash-relay_break_out"), "AddOutput", "OnTrigger p2mmcrashmovielogooverride:playmovieforallplayers::15.70", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "crash-trigger_scare"), "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel mp_coop_lobby_3:26", 0, null, null)
        Entities.FindByClassnameNearest("info_player_start", Vector(-722, -924, 26), 128).Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(-900, 6110, 11), 16).Destroy()
        Entities.FindByName(null, "crash-aisc_monster_car_push").Destroy()

        // Set up function fires
        EntFire("relay_view_crash", "AddOutput", "OnTrigger p2mm_servercommand:command:script E1912CrashViewcontrol():0.1")
        EntFire("@relay_Intro_setup_view2", "AddOutput", "OnTrigger p2mm_servercommand:command:script E1912AfterCrashViewcontrol()")
        EntFire("crash-trigger_scare", "AddOutput", "OnTrigger p2mm_servercommand:command:script E1912ScareViewcontrol():1.9")
        EntFire("crash-trigger_scare", "AddOutput", "OnTrigger p2mm_servercommand:command:script E1912PostScare():23")
    }

    if (MSLoop) {
        if (!HasStartedE1912) {
            EntFireByHandle(Entities.FindByName(null, "fade_start"), "Fade", "", 0, null, null)
        }

        if (Entities.FindByName(null, "E1912ViewcontrolTele")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-882 6104 166))
                p.SetVelocity(Vector(0, 0, 0))
            }
        }

        if (OnlyOnceE1912) {
            if (Entities.FindByName(null, "E1912ViewcontrolDone")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-868.607117, 6147.984375, 0.031250))
                    p.SetAngles(0.033103, -11.502685, 0)
                }
                UTIL_Team.Pinging(false)
                UTIL_Team.Taunting(false)
                stoprenable <- true
                OnlyOnceE1912 <- false
            }
        }

        if (OnlyOnce2E1912) {
            if (Entities.FindByName(null, "E1912CrashViewcontrolTele")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-882 6104 154))
                }
                stoprenable <- true
                OnlyOnce2E1912 <- false
            }
        }

        if (Entities.FindByName(null, "E1912AfterCrashViewcontrolTele")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-655, -994, -2))
                p.SetAngles(-1, 108, 0)
            }
        }

        if (OnlyOnce3E1912) {
            if (Entities.FindByName(null, "E1912AfterCrashViewcontrolDone")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-655.748779, -918.373535, 2))
                    p.SetAngles(2.279724, 108.544930, 0)
                }
                UTIL_Team.Pinging(false)
                UTIL_Team.Taunting(false)
                stoprenable <- true
                NewSpawnPoint <- true
                OnlyOnce3E1912 <- false
            }
        }

        if (NewSpawnPoint) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-526, 6108, 64), 1000);) {
                p.SetOrigin(Vector(-655.748779, -918.373535, 2))
                p.SetAngles(2.279724, 108.544930, 0)
            }
        }

        if (Entities.FindByName(null, "E1912ScareViewcontrolTele")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-324, -200, 34))
                p.SetVelocity(Vector(0, 0, 0))
                p.SetAngles(-2, -65, 0)
            }
        }
    }

    if (MSPostPlayerSpawn) {
        HasStartedE1912 <- true

        // Copy all outputs
        for (local p = null; p = Entities.FindByClassname(p, "player");) {
            EntFireByHandle(Entities.FindByName(null, "speed_mod"), "ModifySpeed", "0.65", 0, p, p)
        }
        EntFire("speed_mod", "ModifySpeed", "0.65", 0) // We do this one for everyone
        EntFire("fade_start", "Fade", "", 0)
        EntFire("relay_Intro_setup_view", "Trigger", "", 0)
        EntFire("timescale", "SetTimescaleBlendTime", "2", 0.3)
        EntFire("timescale", "SetDesiredTimescale", "1", 0.5)
        EntFire("spr_gunlight", "SetParentAttachment", "lightAttach", 0.5)
        EntFire("@script_br_trainride", "RunScriptCode", "StartExploreTimer()", 1.5)

        E1912Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        E1912Viewcontrol.__KeyValueFromString("targetname", "E1912Viewcontrol")
        E1912Viewcontrol.__KeyValueFromString("target_team", "-1")
        E1912Viewcontrol.SetOrigin(Entities.FindByName(null, "vehicle_intro").GetOrigin())
        E1912Viewcontrol.SetAngles(0, 0, 0)
        EntFire("E1912Viewcontrol", "setparent", "vehicle_intro")
        EntFire("E1912Viewcontrol", "setparentattachment", "vehicle_driver_eyes")
        EntFire("E1912Viewcontrol", "Enable")
        EntFire("E1912ViewcontrolTele", "disable", "", 9)
        EntFire("E1912Viewcontrol", "AddOutput", "targetname E1912ViewcontrolTele", 0.25)
        EntFire("E1912ViewcontrolTele", "AddOutput", "targetname E1912ViewcontrolDone", 9)
    }

    // TODO: This will interfere if someone uses the !speed chat command
    // But there is no conceivable way to make sure each player is under the speedmod
    // Maybe try using OnRespawn player hook
    if (MSOnPlayerJoin || MSOnRespawn) {
        for (local ent; ent = Entities.FindByClassname(ent, "player");) {
            EntFireByHandle(Entities.FindByName(null, "speed_mod"), "ModifySpeed", "0.65", 0, ent, ent)
        }
    }
}

//------------------------------------------------------

function E1912CrashViewcontrol() {
    E1912CrashViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
    E1912CrashViewcontrol.__KeyValueFromString("targetname", "E1912CrashViewcontrol")
    E1912CrashViewcontrol.__KeyValueFromString("target_team", "-1")
    E1912CrashViewcontrol.SetOrigin(Entities.FindByName(null, "vehicle_crash").GetOrigin())
    E1912CrashViewcontrol.SetAngles(0, 0, 0)
    EntFire("E1912CrashViewcontrol", "setparent", "vehicle_crash")
    EntFire("E1912CrashViewcontrol", "setparentattachment", "vehicle_driver_eyes")
    EntFire("E1912CrashViewcontrol", "Enable")
    EntFire("E1912CrashViewcontrolTele", "disable")
    EntFire("E1912CrashViewcontrol", "AddOutput", "targetname E1912CrashViewcontrolTele", 0.1)
    EntFire("E1912CrashViewcontrolTele", "AddOutput", "targetname E1912CrashViewcontrolDone", 4)
    UTIL_Team.Pinging(true, "all")
    UTIL_Team.Taunting(true, "all")
}

function E1912AfterCrashViewcontrol() {
    E1912AfterCrashViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
    E1912AfterCrashViewcontrol.__KeyValueFromString("targetname", "E1912AfterCrashViewcontrol")
    E1912AfterCrashViewcontrol.__KeyValueFromString("target_team", "-1")
    E1912AfterCrashViewcontrol.SetOrigin(Entities.FindByName(null, "crash-vehicle_intro").GetOrigin())
    E1912AfterCrashViewcontrol.SetAngles(0, 0, 0)
    EntFire("E1912AfterCrashViewcontrol", "setparent", "crash-vehicle_intro")
    EntFire("E1912AfterCrashViewcontrol", "setparentattachment", "vehicle_driver_eyes")
    EntFire("E1912AfterCrashViewcontrol", "Enable", "")
    EntFire("E1912AfterCrashViewcontrolTele", "disable", "", 17.5)
    EntFire("E1912AfterCrashViewcontrol", "AddOutput", "targetname E1912AfterCrashViewcontrolTele", 0.25)
    EntFire("E1912AfterCrashViewcontrolTele", "AddOutput", "targetname E1912AfterCrashViewcontrolDone", 17.5)

    for (local ent = null; ent = Entities.FindByClassname(ent, "player");) {
        EntFireByHandle(Entities.FindByName(null, "crash-speedmod"), "ModifySpeed", "0.6", 0, ent, ent)
    }
}

function E1912ScareViewcontrol() {
    E1912ScareViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
    E1912ScareViewcontrol.__KeyValueFromString("targetname", "E1912ScareViewcontrol")
    E1912ScareViewcontrol.__KeyValueFromString("target_team", "-1")
    E1912ScareViewcontrol.SetOrigin(Entities.FindByName(null, "p2mmcrashvehicleoutrooverride").GetOrigin())
    E1912ScareViewcontrol.SetAngles(0, 0, 0)
    EntFire("E1912ScareViewcontrol", "setparent", "p2mmcrashvehicleoutrooverride")
    EntFire("E1912ScareViewcontrol", "setparentattachment", "vehicle_driver_eyes")
    EntFire("E1912ScareViewcontrol", "Enable", "")
    EntFire("E1912ScareViewcontrolTele", "disable", "", 10)
    EntFire("E1912ScareViewcontrol", "AddOutput", "targetname E1912ScareViewcontrolTele", 0.1)
    EntFire("E1912ScareViewcontrolTele", "AddOutput", "targetname E1912ScareViewcontrolDone", 10)
    UTIL_Team.Pinging(true, "all")
    UTIL_Team.Taunting(true, "all")
}

function E1912PostScare() {
    UTIL_Team.Pinging(false)
    UTIL_Team.Taunting(false)
}