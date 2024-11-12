// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗             ███╗             ██╗   ██╗ █████╗   ███╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝            ████║             ██║   ██║██╔══██╗ ████║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝            ██╔██║             ╚██╗ ██╔╝██║  ██║██╔██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝             ╚═╝██║              ╚████╔╝ ██║  ██║╚═╝██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗███████╗██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚══════╝╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

GelocityRounds <- 3
GameDoneGelocity <- false

const LAP_CHECKPOINT1 = 0
const LAP_CHECKPOINT2 = 1
const LAP_FINISHLINE = 2

function StartGelocityTeleport() {
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetAngles(0, 90, 0)
        if (p.GetTeam() == TEAM_RED) {
            p.SetOrigin(Vector(2047, -3583, 64))
        } else {
            p.SetOrigin(Vector(2240, -3583, 64))
        }
    }

    // Lock this so no one can change the laps once the game started
    EntFire("rounds_button_2", "lock")
    EntFire("button_2", "skin", "1")
}

// TODO: remove these functions and call the lap increment/decrement in the output itself
function AddLap() {
    GelocityRounds++
    printlP2MM(0, true, "" + GelocityRounds)
}

function SubtractLap() {
    GelocityRounds--
    printlP2MM(0, true, "" + GelocityRounds)
}

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // We have our own respawning system for all players
        // Delete the unnecessary ones
        for (local ent; ent = Entities.FindByClassname(ent, "info_coop_spawn");) {
            if (ent.GetName() != "blue_dropper-initial_spawn" &&
                ent.GetName() != "blue_spawner1" &&
                ent.GetName() != "red_dropper-initial_spawn" &&
                ent.GetName() != "red_spawner1") {
                ent.Destroy()
            }
        }

        // Steal this one to display stuff properly
        Entities.FindByName(null, "rounds_text_blue").__KeyValueFromString("targetname", "p2mm_rounds_text_override")

        Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(2165, -2195, 368))

        Entities.FindByName(null, "checkpoint_orange_1").Destroy()
        Entities.FindByName(null, "checkpoint_blue_1").Destroy()

        Entities.FindByName(null, "start_relay").ConnectOutput("OnTrigger", "StartGelocityTeleport")
        Entities.FindByName(null, "rounds_button_2").ConnectOutput("OnPressed", "AddLap")
        Entities.FindByName(null, "rounds_button_1").ConnectOutput("OnPressed", "SubtractLap")

        Entities.FindByName(null, "win_door_1_orange").__KeyValueFromString("targetname", "win_door_1_orange_override")
        Entities.FindByName(null, "win_door_1_blue").__KeyValueFromString("targetname", "win_door_1_blue_override")

        // Entities.FindByName(null, "rounds").Destroy()
    }

    if (MSLoop) {
        // TODO: Combine all of the loops below
        // If we are still racing, update the statuses of everyone
        if (!GameDoneGelocity) {
            // Respawning system ?
            // (get all players at finish line coordinates aka info_player_start repositioned)
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(2165, -2195, 368), 128);) {
                switch (FindPlayerClass(p).GelocityCheckPointType) {
                case 0:
                    p.SetOrigin(Vector(2164, -1866, -191))
                    p.SetAngles(0, 90, 0)
                    break
                case 1:
                    p.SetOrigin(Vector(-3329, 1250, 386))
                    p.SetAngles(0, -180, 0)
                    break
                case 2:
                    p.SetOrigin(Vector(-5363, -3072, 64))
                    p.SetAngles(0, 0, 0)
                    break
                default:
                    p.SetOrigin(Vector(2164, -1866, -191))
                    p.SetAngles(0, 90, 0)
                }
            }

            // Checkpoint
            // All players must hit this area in the map before they can increment their laps
            local Checkpoint1 = CreateTrigger("player", -3131.35, 1598.79, -423.305, -3868.24, 814.012, 801.228)
            foreach (player in Checkpoint1) {
                local playerclass = FindPlayerClass(player)
                if (playerclass.GelocityCheckPointType == LAP_CHECKPOINT1) {
                    playerclass.GelocityCheckPointType = LAP_CHECKPOINT2
                }
            }

            // Checkpoint2
            // All players must hit this area in the map before they can increment their laps
            local Checkpoint2 = CreateTrigger("player", -4878.03, -3548.62, 602.766, -5098.68, -2747.39, -235.222)
            foreach (player in Checkpoint2) {
                local playerclass = FindPlayerClass(player)
                if (playerclass.GelocityCheckPointType == LAP_CHECKPOINT2) {
                    playerclass.GelocityCheckPointType = LAP_FINISHLINE
                }
            }

            // Finish line
            local FinishLinePlayer = CreateTrigger("player", 1892.304077, -1919.934570, -294.686737, 2472.500732, -1682.512573, 163.864502)
            foreach (player in FinishLinePlayer) {
                local playerclass = FindPlayerClass(player)
                if (playerclass.GelocityCheckPointType == LAP_FINISHLINE) {
                    playerclass.GelocityCheckPointType = LAP_CHECKPOINT1

                    // Lap logic
                    local playerclass = FindPlayerClass(player)
                    playerclass.nCurrentLap++

                    // Second to last lap
                    if (playerclass.nCurrentLap == GelocityRounds - 1) {
                        EntFire("last_lap_text", "Display")
                        EntFire("music_0_relay", "Trigger")
                        EntFire("last_lap", "playsound")
                    }

                    // Set message text color
                    local pcolor = playerclass.color
                    Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("color", pcolor.r.tostring() + " " + pcolor.g.tostring() + " " + pcolor.b.tostring())

                    // Set message text (and trigger ending game event if final lap)
                    if (playerclass.nCurrentLap < GelocityRounds) {
                        EntFire("p2mm_rounds_text_override", "SetText", playerclass.username + " is now on lap " + playerclass.nCurrentLap, 0.1)
                    } else {
                        GameDoneGelocity = true

                        // Set Message Text
                        Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("message", playerclass.username +" has won the game!")
                        
                        if (player.GetTeam() == TEAM_RED) {
                            EntFire("orange_wins", "Trigger")
                            EntFire("win_door_2_orange", "color", pcolor.r.tostring() + " " + pcolor.g.tostring() + " " + pcolor.b.tostring())
                            Entities.FindByName(null, "win_door_2_blue").Destroy()
                        } else {
                            EntFire("blue_wins", "Trigger")
                            EntFire("win_door_1_blue", "color", pcolor.r.tostring() + " " + pcolor.g.tostring() + " " + pcolor.b.tostring())
                            Entities.FindByName(null, "win_door_2_orange").Destroy()
                        }

                        Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("holdtime", "8")
                    }

                    // Display it
                    EntFire("p2mm_rounds_text_override", "Display")
                }
            }
        }
    }
}