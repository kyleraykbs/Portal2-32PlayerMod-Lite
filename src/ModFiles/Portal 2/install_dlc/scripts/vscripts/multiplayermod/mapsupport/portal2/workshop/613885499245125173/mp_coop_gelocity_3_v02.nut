// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗           ██████╗            ██╗   ██╗ █████╗ ██████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝           ╚════██╗           ██║   ██║██╔══██╗╚════██╗
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝             █████╔╝           ╚██╗ ██╔╝██║  ██║  ███╔═╝
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝              ╚═══██╗            ╚████╔╝ ██║  ██║██╔══╝
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗██████╔╝██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚═════╝ ╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

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
    "checkpoint_8",
    "checkpoint_9",
    "checkpoint_10",
    "checkpoint_11",
    "checkpoint_12",
    "checkpoint_13"
]

MAP_SPAWNPOINTS <- {
    checkpoint_2_blue   = [Vector(384, 1280, 0), Vector(0, 90, 0)],
    checkpoint_2_orange = [Vector(256, 1280, 0), Vector(0, 90, 0)],
    
    checkpoint_4_blue   = [Vector(1120, 2368, 88), Vector(0, 0, 0)],
    checkpoint_4_orange = [Vector(1120, 2240, 88), Vector(0, 0, 0)],

    checkpoint_5_blue   = [Vector(3136, 1184, 88), Vector(0, 270, 0)],
    checkpoint_5_orange = [Vector(3008, 1184, 88), Vector(0, 270, 0)],

    checkpoint_6_blue   = [Vector(3008, -1920, 196), Vector(0, 270, 0)],
    checkpoint_6_orange = [Vector(3136, -1920, 196), Vector(0, 270, 0)],

    checkpoint_7_blue   = [Vector(5024, -4800, 324), Vector(0, 180, 0)],
    checkpoint_7_orange = [Vector(5024, -4672, 324), Vector(0, 180, 0)],

    checkpoint_8_blue   = [Vector(1472, -2752, -424), Vector(0, 180, 0)],
    checkpoint_8_orange = [Vector(1472, -2880, -424), Vector(0, 180, 0)],

    checkpoint_9_blue   = [Vector(-4767, -2752, -424), Vector(0, 180, 0)],
    checkpoint_9_orange = [Vector(-4767, -2880, -424), Vector(0, 180, 0)],

    checkpoint_11_blue   = [Vector(-8896, -672, -296), Vector(0, 90, 0)],
    checkpoint_11_orange = [Vector(-9024, -672, -296), Vector(0, 90, 0)],

    checkpoint_13_blue   = [Vector(-4416, 3452, -424), Vector(0, 270, 0)],
    checkpoint_13_orange = [Vector(-4288, 3452, -424), Vector(0, 270, 0)],
}

function DevFillPassedPoints(index) {
    local playerClass = FindPlayerClass(UTIL_PlayerByIndex(index))
    if (!playerClass) return
    playerClass.l_PassedCheckpoints.clear()
    playerClass.l_PassedCheckpoints.extend(MAP_CHECKPOINTS)
}

