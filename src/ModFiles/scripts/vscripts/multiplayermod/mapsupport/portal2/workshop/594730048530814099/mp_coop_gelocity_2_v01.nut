// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗           ██████╗            ██╗   ██╗ █████╗   ███╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝           ╚════██╗           ██║   ██║██╔══██╗ ████║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝              ███╔═╝           ╚██╗ ██╔╝██║  ██║██╔██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝             ██╔══╝              ╚████╔╝ ██║  ██║╚═╝██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗███████╗██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚══════╝╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

bTournamentMode <- GetConVarInt("p2mm_gelocity_tournamentmode") // Locks down somethings so the host has full control. Default: 0
iGameLaps <- GetConVarInt("p2mm_gelocity_laps_default") // Gelocity race laps. Default: 3
iMusicTrack <- GetConVarInt("p2mm_gelocity_music_default") // Gelocity music track. Default: 0
bFinalLap <- false // Flag signifying the last lap of the race.
lWinnerList <- [] // List of winning players.
bRaceStarted <- false // Flag for checking if the race has started or is in progress.

MAP_CHECKPOINTS <- [
    "checkpoint_1",
    "checkpoint_2",
    "checkpoint_3",
    "checkpoint_4",
    "checkpoint_5",
    "checkpoint_6",
    "checkpoint_7",
    "checkpoint_8",
    "checkpoint_9",
    "checkpoint_10",
    "checkpoint_11",
    "checkpoint_12",
    "checkpoint_13",
    "checkpoint_14"
]

MAP_SPAWNPOINTS <- {
    checkpoint_3_blue   = [Vector(3064, 2752, -112), Vector(0, 0, 0)],
    checkpoint_3_orange = [Vector(3064, 2880, -112), Vector(0, 0, 0)],

    checkpoint_4_blue   = [Vector(3952, 4160, 424), Vector(0, 180, 0)],
    checkpoint_4_orange = [Vector(3952, 4032, 424), Vector(0, 180, 0)],

    checkpoint_5_blue   = [Vector(1344, 5504, 208), Vector(0, 180, 0)],
    checkpoint_5_orange = [Vector(1344, 5504, 208), Vector(0, 180, 0)],

    checkpoint_7_blue   = [Vector(-1888, 1160, 444), Vector(0, 270, 0)],
    checkpoint_7_orange = [Vector(-1696, 1160, 444), Vector(0, 270, 0)],

    checkpoint_8_blue   = [Vector(-4800, 1528, 500), Vector(0, 270, 0)],
    checkpoint_8_orange = [Vector(-4608, 1528, 500), Vector(0, 270, 0)],

    checkpoint_9_blue   = [Vector(-5504, 1632, -116), Vector(0, 180, 0)],
    checkpoint_9_orange = [Vector(-5504, 1440, -116), Vector(0, 180, 0)],

    checkpoint_10_blue   = [Vector(-7584, 264, 0), Vector(0, 270, 0)],
    checkpoint_10_orange = [Vector(-7392, 264, 0), Vector(0, 270, 0)],

    checkpoint_11_blue   = [Vector(-6160, -3126, 0), Vector(0, 270, 0)],
    checkpoint_11_orange = [Vector(-6032, -3126, 0), Vector(0, 270, 0)],

    checkpoint_12_blue   = [Vector(-6336, -6384, -80), Vector(0, 0, 0)],
    checkpoint_12_orange = [Vector(-6336, -6256, -80), Vector(0, 0, 0)],

    checkpoint_13_blue   = [Vector(-2560, -6400, 296), Vector(0, 0, 0)],
    checkpoint_13_orange = [Vector(-2560, -6272, 296), Vector(0, 0, 0)],

    checkpoint_14_blue   = [Vector(-200, -7456, 88), Vector(0, 0, 0)],
    checkpoint_14_orange = [Vector(-200, -7456, 88), Vector(0, 0, 0)]
}

function DevFillPassedPoints(index) {
    local playerClass = FindPlayerClass(PlayerByIndex(index))
    if (!playerClass) return
    playerClass.l_PassedCheckpoints.clear()
    playerClass.l_PassedCheckpoints.extend(MAP_CHECKPOINTS)
}

