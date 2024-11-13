// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗             ███╗             ██╗   ██╗ █████╗   ███╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝            ████║             ██║   ██║██╔══██╗ ████║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝            ██╔██║             ╚██╗ ██╔╝██║  ██║██╔██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝             ╚═╝██║              ╚████╔╝ ██║  ██║╚═╝██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗███████╗██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚══════╝╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

b_TournamentMode <- GetConVarInt("p2mm_gelocity_tournamentmode") // Locks down somethings so the host has full control.

i_GameLaps <- 3 // Gelocity race laps
b_FinalLap <- false // Flag signifying the last lap of the race
l_WinnerList <- [] // List of winning players
b_RaceStarted <- false // Flag for trigger checking for the host ot start the map

MAP_CHECKPOINTS <- [
    "checkpoint_1",
    "checkpoint_2",
    "checkpoint_3",
    "checkpoint_4",
    "checkpoint_5",
    "checkpoint_6",
    "checkpoint_7",
    "checkpoint_8"
]

MAP_SPAWNPOINTS <- {
    checkpoint_1_blue   = [Vector(2240, -3584, 96), Vector(0, 90, 0)],
    checkpoint_1_orange = [Vector(2048, -3584, 96), Vector(0, 90, 0)],
    
    checkpoint_2_blue   = [Vector(1288 4832 -152), Vector(0, 270, 0)],
    checkpoint_2_orange = [Vector(1544 4832 -152), Vector(0, 270, 0)],
    
    checkpoint_4_blue   = [Vector(-3328, 1248, 352), Vector(0, 180, 0)],
    checkpoint_4_orange = [Vector(-3328, 1104, 352), Vector(0, 180, 0)],

    checkpoint_5_blue   = [Vector(-6464, 1384, -28), Vector(0, 90, 0)],
    checkpoint_5_orange = [Vector(-6608, 1384, -28), Vector(0, 90, 0)],

    checkpoint_7_blue   = [Vector(-4608, -3152, 352), Vector(0, 0, 0)],
    checkpoint_7_orange = [Vector(-4608, -3024, 352), Vector(0, 0, 0)]
}

function DevFillPassedPoints(index) {
    player <- UTIL_PlayerByIndex(index)
    playerClass <- FindPlayerClass(player)
    playerClass.l_PassedCheckpoints.clear()
    playerClass.l_PassedCheckpoints.extend(MAP_CHECKPOINTS)
}

function WonRace(playerClass) {
    // A player won! Trigger their teams win relay!
    if (playerClass.player.GetTeam() == TEAM_BLUE) {
        EntFire("blue_wins", "Trigger")
        EntFire("orange_wins", "Kill")
    } else {
        EntFire("orange_wins", "Trigger")
        EntFire("blue_wins", "Kill")
    }

    // Check to make sure if anyone triggers WonRace and they are already on the winner list to return.
    foreach (index, winner in l_WinnerList) {
        // Only add someone to the list when they aren't already on and its not already containing a certain amount.
        if (winner == playerClass.player.GetName() || index >= (b_TournamentMode ? 9 : 2)) return
    }
    l_WinnerList.append(playerClass.username) // Add winner to the list.

    // Setup the place postfix and color that will be sent in HudPrint.
    local placeString = "th"
    local placeColor = Vector(255, 255, 255)
    switch (l_WinnerList.len()) {
        case (1):
            placeString = "st"
            placeColor = Vector(255, 255, 0)
            break
        case (2):
            placeString = "nd"
            placeColor = Vector(140, 150, 140)
            break
        case (3):
            placeString = "rd"
            placeColor = Vector(150, 75, 0)
            break
        default:
            break
    }
    HudPrint(playerClass.player.entindex(), "FINISHED " + l_WinnerList.len() + placeString + "!", -1, 0.2, 0, placeColor, 255, Vector(0, 0, 0), 0, 0, 1, 3, 0, 3)
    SendToChat(0, "\x04" + playerClass.username + " Has Passed The Finish Line For " + l_WinnerList.len() + placeString + " Place!")
}

