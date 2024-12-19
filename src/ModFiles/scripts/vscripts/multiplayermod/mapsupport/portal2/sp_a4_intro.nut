//  ██████╗██████╗             █████╗   ██╗██╗           ██╗███╗  ██╗████████╗██████╗  █████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝

OnlyOnceSpA4Intro <- true
OnlyOnceSp_A4_Intro_1 <- true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        rollang <- 0
        // self.PrecacheSoundScript("ambient\\industrial\\delivery_tubes_lp_01.wav") // Causes errors?
        Entities.FindByName(null, "wheatley_mad_sound1").SetOrigin(Vector(-680, -210, 916))
        Entities.FindByName(null, "wheatley_mad_sound1").__KeyValueFromString("message", "ambient\\industrial\\delivery_tubes_lp_01.wav")
        Entities.FindByName(null, "wheatley_mad_sound1").__KeyValueFromString("spawnflags", "0")
        Entities.FindByName(null, "catwalk_lift_door").__KeyValueFromString("dmg", "100")
        Entities.FindByName(null, "recapture_areaportal1").__KeyValueFromString("FadeStartDist", "1750")
        Entities.FindByName(null, "recapture_areaportal1").__KeyValueFromString("FadeDist", "1950")
        Entities.FindByName(null, "recapture_areaportal2").__KeyValueFromString("FadeStartDist", "1750")
        Entities.FindByName(null, "recapture_areaportal2").__KeyValueFromString("FadeDist", "1950")
        Entities.FindByName(null, "cube_dropper_prop").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "observation_areaportal").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "cube_bot_model").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "@exit_door1-proxy").__KeyValueFromString("targetname", "moja3")
        Entities.FindByName(null, "cube_dropper_box_spawner").__KeyValueFromString("targetname", "cube_dropper_box_spawner_override_p2mm")
        Entities.FindByName(null, "test_chamber1_platform").__KeyValueFromString("dmg", "100")
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "cube_dropper_droptrigger"), "setparent", "cube_dropper_prop", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "companion_cube_skin_trigger"), "setparent", "cube_dropper_prop", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "cube_dropper_blocker"), "setparent", "cube_dropper_prop", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "@entrance_door1-door_open_relay"), "AddOutput", "OnTrigger wheatley_monitor1-relay_disable_screen:Kill::0.5", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(96, 768, 64), 20), "AddOutput", "OnTrigger moja2:FadeAndKill", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_multiple", Vector(1504.01, -640, 696), 20), "setparent", "cube_dropper_prop", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "catwalk_lift_door"), "AddOutput", "OnFullyClosed catwalk_lift_trigger:Enable::2", 0.25, null, null)
        EntFireByHandle(Entities.FindByName(null, "catwalk_lift_door"), "AddOutput", "OnOpen catwalk_lift_trigger:Disable", 0.25, null, null)
        EntFireByHandle(Entities.FindByName(null, "catwalk_lift_door"), "AddOutput", "OnFullyOpen catwalk_lift_trigger:Disable", 0.25, null, null)
        EntFireByHandle(Entities.FindByName(null, "catwalk_lift_door"), "AddOutput", "OnFullyOpen catwalk_lift_door:Close::1.25", 0.25, null, null)
        EntFireByHandle(Entities.FindByName(null, "cube_test_button"), "AddOutput", "OnPressed indicator_door_toggle:SetTextureIndex:1", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "cube_test_button"), "AddOutput", "OnPressed moja3:OnProxyRelay2:open", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "cube_test_button"), "AddOutput", "OnPressed button_1_solved:Trigger", 1, null, null)
        EntFireByHandle(Entities.FindByName(null, "button_1_unpressed"), "AddOutput", "OnTrigger moja3:OnProxyRelay1:close", 1, null, null)
        // Setup function ent_fires
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1072, 384, 172.01), 20), "AddOutput", "OnTrigger p2mm_servercommand:command:script MoveCubeDropper()", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "catwalk_lift_reset_trigger").Destroy()
        Entities.FindByName(null, "@entrance_door1-close_door_rl").Destroy()
        Entities.FindByName(null, "button_1_pressed").Destroy()
        Entities.FindByName(null, "room2_wall_close").Destroy()
        Entities.FindByName(null, "room2a_wall_close").Destroy()
        Entities.FindByName(null, "test2_end_trigger").Destroy()
        Entities.FindByName(null, "@exit_door-close_door_rl").Destroy()
        Entities.FindByName(null, "catwalk_gate1_door_right").Destroy()
        Entities.FindByName(null, "catwalk_gate1_door_left").Destroy()
        Entities.FindByName(null, "catwalk_gate2_door_right").Destroy()
        Entities.FindByName(null, "catwalk_gate2_door_left").Destroy()
        Entities.FindByName(null, "catwalk_lift_clip").Destroy()

        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "button_1_solved_TURRETNAMECHANGE")
        EntFire("button_1_solved", "AddOutput", "OnTrigger button_1_solved_TURRETNAMECHANGE:kill::17", 0.25, null)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_tb_intro:0.3", 0, null)

        CanSpawnCubeInit <- false
        SpawnCube <- false
        CubeBeingSpawned <- null
        movespeed <- 5
        PermaDestroyCubesSpA4Intro <- false
        FullDisableOldDropper <- false
        GooHurtTimerPred <- 0
        killppl <- false

        TrackPoints <- [
            Vector(-390, -376, 1310),
            Vector(-412, -534, 1222),
            Vector(-504, -648, 1140),
            Vector(-608, -680, 1094),
            Vector(-694, -660, 1082),
            Vector(-770, -610, 1086),
            Vector(-816, -548, 1092),
            Vector(-836, -464, 1090),
            Vector(-834, -372, 1070),
            Vector(-812, -312, 1054),
            Vector(-744, -230, 1008),
            Vector(-700, -210, 982),
            Vector(-636, -210, 948),
            Vector(-580, -234, 920),
            Vector(-530, -284, 894),
            Vector(-480, -328, 860),
            Vector(-426, -360, 800),
            Vector(-384, -378, 728),
            Vector(-340, -350, 614),
            Vector(-324, -308, 536),
        ]
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
        Entities.FindByName(null, "cube_dropper_prop").SetOrigin(Vector(-304.09375, -255.03125, 437.96875))
        Entities.FindByName(null, "cube_dropper_prop").SetAngles(3.4029681046377e-06, -21.125003814697, 29.531248092651)
        EntFire("cube_dropper_prop", "setanimation", "item_dropper_open", 1, null)
        EntFire("cube_dropper_prop", "setanimation", "item_dropper_close", 2, null)
        EntFireByHandle(Entities.FindByName(null, "wheatley_mad_sound1"), "PlaySound", "", 4, null, null)
    //     Entities.FindByName(null, "cube_dropper_box").Destroy()//SetOrigin(Vector(-304.09375, -255.03125, 437.96875))
    //     EntFireByHandle(Entities.FindByName(null, "cube_dropper_box"), "setparent", "cube_dropper_prop", 0, null, null)
    //     EntFireByHandle(Entities.FindByName(null, "cube_dropper_box"), "clearparent", "", 4, null, null)
    //     EntFireByHandle(Entities.FindByName(null, "cube_dropper_box"), "kill", "", 5, null, null)
        killppl <- true
        SpawnCube = false
    }

    if (MSLoop) {
        if (Entities.FindByName(null, "turret_bot4_monster")) {
            CanSpawnCubeInit = true
        }

        if (!FullDisableOldDropper) {
            if (SpawnCube) {
                if (CubeBeingSpawned != null) {
                    local output = 0
                    try {
                        output = MoveEntityOnTrack(CubeBeingSpawned, TrackPoints, movespeed)
                    } catch (e) {
                        printlP2MM(1, true, "ERROR: " + e + " : SPAWNING BACKUP")
                        SpawnCube = false
                        SpawnBackupCube()
                    }
                    // if (rollang >= 160) {
                    //     rollang <- -160
                    // } else {
                    //     if (rollang <= -160) {
                    //         rollang <- 160
                    //     } else {
                    //         rollang <- CubeBeingSpawned.GetAngles().y + 25
                    //     }
                    // }

                    CubeBeingSpawned.SetAngles(0, CubeBeingSpawned.GetAngles().y+RandomInt(3, 8), CubeBeingSpawned.GetAngles().z+RandomInt(3, 8))

                    if (output == true) {
                        printlP2MM(0, true, "Cube spawned! Output: " + output)
                        SpawnCube = false
                        EntFireByHandle(CubeBeingSpawned, "wake", "", 0, null, null)
                        EntFireByHandle(CubeBeingSpawned, "BecomeMonster", "", 3, null, null)
                        CubeBeingSpawned.SetOrigin(TrackPoints[TrackPoints.len() - 1])
                        CubeBeingSpawned.SetAngles(0, 0, 0)
                        CubeBeingSpawned.SetVelocity(Vector(0, 0, 0))
                        CubeBeingSpawned = null
                        EntFire("cube_dropper_drop", "Trigger")
                    }
                } else {
                    printlP2MM(1, true, "ERROR: CubeBeingSpawned is null")
                    SpawnCube = false
                    SpawnBackupCube()
                }
            }
        }

        if (!FullDisableOldDropper) {
            if (Entities.FindByClassnameNearest("prop_monster_box", Vector(-58.406547546387, -59.558124542236, 187.5777130127), 800)) {
            } else {
                if (CanSpawnCubeInit) {
                    if (!SpawnCube) {
                        SpawnBackupCube()
                    }
                }
            }
        }

        if (!Entities.FindByClassnameNearest("trigger_once", Vector(1072, 384, 172.01), 20)) {
            if (OnlyOnceSp_A4_Intro_1) {
                Entities.FindByName(null, "floor_gate1-cover_arm").SetOrigin(Vector(1056, 384, 128))
                EntFireByHandle(Entities.FindByName(null, "floor_gate1-floor_panel"), "clearparent", "", 0, null, null)
                Entities.FindByName(null, "floor_gate1-floor_panel").SetAngles(0, 0, 0)
                EntFireByHandle(Entities.FindByName(null, "floor_gate1-floor_panel"), "setparent", "test_chamber1_platform", 0, null, null)
                Entities.FindByName(null, "floor_gate1-floor_panel").__KeyValueFromString("rendermode", "10")
                Entities.FindByName(null, "floor_gate1-cover_arm").__KeyValueFromString("rendermode", "10")
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(1053, 380, 185))
                    p.SetAngles(0, 0, 0)
                    p.SetVelocity(Vector(0, 0, 0))
                }
                OnlyOnceSp_A4_Intro_1 <- false
            }
        }

        // Change Spawn
        if (!Entities.FindByClassnameNearest("trigger_once", Vector(1072, 384, 172.01), 20)) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().x <= 3472.60 && p.GetOrigin().z <= 220) {
                    local canteleport = true
                    for (local p2 = null; p2 = Entities.FindByClassnameWithin(p2, "player", Vector(1045, 382, 210), 400);) {
                        if (p2==p) {
                            canteleport = false
                        }
                    }
                    if (canteleport) {
                        p.SetOrigin(Vector(1065, 384, 512))
                    }
                }
            }
        }

        if (GooHurtTimerPred<=Time() && killppl) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().x <= 3472.60 && p.GetOrigin().z <= -150) {
                    EntFireByHandle(p, "sethealth", "-100000", 0, null, null)
                }
            }
            GooHurtTimerPred = Time()+1
        }

        // Change ClosedBetaTestingBox Names ;)
        if (!Entities.FindByName(null, "button_1_solved_TURRETNAMECHANGE")) {
            for (local ent = null; ent = Entities.FindByClassnameWithin(ent, "prop_monster_box", Vector(-58.406547546387, -59.558124542236, 187.5777130127), 800);) {
                ent.__KeyValueFromString("targetname", "button_1_solved_TURRETNAMECHANGE")
            }
        }

        //PermaDestroyCubesSpA4Intro
        if (PermaDestroyCubesSpA4Intro) {
            for (local ent = null; ent = Entities.FindByClassnameWithin(ent, "prop_monster_box", Vector(-58.406547546387, -59.558124542236, 187.5777130127), 800);) {
                ent.Destroy()
            }
        }

        if (OnlyOnceSpA4Intro) {
            if (!Entities.FindByName(null, "room2_wall_open_trigger")) {
                printlP2MM(0, true, "Elevator viewcontrol activated!")
                // Elevator viewcontrol
                Entities.FindByName(null, "@exit_door2-close_door_rl").__KeyValueFromString("targetname", "moja5")

                EntFireByHandle(Entities.FindByName(null, "button_2_unpressed"), "AddOutput", "OnTrigger moja5:Trigger", 0, null, null)

                OnlyOnceSpA4Intro <- false
            }
        }
    }
}