function WonRace(playerClass) {
    // A player won! Trigger their teams win relay!
    if (playerClass.player.GetTeam() == TEAM_BLUE) {
        EntFire("blue_wins", "Trigger")
        EntFire("orange_wins", "Kill")
        playerClass.v_SpawnVector = null
    } else {
        EntFire("orange_wins", "Trigger")
        EntFire("blue_wins", "Kill")
        playerClass.v_SpawnVector = null
    }

    // Check to make sure if anyone triggers WonRace and they are already on the winner list to return.
    foreach (index, winner in lWinnerList) {
        // Only add someone to the list when they aren't already on and its not already containing a certain amount.
        if (winner == playerClass.player.GetName() || index >= (bTournamentMode ? 9 : 2)) return
    }
    lWinnerList.append(playerClass.username) // Add winner to the list.

    // Setup the place postfix and color that will be sent in HudPrint.
    local placeString = "th"
    local placeColor = Vector(255, 255, 255)
    switch (lWinnerList.len()) {
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

    HudPrint(playerClass.player.entindex(), "FINISHED " + lWinnerList.len() + placeString + "!", Vector(-1, 0.2, 3), 0, 0.0, placeColor, 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 1.5))
    SendToChat(0, "\x04" + playerClass.username + " Has Passed The Finish Line For " + lWinnerList.len() + placeString + " Place!")
}

function KillLosers(player) {
    if (lWinnerList.len() > 0) {
        local playerClass = FindPlayerClass(player)
        if (lWinnerList[0] != playerClass.username) {
            printlP2MM(0, true, playerClass.username + " landed on pedestal, but isn't #1. Killing.")
            player.SetVelocity(Vector(player.GetVelocity().x, player.GetVelocity().y, 500))
            EntFireByHandle(player, "sethealth", "-99999999999", 0.75, null, null)
        } else {
            printlP2MM(0, true, "" + playerClass.username + " landed on pedestal, and is the winner. Not killing.")
            EntFire("glados_6_p2mmoverride", "Start")
        }
    }
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
    if (playerClass.i_CompletedLaps == (iGameLaps - 1) && !bFinalLap) {
        EntFire("last_lap", "PlaySound")
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", Vector(-1, 0.2, 3), 2, 0, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 1))
        SendToChat(0, "\x04" + playerClass.username + " HAS REACHED THE FINAL LAP!")
        bFinalLap = true
    }
    // Other player have reached the final lap.
    else if (playerClass.i_CompletedLaps == (iGameLaps - 1) && bFinalLap) {
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", Vector(-1, 0.2, 3), 2, 0, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 1))
    }
    // Player has completed a lap.
    else if (playerClass.i_CompletedLaps < iGameLaps) {
        HudPrint(playerClass.player.entindex(), "COMPLETED LAP " + playerClass.i_CompletedLaps + "!", Vector(-1, 0.2, 3), 2, 1, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.2, 0.5, 1))
    }

    // Check if the player has completed all the laps, if so, they won!
    if (playerClass.i_CompletedLaps >= iGameLaps) {
        playerClass.b_FinishedRace = true
        WonRace(playerClass)
        return
    }
    // Clear the passed checkpoint list for the next lap.
    printlP2MM(0, true, "CLEAR")
    playerClass.l_PassedCheckpoints.clear()
}

function CheckpointHit(player, checkpoint) {
    local playerClass = FindPlayerClass(player)
    // Dev debug
    printlP2MM(0, true, player.tostring())
    printlP2MM(0, true, playerClass.username)
    printlP2MM(0, true, checkpoint)
    printlP2MM(0, true, "checkpoint hit")

    if (playerClass.b_FinishedRace) return // Only register a checkpoint as hit when the player hasn't finished the race.

    if (playerClass.l_PassedCheckpoints.len() < MAP_CHECKPOINTS.len() - 1 && checkpoint == MAP_CHECKPOINTS[MAP_CHECKPOINTS.len() - 1]) {
        if (player.GetTeam() == TEAM_BLUE) {
            playerClass.v_SpawnVector = null
        } else {
            playerClass.v_SpawnVector = null
        }

        // Delayed because instant respawn makes the game_text disappear.
        EntFireByHandle(player, "RunScriptCode", "HudPrint(" + player.entindex() + ", \"WRONG WAY!\", Vector(-1, 0.6, 3) 0, 0, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, Vector(0, 2, 1))", 0.1, null, null)
        RespawnPlayer(player.entindex())
        return
    }

    // Dev debug
    if (GetDeveloperLevelP2MM()) {
        HudPrint(player.entindex(), "CHECKPOINT: " + checkpoint, Vector(-1, 0.8, 2), 0, 0, Vector(0, 150, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 1))
    }

    // Check if the player hasn't already passed the point.
    foreach (passedpoint in playerClass.l_PassedCheckpoints) {
        printlP2MM(0, true, passedpoint)
        if (checkpoint == passedpoint) return
    }

    playerClass.s_LastCheckPoint = checkpoint
    // Make sure no duplicate checkpoints are added to the player's passed checkpoints list.
    foreach (index, point in playerClass.l_PassedCheckpoints) {
        if (checkpoint == playerClass.l_PassedCheckpoints[index]) return
    }
    playerClass.l_PassedCheckpoints.append(checkpoint)
    printlP2MM(0, true, "checkpoint passed")
}