function CheckCompletedLaps(player, checkpoint) {
    local playerClass = FindPlayerClass(player)
    if (GetDeveloperLevelP2MM()) {
        foreach (checkpoint in playerClass.l_PassedCheckpoints) {
            printlP2MM(0, true, "" + checkpoint)
        }
    }

    // Only check for completed laps if the passed checkpoints is less to the MAP_CHECKPOINTS length and if the player hasn't finished the race.
    if (playerClass.l_PassedCheckpoints.len() < MAP_CHECKPOINTS.len() || playerClass.b_FinishedRace) return

    // Check if the player has all the required MAP_CHECKPOINTS required to complete a lap.
    for (local i = 0; i < MAP_CHECKPOINTS.len(); i++) {
        if (playerClass.l_PassedCheckpoints[i] != MAP_CHECKPOINTS[i]) return
    }

    // Player has completed the lap.
    playerClass.i_CompletedLaps++
    printlP2MM(0, true, "LAP COMPLETE")
    // The first player has reached the final lap.
    if (playerClass.i_CompletedLaps == i_GameLaps && !b_FinalLap) {
        EntFire("last_lap", "PlaySound")
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", -1, 0.2, 2, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 1, 0, 3)
        SendToChat(0, "\x04" + playerClass.username + " HAS REACHED THE FINAL LAP!")
    }
    // Other player have reached the final lap.
    else if (playerClass.i_CompletedLaps == i_GameLaps && b_FinalLap) {
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", -1, 0.2, 2, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 1, 0, 3)
    }
    // Player has completed a lap.
    else if (playerClass.i_CompletedLaps != i_GameLaps && playerClass.i_CompletedLaps < i_GameLaps) {
        HudPrint(playerClass.player.entindex(), "COMPLETED LAP " + playerClass.i_CompletedLaps + "!", -1, 0.2, 2, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, 0.2, 0.5, 1, 1, 3)
    }
    
    // Check if the player has completed all the laps, if so, they won!
    if (playerClass.i_CompletedLaps >= i_GameLaps + 1) {
        playerClass.b_FinishedRace = true
        WonRace(playerClass)
        return
    }
    // Clear the passed checkpoint list for the next lap.
    printlP2MM(0, true, "CLEAR")
    playerClass.l_PassedCheckpoints.clear()
}

function CheckpointHit(p, checkpoint) {
    local player = FindPlayerClass(p)
    // Dev debug
    printlP2MM(0, true, p.tostring())
    printlP2MM(0, true, player.username)
    printlP2MM(0, true, checkpoint)
    printlP2MM(0, true, "checkpoint hit")

    if (player.b_FinishedRace) return // Only register a checkpoint as hit when the player hasn't finished the race.

    // Dev debug
    if (GetDeveloperLevelP2MM()) {
        HudPrint(p.entindex(), "CHECKPOINT: " + checkpoint, -1, 0.2, 0, Vector(0, 0, 255), 255, Vector(0, 0, 255), 255, 0.5, 0.5, 1, 0, 2)
    }

    // Check if the player hasn't already passed the point.
    foreach (passedpoint in player.l_PassedCheckpoints) {
        printlP2MM(0, true, passedpoint)
        if (checkpoint == passedpoint) return
    }

    player.s_LastCheckPoint = checkpoint
    // Make sure no duplicate checkpoints are added to the player's passed checkpoints list.
    foreach (index, point in player.l_PassedCheckpoints) {
        if (checkpoint == player.l_PassedCheckpoints[index]) return
    }
    player.l_PassedCheckpoints.append(checkpoint)
    printlP2MM(0, true, "checkpoint passed")
}

function StartGelocityRace() {
    b_RaceStarted = true;
    // Close the panels to keep the players in.
    EntFire("door2_player1", "SetAnimation", "90down")
    EntFire("door2_player2", "SetAnimation", "90down")
    EntFire("start_clip_1", "Enable")
    EntFire("start_clip_2", "Enable")

    // Move everyone into their respective start positions.
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        p.SetAngles(0, 90, 0)
        if (p.GetTeam() == TEAM_RED) {
            p.SetOrigin(Vector(2047, -3583, 64))
        } else {
            p.SetOrigin(Vector(2240, -3583, 64))
        }
    }

    // Lock the buttons so no one can change the laps once the game started.
    EntFire("rounds_button_1", "Lock")
    EntFire("button_1", "Skin", "1")
    EntFire("rounds_button_2", "Lock")
    EntFire("button_2", "Skin", "1")

    // Start the countdown... and the RACE!
    EntFire("start_relay", "Trigger")
}

// When a player respawns, send them back to the last spawning checkpoint they've passed as indicated by v_SpawnVector.
function GEPlayerRespawn(player) {
    local playerClass = FindPlayerClass(player)

    if (playerClass.v_SpawnVector == null) return;

    player.SetOrigin(playerClass.v_SpawnVector[0])
    player.SetAngles(playerClass.v_SpawnVector[1].x, playerClass.v_SpawnVector[1].y, playerClass.v_SpawnVector[1].z)
}