function SpawnBackupCube() {
    CanSpawnCubeInit = false
    EntFire("cube_dropper_box_spawner_override_p2mm", "forcespawn", "", 0, null)
    EntFire("p2mm_servercommand", "command", "script SpawnCube = true", 0.2, null)
    EntFire("p2mm_servercommand", "command", "script CanSpawnCubeInit = true", 0.2, null)
    EntFire("p2mm_servercommand", "command", "script CubeBeingSpawned = Entities.FindByName(null, \"cube_dropper_box\")", 0.1, null)
    EntFire("p2mm_servercommand", "command", "script Entities.FindByName(null, \"cube_dropper_box\").__KeyValueFromString(\"targetname\", \"p2mm_box_yes\")", 0.1, null)
    EntFire("p2mm_servercommand", "command", "script CubeBeingSpawned.SetOrigin(Vector(-394, -270, 1350))", 0.1, null)
    EntFire("p2mm_servercommand", "command", "script printP2MM(0, true, CubeBeingSpawned)", 0.13, null)
}

function MoveCubeDropper() {
    SpawnCube = false
    CubeBeingSpawned = null
    CanSpawnCubeInit = false
    FullDisableOldDropper = true
    for (local ent = null; ent = Entities.FindByName(ent, "cube_dropper_box");) {
        ent.Destroy()
    }
    Entities.FindByName(null, "cube_dropper_box_spawner_override_p2mm").__KeyValueFromString("targetname", "cube_dropper_box_spawner")
    EntFire("cube_dropper_box_spawner", "forcespawn", "", 5, null)
    EntFire("cube_dropper_box_spawner", "forcespawn", "", 8.1, null)
    EntFire("p2mm_servercommand", "command", "script Entities.FindByName(null, \"cube_dropper_box\").Destroy()", 6.45, null)
    EntFire("p2mm_servercommand", "command", "script Entities.FindByName(null, \"cube_dropper_box\").Destroy()", 6.45, null)
    Entities.FindByName(null, "cube_dropper_prop").SetOrigin(Vector(1504, -640, 808))
    Entities.FindByName(null, "cube_dropper_prop").SetAngles(0, 270, 0)
    // set anim to open item_dropper_openitem_dropper_open
    EntFire("cube_dropper_prop", "setanimation", "item_dropper_open", 0, null)
    EntFire("cube_dropper_prop", "setanimation", "item_dropper_close", 8, null)

    PermaDestroyCubesSpA4Intro = true

    // Entities.FindByName(null, "cube_dropper_box").SetOrigin(Vector(1504, -649, 1270))
    // EntFireByHandle(Entities.FindByName(null, "cube_dropper_box"), "wake", "", 0, null, null)
}