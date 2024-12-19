// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗           ██████╗            ██╗   ██╗ █████╗   ███╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝           ╚════██╗           ██║   ██║██╔══██╗ ████║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝              ███╔═╝           ╚██╗ ██╔╝██║  ██║██╔██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝             ██╔══╝              ╚████╔╝ ██║  ██║╚═╝██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗███████╗██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚══════╝╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

WinCondition <- false

Gelocity2LapCount <- 3
function Gelocity2AddLap() {
    if (Gelocity2LapCount < 50) {
        Gelocity2LapCount = Gelocity2LapCount + 1
    } else {
        if (Gelocity2LapCount < 200) {
            Gelocity2LapCount = Gelocity2LapCount + 5
        } else {
            if (Gelocity2LapCount < 500) {
                Gelocity2LapCount = Gelocity2LapCount + 10
            } else {
                if (Gelocity2LapCount < 1000) {
                    Gelocity2LapCount = Gelocity2LapCount + 50
                } else {
                    if (Gelocity2LapCount < 5000) {
                        Gelocity2LapCount = Gelocity2LapCount + 100
                    } else {
                        if (Gelocity2LapCount < 10000) {
                            Gelocity2LapCount = Gelocity2LapCount + 1000
                        } else {
                            Gelocity2LapCount = Gelocity2LapCount + 1500
                        }
                    }
                }
            }
        }
    }

    printlP2MM(0, true, "Gelocity2LapCount: " + Gelocity2LapCount)
    Entities.FindByName(null, "change_rounds_text_override").__KeyValueFromString("message", Gelocity2LapCount + " Laps")
    EntFire("change_rounds_text_override", "Display")
    EntFire("button_1_override", "Skin", "0")
    EntFire("rounds_button_1_override", "unlock")
}
function Gelocity2RemoveLap() {
    if (Gelocity2LapCount < 50) {
        Gelocity2LapCount = Gelocity2LapCount - 1
        if (Gelocity2LapCount < 2) {
            Gelocity2LapCount = 2
        }
    } else {
        if (Gelocity2LapCount < 200) {
            Gelocity2LapCount = Gelocity2LapCount - 5
        } else {
            if (Gelocity2LapCount < 500) {
                Gelocity2LapCount = Gelocity2LapCount - 10
            } else {
                if (Gelocity2LapCount < 1000) {
                    Gelocity2LapCount = Gelocity2LapCount - 50
                } else {
                    if (Gelocity2LapCount < 5000) {
                        Gelocity2LapCount = Gelocity2LapCount - 100
                    } else {
                        if (Gelocity2LapCount < 10000) {
                            Gelocity2LapCount = Gelocity2LapCount - 1000
                        } else {
                            Gelocity2LapCount = Gelocity2LapCount - 1500
                        }
                    }
                }
            }
        }
    }
    printlP2MM(0, true, "Gelocity2LapCount: " + Gelocity2LapCount)
    Entities.FindByName(null, "change_rounds_text_override").__KeyValueFromString("message", Gelocity2LapCount + " Laps")
    EntFire("change_rounds_text_override", "Display")
    if (Gelocity2LapCount <= 2) {
        EntFire("button_1_override", "Skin", "1")
        EntFire("rounds_button_1_override", "lock")
    }
}

function YeetThePaint() {
    printlP2MM(0, false, "Yall Playing GELOCITY!");
    local ent = null
    for (local ent = null; ent = Entities.FindByClassname(ent, "paint_sphere");) {
        // EntFire(ent.GetName(), "paint", "", 0.8)
        // EntFire(ent.GetName(), "kill", "", 1)
        ent.Destroy()
    }
}