// If a player dies, set spawn vector to be at the last applicable spawn point.
function GEPlayerDeath(userid, attacker, entindex) {
    printlP2MM(0, false, "tejasdfhasjdf")
    local player = UTIL_PlayerByIndex(entindex) 
    local playerClass = FindPlayerClass(player)

    if (playerClass.s_LastCheckPoint == "start") { return }

    foreach (spawn_name, spawn_vector in MAP_SPAWNPOINTS) {
        printlP2MM(0, false, spawn_name.tostring())
        if (playerClass.s_LastCheckPoint + (player.GetTeam() == TEAM_BLUE ? "_blue" : "_orange") == spawn_name) {
            playerClass.v_SpawnVector = spawn_vector
            return
        }
    }
    printlP2MM(1, false, "Player last checkpoint does not match any on the list!")
}

// Add a lap to i_GameLaps.
function GameLapsAdd() {
    if (i_GameLaps >= 300) return

    i_GameLaps++
    HudPrint(0, "Laps: " + i_GameLaps, -1, 0.2, 0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 0.5, 0, 3)

    if (i_GameLaps >= 300) {
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Lock", "", 0, null)
        EntFire("button_1", "Skin", "0", 0, null)
        EntFire("button_2", "Skin", "1", 0, null)
        return
    }

    if (i_GameLaps < 300 && i_GameLaps > 1) {
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Unlock", "", 0, null)
        EntFire("button_1", "Skin", "0", 0, null)
        return
    }
}