function WonRace(playerClass) {
// A player won! Trigger their teams win relay!
if (playerClass.player.GetTeam() == TEAM_BLUE) {
    EntFire("blue_wins", "Trigger")
    EntFire("orange_wins", "Kill")
    playerClass.v_SpawnVector = MAP_SPAWNPOINTS[0]
} else {
    EntFire("orange_wins", "Trigger")
    EntFire("blue_wins", "Kill")
    playerClass.v_SpawnVector = MAP_SPAWNPOINTS[1]
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

function KillLosers(player) {
    local playerClass = FindPlayerClass(player)
    if (l_WinnerList[0] != playerClass.username) {
        printlP2MM(0, true, playerClass.username + " landed on pedestal, but isnt #1. Killing.")
        player.SetVelocity(Vector(player.GetVelocity().x, player.GetVelocity().y, 500))
        EntFireByHandle(player, "sethealth", "-99999999999", 0.75, null, null)
    } else {
        printlP2MM(0, true, "" + playerClass.username + " landed on pedestal, and is the winner. Not killing.")
        EntFire("glados_6_p2mmoverride", "Start")
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
    if (playerClass.i_CompletedLaps == (i_GameLaps - 1) && !b_FinalLap) {
        EntFire("last_lap", "PlaySound")
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", -1, 0.2, 2, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 1, 0, 3)
        SendToChat(0, "\x04" + playerClass.username + " HAS REACHED THE FINAL LAP!")
        b_FinalLap = true
    }
    // Other player have reached the final lap.
    else if (playerClass.i_CompletedLaps == (i_GameLaps - 1) && b_FinalLap) {
        HudPrint(playerClass.player.entindex(), "FINAL LAP!", -1, 0.2, 2, Vector(255, 0, 0), 255, Vector(0, 0, 0), 0, 0.5, 0.5, 1, 0, 3)
    }
    // Player has completed a lap.
    else if (playerClass.i_CompletedLaps < i_GameLaps) {
        HudPrint(playerClass.player.entindex(), "COMPLETED LAP " + playerClass.i_CompletedLaps + "!", -1, 0.2, 2, Vector(255, 255, 255), 255, Vector(0, 0, 0), 0, 0.2, 0.5, 1, 1, 3)
    }
    // Check if the player has completed all the laps, if so, they won!
    if (playerClass.i_CompletedLaps >= i_GameLaps) {
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

    // Dev debug
    if (GetDeveloperLevelP2MM()) {
        HudPrint(player.entindex(), "CHECKPOINT: " + checkpoint, -1, 0.8, 0, Vector(0, 0, 255), 255, Vector(0, 0, 255), 255, 0.5, 0.5, 1, 0, 2)
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

function StartGelocityRace() {
    b_RaceStarted = true;

    EntFire("gel_relay", "Trigger")

    // Move everyone into their respective start positions.
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        p.SetAngles(0, 0, 0)
        if (p.GetTeam() == TEAM_RED) {
            p.SetOrigin(Vector(-5184, 848, -64))
        } else {
            p.SetOrigin(Vector(-5184, 688, -64))
        }
    }

    // Move start locations incase someone dies without hitting a checkpoint
    Entities.FindByName(null, "red_dropper-initial_spawn").SetOrigin(Vector(-4904, 848, -64))
    Entities.FindByName(null, "blue_dropper-initial_spawn").SetOrigin(Vector(-4904, 688, -64))
    Entities.FindByName(null, "red_dropper-initial_spawn").SetAngles(0, 0, 0)
    Entities.FindByName(null, "blue_dropper-initial_spawn").SetAngles(0, 0, 0)

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

    // Delay this because the map reopens these for some reason
    // Entities.FindByName(null, "door_start_1_1").__KeyValueFromString("targetname", "door_start_1_1_p2mmoverride")
    // Entities.FindByName(null, "door_start_1_2").__KeyValueFromString("targetname", "door_start_1_2_p2mmoverride")
    // Entities.FindByName(null, "door_start_2_1").__KeyValueFromString("targetname", "door_start_2_1_p2mmoverride")
    // Entities.FindByName(null, "door_start_2_2").__KeyValueFromString("targetname", "door_start_2_2_p2mmoverride")

    // Start the countdown... and the RACE!
    EntFire("relay_start_p2mmoverride", "Trigger")
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

        // Remove all the original spawn locations.
        for (local trigger = null; trigger = Entities.FindByClassname(trigger, "info_coop_spawn");) {
            if ((trigger.GetName().find("blue_spawner") != null) || (trigger.GetName().find("red_spawner") != null)) {
                trigger.Destroy()
            }
        }

        // Add new checkpoint system to triggers.
        Entities.FindByName(null, "checkpoint_blue_1").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "checkpoint_blue_2").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "checkpoint_blue_3").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "checkpoint_blue_1").__KeyValueFromString("targetname", "checkpoint_blue_1_p2mmoverride")
        Entities.FindByName(null, "checkpoint_blue_2").__KeyValueFromString("targetname", "checkpoint_blue_2_p2mmoverride")
        Entities.FindByName(null, "checkpoint_blue_3").__KeyValueFromString("targetname", "checkpoint_blue_3_p2mmoverride")
        EntFire("checkpoint_blue_1_p2mmoverride", "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckCompletedLaps(activator MAP_CHECKPOINTS[0])")
        EntFire("checkpoint_blue_1_p2mmoverride", "AddOutput", "OnEndTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[0])")
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(320, 1696, -128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[1])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-2272, 2388, 128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[2])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(800, 2304, 448), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[3])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(3072, 1440, 128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[4])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(3072, -2592, 128), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[5])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(5408, -4352, 256), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[6])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(480, -2816, 64), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[7])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-4512, -2816, -384), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[8])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-8352, -1536, -384), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[9])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-9260, -1088, -232.77), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[10])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-7168, 1952, -384), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[11])", 0, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_playerteam", Vector(-4352, 4128, -384), 32), "AddOutput", "OnStartTouch !activator:RunScriptCode:CheckpointHit(activator MAP_CHECKPOINTS[12])", 0, null, null)

        // We have our own respawning system for all players. Delete all but the initial ones.
        for (local ent; ent = Entities.FindByClassname(ent, "info_coop_spawn");) {
            if (ent.GetName().find("initial_spawn") == null) {
                ent.Destroy()
            }
        }
        
        // Make buttons increase the VScript lap counter.
        EntFire("rounds_button_1", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsSub():0:-1")
        EntFire("rounds_button_2", "AddOutput", "OnPressed !self:RunScriptCode:GameLapsAdd():0:-1")

        // Only the winner can go onto the #1 pedestal and trigger the voiceline.
        Entities.FindByName(null, "glados_6").__KeyValueFromString("targetname", "glados_6_p2mmoverride")
        Entities.FindByName(null, "trigger_blue_wins").Destroy()
        Entities.FindByName(null, "trigger_orange_wins").__KeyValueFromString("target_team", "0")
        Entities.FindByName(null, "trigger_orange_wins").__KeyValueFromString("trigger_once", "0")
        EntFire("trigger_orange_wins", "AddOutput", "OnStartTouch !activator:RunScriptCode:KillLosers(activator)")
        EntFire("glados_7", "AddOutput", "OnCompletion glados_6_p2mmoverride:Kill")
        EntFire("trigger_orange_wins", "Enable")

        // Tournament mode stuff
        if (b_TournamentMode) {
            Config_HostOnlyChatCommands <- true // Make sure no other chat commands can be used.

            // Delete starting race levers.
            Entities.FindByClassnameNearest("trigger_playerteam", Vector(-4904, 848, -64), 32).Destroy()
            Entities.FindByClassnameNearest("trigger_playerteam", Vector(-4904, 688, -64), 32).Destroy()
            Entities.FindByName(null, "lever_2_red").Destroy()
            Entities.FindByName(null, "lever_1_red").Destroy()
            Entities.FindByClassnameNearest("prop_dynamic_override", Vector(-5146, 750, -59), 32).Destroy()
            Entities.FindByClassnameNearest("prop_dynamic_override", Vector(-5146, 786, -59), 32).Destroy()

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
            Entities.FindByClassnameNearest("trigger_multiple", Vector(-5568.01, -416, -64), 10).Destroy()
            Entities.FindByClassnameNearest("trigger_multiple", Vector(-5312.01, -416, -64), 10).Destroy()
            Entities.FindByClassnameNearest("trigger_playerteam", Vector(-1056, -768, 60.25), 10).Destroy()
            Entities.FindByName(null, "counter_view_blue").Destroy()
            Entities.FindByName(null, "counter_view_orange").Destroy()
            Entities.FindByName(null, "restart_hint_orange").Destroy()
            Entities.FindByName(null, "restart_hint_blue").Destroy()
            Entities.FindByName(null, "restart_hint_orange_2").Destroy()
            Entities.FindByName(null, "restart_hint_blue_2").Destroy()
            Entities.FindByName(null, "pd_01_trigger").Destroy()
            Entities.FindByName(null, "pd_01_trigger").Destroy()
            
            // Prevent exit door from opening.
            Entities.FindByName(null, "@relay_exit_door_open").Destroy()
        }
        // paint gel when race starts so everyone can join until then
        Entities.FindByName(null, "coop_man_gel").Destroy()

        // Delete elements that change the level.
        Entities.FindByName(null, "reset_button_1").Destroy()
        Entities.FindByName(null, "team_trigger_door").Destroy()
        Entities.FindByName(null, "team_door-trigger_glados_exit_door").Destroy()
        

        // Map starting race function
        Entities.FindByName(null, "relay_start").__KeyValueFromString("targetname", "relay_start_p2mmoverride")
        EntFire("startdoor_2_manager_2", "AddOutput", "OnChangeToAllTrue !self:RunScriptCode:StartGelocityRace()")
    }
    if (MSLoop) {
        // Prevent players jumping through window before the game starts.
        if (!b_RaceStarted) {
            for (local p; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z < -170 && p.GetOrigin().y > 16.03) {
                    p.SetOrigin(Vector(-5406.540527, 803.267151, -127.968750))
                    p.SetAngles(0, -45, 0)
                }
            }
        }
    }
}