OneTimeGel <- true
CanCheckpointGel <- false
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        RemoveAllClassname("light_spot")
        RemoveAllClassname("beam_spotlight")
        RemoveAllClassname("logic_auto", 5)
        RemoveAllClassname("keyframe_rope")
        RemoveAllClassname("env_sprite")
        Entities.FindByName(null, "clip_start").Destroy()

        local ent = null
        for (local ent = null; ent = Entities.FindByName(null, "door_start_1_1");) {
            ent.__KeyValueFromString("targetname", "door_start_1_1_override")
        }
        local ent = null
        for (local ent = null; ent = Entities.FindByName(null, "door_start_1_2");) {
            ent.__KeyValueFromString("targetname", "door_start_1_2_override")
        }

        EntFire("checkpoint_orange_1", "kill")
        EntFire("checkpoint_blue_1", "kill")

        // printlP2MM("Yall Playing GELOCITY");
        // local ent = null
        // for (local ent = null; ent = Entities.FindByClassname(ent, "paint_sphere")) {
        //     EntFire(ent.GetName(), "paint", "", 0.8)
        //     EntFire(ent.GetName(), "kill", "", 1)
        // }
        // Yeet Paint
        //EntFire("gel_relay", "AddOutput", "OnTrigger:p2mm_servercommand:command:script YeetThePaint():2.2", 0.1)

        // Nessasary Stuff
        // EntFire("door_end_2", "AddOutput", "targetname door_end_2_override", 5)
        // EntFire("door_end_1", "AddOutput", "targetname door_end_1_override", 5)
        //Entities.FindByName(null, "red_dropper-initial_spawn").__KeyValueFromString("targetname", "p2mmspawn_override_red")
        redspawncoords <- Entities.FindByName(null, "red_dropper-initial_spawn").GetOrigin()
        //Entities.FindByName(null, "blue_dropper-initial_spawn").__KeyValueFromString("targetname", "p2mmspawn_override_blue")
        bluespawncoords <- Entities.FindByName(null, "blue_dropper-initial_spawn").GetOrigin()
        EntFire("p2mmspawn_override_red", "Disable")
        EntFire("p2mmspawn_override_blue", "Disable")
        EntFire("p2mmspawn_override_red", "setasactivespawn", "", 0.05)
        EntFire("p2mmspawn_override_blue", "setasactivespawn", "", 0.05)
        local ent = null
        for (local ent = null; ent = Entities.FindByClassname(ent, "info_coop_spawn");) {
            if (ent.GetName() != "blue_dropper-initial_spawn" && ent.GetName() != "red_dropper-initial_spawn") {
                ent.Destroy()
            }
        }

        Entities.FindByName(null, "gel_relay").__KeyValueFromString("targetname", "gel_relay_override")
        // EntFire("gel_relay_override", "Trigger", "", 2)
        //EntFire("gel_relay_override", "kill", "", 0.2)
        Entities.FindByName(null, "gel_killer").Destroy()
        //relay_death_field_off_3
        Entities.FindByName(null, "relay_death_field_off_1").Destroy()
        Entities.FindByName(null, "relay_death_field_off_2").Destroy()
        Entities.FindByName(null, "relay_death_field_off_3").Destroy()

        // Restart Level
        EntFire("restart_manager", "addouput", "OnChangeToAllTrue scom:command:portal2mpSa8t:1.5")

        // Cosmetic Stuff
        Entities.FindByName(null, "second_blue").Destroy()
        Entities.FindByName(null, "second_orange").Destroy()

        // INFINITE LAPS
        Entities.FindByName(null, "rounds_button_1").__KeyValueFromString("targetname", "rounds_button_1_override")
        Entities.FindByName(null, "rounds_button_2").__KeyValueFromString("targetname", "rounds_button_2_override")
        Entities.FindByName(null, "change_rounds_text").__KeyValueFromString("targetname", "change_rounds_text_override")
        Entities.FindByName(null, "button_2").__KeyValueFromString("targetname", "button_2_override")
        Entities.FindByName(null, "button_1").__KeyValueFromString("targetname", "button_1_override")
        Entities.FindByName(null, "rounds_text_blue").__KeyValueFromString("targetname", "p2mm_laps_text")
        //AddLapButton
        EntFire("rounds_button_2_override", "AddOutput", "OnPressed button_2_override:SetAnimation:press_release")
        EntFire("rounds_button_2_override", "AddOutput", "OnPressed p2mm_servercommand:command:script Gelocity2AddLap()")
        //RemoveLapButton
        EntFire("rounds_button_1_override", "AddOutput", "OnPressed button_1_override:SetAnimation:press_release")
        EntFire("rounds_button_1_override", "AddOutput", "OnPressed p2mm_servercommand:command:script Gelocity2RemoveLap()")
    }

    if (MSLoop) {
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(2556, -7747, 441), 100);) {
            CanCheckpointGel <- true
        }

        // Setup Everyone's Class
        // MOVED TO CreateGenericPlayerClass()
        // for (local p; p = Entities.FindByClassname(p, "player");) {
        //     local CurrentPlayerClass = FindPlayerClass(p)
        //     try {
        //         local test1 = CurrentPlayerClass.Gelocity2Checkpoint
        //         local test2 = CurrentPlayerClass.nCurrentLap
        //         local test3 = CurrentPlayerClass.Gelocity2CheckpointMove
        //     } catch(e) {
        //         CurrentPlayerClass.Gelocity2Checkpoint <- true
        //         CurrentPlayerClass.nCurrentLap <- -1
        //         CurrentPlayerClass.Gelocity2CheckpointMove <- class {
        //             pos = Vector(2580, -4399,  267)
        //             rot = Vector(0, 90, 0)
        //         }
        //     }
        // }

        if (CanCheckpointGel) {
            // Teleport Player to Checkpoint
            for (local p; p = Entities.FindByClassnameWithin(p, "player", redspawncoords, 250);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                TeleportPlayerToClass(p, CurrentPlayerClass.Gelocity2CheckpointMove)
            }
            for (local p; p = Entities.FindByClassnameWithin(p, "player", bluespawncoords, 250);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                TeleportPlayerToClass(p, CurrentPlayerClass.Gelocity2CheckpointMove)
            }
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(2558, -8673, -303), 600);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                TeleportPlayerToClass(p, CurrentPlayerClass.Gelocity2CheckpointMove)
            }

            if (OneTimeGel) {
                OneTimeGel <- false
                EntFire("gel_relay_override", "Trigger", "", 1)
                EntFire("j_sphere_3", "paint", "", 0)
                EntFire("j_sphere_3", "paint", "", 30)
                EntFire("j_sphere_4", "paint", "", 0)
                EntFire("j_sphere_4", "paint", "", 30)
            }

            // // Checkpoint Stuff
            // local CPPos = Vector(0, 0, 0)
            // local CPRadius = 0
            // for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                // local CurrentPlayerClass = FindPlayerClass(p)
                // CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                //     pos = Vector(0, 0, 0)
                //     rot = Vector(0, 0, 0)
                // }
            // }

            //-4736.638184 670.896179 500.351471;
            // Fan Checkpoint
            local CPPos = Vector(-4736, 670, 500)
            local CPRadius = 550
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-4737, 1335, 523)
                    rot = Vector(0, -90, 0)
                }
            }
            //2559.886475 -4160.351563 64.031250
            // Finish Line Checkpoint
            local CPPos = Vector(2560, -4160, 64)
            local CPRadius = 550
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(2580, -4399, 267)
                    rot = Vector(0, 90, 0)
                }
            }
            // 2561.067627 1493.421509 -191.96875
            // Funnel Checkpoint
            local CPPos = Vector(2561, 1493, -191)
            local CPRadius = 550
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(2561, 1493, -191)
                    rot = Vector(0, 90, 0)
                }
            }
            // 2675.282959 4715.997070 192.031250
            // Crusher Checkpoint
            local CPPos = Vector(2675, 4715, 192)
            local CPRadius = 600
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(2494, 5592, 192)
                    rot = Vector(0, -180, 0)
                }
            }
            // -1334.455200 5547.971191 192.031250
            // First Jump Checkpoint
            local CPPos = Vector(-1334, 5547, 192)
            local CPRadius = 550
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-550, 5567, 192)
                    rot = Vector(0, -180, 0)
                }
            }
            // -1791.025024 2439.269043 192.031250
            // PitFling 1 Checkpoint
            local CPPos = Vector(-1791, 2439, 192)
            local CPRadius = 600
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-1791, 2439, 192)
                    rot = Vector(0, -90, 0)
                }
            }
            // -7546.169922 404.313812 -191.968750
            // Moving Platform Checkpoint
            local CPPos = Vector(-7546, 404, -191)
            local CPRadius = 600
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-7546, 404, -191)
                    rot = Vector(0, -90, 0)
                }
            }
            // -6145.400879 -3584.231934 -191.968750
            // PitFling 2 Checkpoint
            local CPPos = Vector(-6145, -3584, -191)
            local CPRadius = 600
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-6145, -3584, -191)
                    rot = Vector(0, -90, 0)
                }
            }
            // -2251.945557 -6339.817871 64.031250
            // Laser Checkpoint
            local CPPos = Vector(-2251, -6339, 64)
            local CPRadius = 600
            for (local p; p = Entities.FindByClassnameWithin(p, "player", CPPos, CPRadius);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                CurrentPlayerClass.Gelocity2CheckpointMove <- class {
                    pos = Vector(-2251, -6339, 64)
                    rot = Vector(0, 0, 0)
                }
            }
        }


        // Finish Line
        if (!WinCondition) {
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(2558, -3646, 64), 420);) {
                local CurrentPlayerClass = FindPlayerClass(p)
                local PlayerUsername = CurrentPlayerClass.username
                if (CurrentPlayerClass.Gelocity2Checkpoint) {
                    WinCondition <- false
                    CurrentPlayerClass.nCurrentLap <- CurrentPlayerClass.nCurrentLap + 1
                    if (CurrentPlayerClass.nCurrentLap >= Gelocity2LapCount) {
                        WinCondition <- true
                    }
                    CurrentPlayerClass.Gelocity2Checkpoint <- false
                    // Set Text Color
                    local pcolor = GetPlayerColor(p, true)
                    Entities.FindByName(null, "p2mm_laps_text").__KeyValueFromString("color", pcolor.r.tostring() + " " + pcolor.g.tostring() + " " + pcolor.b.tostring())
                    if (!WinCondition) {
                        printlP2MM(0, false, PlayerUsername + " Completed Lap " + CurrentPlayerClass.nCurrentLap)
                        EntFire("p2mm_laps_text", "SetText", PlayerUsername + " Completed Lap " + CurrentPlayerClass.nCurrentLap, 0.1)
                    } else {
                        printlP2MM(0, false, PlayerUsername + " Won The Race!")
                        SendToConsoleP2MM("say " + PlayerUsername + " Won The Race!")
                        EntFire("p2mm_laps_text", "SetText", PlayerUsername + " Won The Race!", 0.1)
                        //ent_fire first_blue addoutput "rendercolor 255 0 0"
                        if (p.GetTeam() >= TEAM_BLUE) {
                            EntFire("blue_wins", "Trigger")
                        } else {
                            EntFire("orange_wins", "Trigger")
                        }
                        local pcolor2 = GetPlayerColor(p, false)
                        Entities.FindByName(null, "first_orange").__KeyValueFromString("rendercolor", pcolor2.r.tostring() + " " + pcolor2.g.tostring() + " " + pcolor2.b.tostring())
                        Entities.FindByName(null, "first_blue").__KeyValueFromString("rendercolor", pcolor2.r.tostring() + " " + pcolor2.g.tostring() + " " + pcolor2.b.tostring())
                    }
                    EntFire("p2mm_laps_text", "Display", "", 0.2)
                }
            }
        }

        // Checkpoint
        for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-4736, -123, -2373), 420);) {
            local CurrentPlayerClass = FindPlayerClass(p)
            local PlayerUsername = CurrentPlayerClass.username
            if (!CurrentPlayerClass.Gelocity2Checkpoint) {
                CurrentPlayerClass.Gelocity2Checkpoint <- true
                printlP2MM(0, false, PlayerUsername + " Completed Checkpoint")
            }
        }
    }
}