function HostStartGame(player) {
    if (!bRaceStarted) {
        if (player.entindex() == 1) {
            StartGelocityRace()
            return
        } else {
            player.SetVelocity(Vector(0, -1000, 200))
            HudPrint(player.entindex(), "Only the host can start the game!", Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 3, 0.5))
        }
    }
}

function StartGelocityRace() {
    bRaceStarted = true;

    EntFire("gel_relay_p2mmoverride", "Trigger")

    // Move everyone into their respective start positions.
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        p.SetAngles(0, 0, 0)
        if (p.GetTeam() == TEAM_RED) {
            p.SetOrigin(Vector(2368, -8128, -288))
        } else {
            p.SetOrigin(Vector(2752, -8128, -288))
        }
    }

    // Move start locations incase someone dies without hitting a checkpoint
    Entities.FindByName(null, "red_dropper-initial_spawn").SetOrigin(Vector(2488, -3552, 164))
    Entities.FindByName(null, "blue_dropper-initial_spawn").SetOrigin(Vector(2616, -3552, 164))
    Entities.FindByName(null, "red_dropper-initial_spawn").SetAngles(0, 90, 0)
    Entities.FindByName(null, "blue_dropper-initial_spawn").SetAngles(0, 90, 0)

    // Lock the buttons so no one can change the laps once the game started.
    EntFire("rounds_button_1", "Lock")
    EntFire("button_1", "Skin", "1")
    EntFire("rounds_button_2", "Lock")
    EntFire("button_2", "Skin", "1")

    // Close the doors so no one can escape.
    EntFire("door_start_1_1", "Close")
    EntFire("door_start_1_2", "Close")
    EntFire("door_start_2_1", "Close")
    EntFire("door_start_2_2", "Close")

    // Start the countdown... and the RACE!
    EntFire("button_2_branch_p2mmoverride", "SetValue", "1")
    EntFire("button_1_branch", "SetValue", "1")
    EntFire("coopmanager_start", "SetStateBTrue")
}

// When a player respawns, send them back to the last spawning checkpoint they've passed as indicated by v_SpawnVector.
function GEPlayerRespawn(player) {
    local playerClass = FindPlayerClass(player)

    if (playerClass.v_SpawnVector == null) return

    player.SetOrigin(playerClass.v_SpawnVector[0])
    player.SetAngles(playerClass.v_SpawnVector[1].x, playerClass.v_SpawnVector[1].y, playerClass.v_SpawnVector[1].z)
}

// If a player dies, set spawn vector to be at the last applicable spawn point.
function GEPlayerDeath(userid, attacker, entindex) {
    local player = PlayerByIndex(entindex) 
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

// Add a lap to iGameLaps.
function GameLapsAdd() {
    if (iGameLaps >= 300) return

    iGameLaps++
    HudPrint(0, "Race Laps: " + iGameLaps, Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 0.5))

    if (iGameLaps >= 300) {
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Lock", "", 0, null)
        EntFire("button_1", "Skin", "0", 0, null)
        EntFire("button_2", "Skin", "1", 0, null)
        return
    }

    if (iGameLaps < 300 && iGameLaps > 1) {
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Unlock", "", 0, null)
        EntFire("button_1", "Skin", "0", 0, null)
        return
    }
}

// Subtract a lap to iGameLaps.
function GameLapsSub() {
    if (iGameLaps <= 1) return

    iGameLaps--
    HudPrint(0, "Race Laps: " + iGameLaps, Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 0.5))
    
    if (iGameLaps <= 1) {
        EntFire("rounds_button_1", "Lock", "", 1, null)
        EntFire("rounds_button_2", "Unlock", "", 1, null)
        EntFire("button_2", "Skin", "0", 0, null)
        EntFire("button_1", "Skin", "1", 0, null)
        return
    }

    if (iGameLaps < 300 && iGameLaps > 1) {      
        EntFire("rounds_button_1", "Unlock", "", 0, null)
        EntFire("rounds_button_2", "Unlock", "", 0, null)
        EntFire("button_2", "Skin", "0", 0, null)
        return
    }
}