// Subtract a lap to i_GameLaps.
function GameLapsSub() {
    if (i_GameLaps <= 1) return

    i_GameLaps--
    HudPrint(0, "Laps: " + i_GameLaps, -1, 0.2, 0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 0.5, 0, 3)
    
    if (i_GameLaps <= 1) {
        EntFire("rounds_button_1", "Lock", "", 1, null)
        EntFire("rounds_button_2", "Unlock", "", 1, null)
        EntFire("button_2", "Skin", "0", 0, null)
        EntFire("button_1", "Skin", "1", 0, null)
        return
    }

    if (i_GameLaps < 300 && i_GameLaps > 1) {      
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Unlock", "", 0, null)
        EntFire("button_2", "Skin", "0", 0, null)
        return
    }
}

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // So nobody spawns here.
        Entities.FindByClassname(null, "info_player_start").Destroy()

        // Remove test chamber VGUI screen as it doesn't work.
        EntFire("info_sign-info_panel", "Kill")
        EntFire("info_sign-info_panel", "Kill", "", 0.1)

        // Remove the lap counters, VScript will keep track instead.
        Entities.FindByName(null, "rounds").Destroy()
        for (local ent = null; ent = Entities.FindByName(null, "round_counter_orange");) {
            ent.Destroy()
        }
        for (local ent = null; ent = Entities.FindByName(null, "round_counter_blue");) {
            ent.Destroy()
        }

        // Remove all the original checkpoint triggers.
        for (local trigger = null; trigger = Entities.FindByClassname(trigger, "trigger_playerteam");) {
            if ((trigger.GetName().find("checkpoint_blue_") != null) || (trigger.GetName().find("checkpoint_orange_") != null)) {
                trigger.Destroy()
            }
        }

        // We have our own respawning system for all players. Delete all but the initial ones.
        for (local ent; ent = Entities.FindByClassname(ent, "info_coop_spawn");) {
            if (ent.GetName().find("initial_spawn") == null) {
                ent.Destroy()
            }
        }
        
        // Make buttons increase the VScript lap counter.
        EntFire("rounds_button_1", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsSub():0:-1")
        EntFire("rounds_button_2", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsAdd():0:-1")

        // Remove starting race triggers.
        Entities.FindByName(null, "trigger1_1").Destroy()
        Entities.FindByName(null, "trigger1_1").Destroy()

        // Remove back win panels.
        Entities.FindByNameNearest("trigger_blue_wins", Vector(1890, -386, -122), 250).Destroy()
        Entities.FindByNameNearest("trigger_orange_wins", Vector(1890, -386, -122), 250).Destroy()

        // Make sure the exit panels do not open up so players can't restart or exit the map.
        Entities.FindByName(null, "exit_sound_2").Destroy()
        for (local panel = null; panel = Entities.FindByClassnameWithin(panel, "prop_dynamic", Vector(2464, -388, -142), 250) ; ) {
            if (panel.GetModelName() == "models/anim_wp/telescope_arm_128/telescope_arm_128_glass.mdl") {
                panel.__KeyValueFromString("targetname", "exit_room_panel")
                EntFireByHandle(panel, "SetAnimation", "90idle", 0, null, null)
            }
        }

        // Destroy the view controls for the disassembler.
        Entities.FindByClassname(null, "point_viewcontrol_multiplayer").Destroy()
        Entities.FindByClassname(null, "point_viewcontrol_multiplayer").Destroy()

        // Tournament mode stuff
        if (b_TournamentMode) {
            Config_HostOnlyChatCommands <- true // Make sure no other chat commands can be used.

            // Disabled round and music buttons so only host can remotely control their values.
            EntFire("button_music_1", "Skin", "1")
            EntFire("button_music_2", "Skin", "1")
            EntFire("music_button_1", "Kill")
            EntFire("music_button_2", "Kill")
            EntFire("rounds_button_1", "Kill")
            EntFire("rounds_button_2", "Kill")
            EntFire("button_1", "Skin", "1")
            EntFire("button_2", "Skin", "1")

            // Remove hint triggers for round and music buttons.
            Entities.FindByClassnameNearest("trigger_multiple", Vector(2264, -4096, 64), 10).Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(2024, -4096, 64), 10).Destroy()

            // Remove triggers which show hints and the buttons for opening remote views.
            Entities.FindByClassnameNearest("trigger_playerteam", Vector(2296, -3904, 64), 10).Destroy()
            Entities.FindByClassnameNearest("trigger_playerteam", Vector(1984, -3904, 64), 10).Destroy()
            Entities.FindByName(null, "button_1_view_blue").Destroy()
            Entities.FindByName(null, "button_1_view_orange").Destroy()
        }
    }

    if (MSLoop) {
        // Trigger checking for host in the start space only for non-tournament mode.
        if (!b_TournamentMode && !b_RaceStarted) {
            local host_start_checkpoint = CreateTrigger("player", 2304, -3520, 192, 1984, -3584, 0)
            foreach (player in host_start_checkpoint) {
                if (player.entindex() == 1) {
                    StartGelocityRace()
                    break
                }  
            }
        }
        // Checkpoint 1: First checkpoint of the map, acts also as the finish line.
        local checkpoint_1 = CreateTrigger("player", 1920, -1792, -256, 2432, -1664, 256)
        foreach (player in checkpoint_1) {
            CheckpointHit(player, "checkpoint_1")
            CheckCompletedLaps(player, "checkpoint_1")
        }

        // Checkpoint 2: Before the big jump, after the light bride section.
        local checkpoint_2 = CreateTrigger("player", 1152, 4736, -256, 1664, 4864, 8)
        foreach (player in checkpoint_2) {
            CheckpointHit(player, "checkpoint_2")
        }

        // Checkpoint 3: Before the PUMP STATION ALPHA sign before the crusher pit.
        local checkpoint_3 = CreateTrigger("player", -2816, 3520, -384, -2304, 3712, 0)
        foreach (player in checkpoint_3) {
            CheckpointHit(player, "checkpoint_3")
        }

        // Checkpoint 4: At the crusher pit.
        local checkpoint_4 = CreateTrigger("player", -3568, 896, -256, -3840, 1408, 128)
        foreach (player in checkpoint_4) {
            CheckpointHit(player, "checkpoint_4")
        }

        // Checkpoint 5: After the crusher pit.
        local checkpoint_5 = CreateTrigger("player", -6784, 1408, -256, -6272, 1664, 128)
        foreach (player in checkpoint_5) {
            CheckpointHit(player, "checkpoint_5")
        }
    
        // Checkpoint 6: Neurotoxin generator.
        local checkpoint_6 = CreateTrigger("player", -5632, 0, -256, -5824, 512, 128)
        foreach (player in checkpoint_6) {
            CheckpointHit(player, "checkpoint_6")
        }

        // Checkpoint 7: Before goo lake.
        local checkpoint_7 = CreateTrigger("player", -4164, -2816, -258, -3968, -3328, 128)
        foreach (player in checkpoint_7) {
            CheckpointHit(player, "checkpoint_7")
        }

        // Checkpoint 8: Before finish line.
        local checkpoint_8 = CreateTrigger("player", 128, -2816, -256, 260, -3328, 0)
        foreach (player in checkpoint_8) {
            CheckpointHit(player, "checkpoint_8")
        }
    }
}