// Progress music track up one.
function GameMusicNext() {
    if (iMusicTrack >= 5) return

    iMusicTrack++
    HudPrint(0, "Music Track: " + iMusicTrack, Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 0.5))
    EntFire("counter_music", "SetValue", iMusicTrack)
}

// Progress music track down one.
function GameMusicBack() {
    if (iMusicTrack <= 0) return

    iMusicTrack--
    if (iMusicTrack == 0) {
        HudPrint(0, "No Music", Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 0.5))
    }
    else {
        HudPrint(0, "Music Track: " + iMusicTrack, Vector(-1, 0.2, 3), 0, 0.0, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, Vector(0.5, 0.5, 0.5))
    }
    EntFire("counter_music", "SetValue", iMusicTrack)
}

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // So nobody spawns here.
        Entities.FindByClassname(null, "info_player_start").Destroy()

        // Remove the lap counters, VScript will keep track instead.
        Entities.FindByName(null, "rounds").Destroy()
        for (local ent = null; ent = Entities.FindByName(null, "round_counter_orange");) {
            ent.Destroy()
        }
        for (local ent = null; ent = Entities.FindByName(null, "round_counter_blue");) {
            ent.Destroy()
        }

        // Remove all the original spawn locations.
        for (local trigger = null; trigger = Entities.FindByClassname(trigger, "info_coop_spawn");) {
            if ((trigger.GetName().find("blue_spawner") != null) || (trigger.GetName().find("red_spawner") != null)) {
                trigger.Destroy()
            }
        }

        // Add new checkpoint system to triggers.
        Entities.FindByName(null, "checkpoint_blue_1").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "checkpoint_blue_1").__KeyValueFromString("targetname", "checkpoint_blue_1_p2mmoverride")
        EntFire("checkpoint_blue_1_p2mmoverride", "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckCompletedLaps(activator MAP_CHECKPOINTS[0])")
        EntFire("checkpoint_blue_1_p2mmoverride", "AddOutput", "OnEndTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[0])")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(2560, -3040, 128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[1])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(2560, 1504, -128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[2])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(3744, 4096, 384), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[3])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(1888, 5568, 256), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[4])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-672, 5568, 256), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[5])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-1792, 2016, 256), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[6])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-3232, 1538, 576), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[7])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-4736, 1056, -128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[8])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-7552, -160, -128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[9])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-7552, -2784, -128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[10])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-5760, -6336, 0), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[11])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-2208, -6336, 96), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[12])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(288, -7552, 128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[13])", 0, null, null)

        // We have our own respawning system for all players. Delete all but the initial ones.
        for (local ent; ent = Entities.FindByClassname(ent, "info_coop_spawn");) {
            if (ent.GetName().find("initial_spawn") == null) {
                ent.Destroy()
            }
        }
        
        // Make buttons increase the VScript lap counter.
        EntFire("rounds_button_1", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsSub():0:-1")
        EntFire("rounds_button_2", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsAdd():0:-1")

        // Make buttons run a music track function instead of the usual relay.
        EntFire("music_button_1", "AddOutput", "OnPressed !self:RunScriptCode:GameMusicBack():0:-1")
        EntFire("music_button_2", "AddOutput", "OnPressed !self:RunScriptCode:GameMusicNext():0:-1")

        // Remove the old game_text entities for the lap and music selection.
        for (local gt = null; gt = Entities.FindByClassname(gt, "game_text");) {
            if (gt.GetName().find("music_") != null && gt.GetName().find("_text") != null) {
                gt.Destroy()
            }
        }
        Entities.FindByName(null, "change_rounds_text").Destroy()

        if (!GetConVarInt("p2mm_gelocity_lockbuttons")) {
            EntFire("rounds_button_1", "Unlock")
            EntFire("rounds_button_2", "Unlock")
            EntFire("music_button_1", "Unlock")
            EntFire("music_button_2", "Unlock")
        } else {
            EntFire("rounds_button_1", "Lock")
            EntFire("rounds_button_2", "Lock")
            EntFire("music_button_1", "Lock")
            EntFire("music_button_2", "Lock")
        }

        // Only the winner can go onto the #1 pedestal and trigger the voiceline.
        Entities.FindByName(null, "glados_6").__KeyValueFromString("targetname", "glados_6_p2mmoverride")
        Entities.FindByName(null, "trigger_blue_wins").Destroy()
        Entities.FindByName(null, "trigger_orange_wins").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "trigger_orange_wins").__KeyValueFromString("trigger_once", "0")
        EntFire("trigger_orange_wins", "AddOutput", "OnStartTouch !activator:RunScriptCode:KillLosers(activator)")
        EntFire("glados_7", "AddOutput", "OnCompletion glados_6_p2mmoverride:Kill")
        EntFire("trigger_orange_wins", "Enable")

        // Make sure only the host can begin the game.
        Entities.FindByName(null, "button_2_branch").__KeyValueFromString("targetname", "button_2_branch_p2mmoverride")
        Entities.FindByClassname(null, "logic_branch_listener").__KeyValueFromString("targetname", "button_2_branch_p2mmoverride")
        for (local button; button = Entities.FindByClassname(button, "prop_floor_button");) {
            EntFireByHandle(button, "AddOutput", "OnPressed !activator:RunScriptCode:HostStartGame(activator)", 0, null, null)
        }

        // Turn off death icons and turn on instant respawn
        SetConVarInt("p2mm_deathicons", 0)
        SetConVarInt("p2mm_instantrespawn", 1)

        // Tournament mode stuff
        if (bTournamentMode) {
            Config_HostOnlyChatCommands <- true // Make sure no other chat commands can be used.

            // Delete starting race buttons.
            Entities.FindByClassnameNearest("prop_floor_button", Vector(2368, -8128, -314), 32).Destroy()
            Entities.FindByClassnameNearest("prop_floor_button", Vector(2752, -8128, -314), 32).Destroy()

            // Disabled round and music buttons so only host can remotely control their values.
            EntFire("button_music_1", "Skin", "1")
            EntFire("button_music_2", "Skin", "1")
            EntFire("music_button_1", "Kill")
            EntFire("music_button_2", "Kill")
            EntFire("rounds_button_1", "Kill")
            EntFire("rounds_button_2", "Kill")
            EntFire("button_1", "Skin", "1")
            EntFire("button_2", "Skin", "1")

            // Remove hint triggers.
            // Entities.FindByClassnameNearest("trigger_multiple", Vector(-5568.01, -416, -64), 10).Destroy()
            // Entities.FindByClassnameNearest("trigger_multiple", Vector(-5312.01, -416, -64), 10).Destroy()
            // Entities.FindByClassnameNearest("trigger_playerteam", Vector(-1056, -768, 60.25), 10).Destroy()
            // Entities.FindByName(null, "counter_view_blue").Destroy()
            // Entities.FindByName(null, "counter_view_orange").Destroy()
            // Entities.FindByName(null, "restart_hint_orange").Destroy()
            // Entities.FindByName(null, "restart_hint_blue").Destroy()
            // Entities.FindByName(null, "restart_hint_orange_2").Destroy()
            // Entities.FindByName(null, "restart_hint_blue_2").Destroy()
            // Entities.FindByName(null, "pd_01_trigger").Destroy()
            // Entities.FindByName(null, "pd_01_trigger").Destroy()
        }
        // paint gel when race starts so everyone can join until then
        Entities.FindByName(null, "gel_relay").__KeyValueFromString("targetname", "gel_relay_p2mmoverride")

        // this one is really delayed for some reason, so we speed it up
        EntFire("gel_relay_p2mmoverride", "AddOutput", "OnTrigger j_sphere_3:Paint:29")

        // Delete elements that change the level.
        Entities.FindByName(null, "team_trigger_door").Destroy()
        Entities.FindByName(null, "door_end_1").__KeyValueFromString("targetname", "door_end_1_p2mmoverride")
        Entities.FindByName(null, "door_end_1").__KeyValueFromString("targetname", "door_end_1_p2mmoverride")
        Entities.FindByName(null, "door_end_2").__KeyValueFromString("targetname", "door_end_2_p2mmoverride")
        Entities.FindByName(null, "door_end_2").__KeyValueFromString("targetname", "door_end_2_p2mmoverride")
        EntFire("door_end_1_p2mmoverride", "SetAnimation", "90idle")
        EntFire("door_end_2_p2mmoverride", "SetAnimation", "90idle")        
    }

    if (MSPostPlayerSpawn) {
        EntFire("counter_music", "SetValue", iMusicTrack)
    }
}
