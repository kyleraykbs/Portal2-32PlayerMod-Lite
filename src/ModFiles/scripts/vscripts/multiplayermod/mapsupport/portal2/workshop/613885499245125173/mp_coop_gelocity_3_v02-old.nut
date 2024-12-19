// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗ ███████╗██╗      █████╗  █████╗ ██╗████████╗██╗   ██╗           ██████╗            ██╗   ██╗ █████╗ ██████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝ ██╔════╝██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝           ╚════██╗           ██║   ██║██╔══██╗╚════██╗
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ██╗ █████╗  ██║     ██║  ██║██║  ╚═╝██║   ██║    ╚████╔╝             █████╔╝           ╚██╗ ██╔╝██║  ██║  ███╔═╝
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ╚██╗██╔══╝  ██║     ██║  ██║██║  ██╗██║   ██║     ╚██╔╝              ╚═══██╗            ╚████╔╝ ██║  ██║██╔══╝
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚██████╔╝███████╗███████╗╚█████╔╝╚█████╔╝██║   ██║      ██║   ██████████╗██████╔╝██████████╗  ╚██╔╝  ╚█████╔╝███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚═════╝ ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝   ╚═╝      ╚═╝   ╚═════════╝╚═════╝ ╚═════════╝   ╚═╝    ╚════╝ ╚══════╝

// FIXME!!!
// Apparently the server crashes IF the level is reset WITH sv_cheats set to true!!!

// TODO: make players die if they cheese the start and race before the levers are pressed

bGameDoneGelocity <- false
bStartTeleportFinished <- false
bRelayLastLapHasTriggered <- false
iGelocityRounds <- 3 // default

const LAP_CHECKPOINT1 = 0
const LAP_FINISHLINE = 1

// Override this func
function GladosCoopMapStart() {}

function StartGelocityTeleport() {
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetAngles(0, 0, 0)
        if (p.GetTeam() == TEAM_RED) {
            p.SetOrigin(Vector(-5144, 848, -112))
        } else {
            p.SetOrigin(Vector(-5144, 688, -112))
        }
    }

    // Lock this so no one can change the laps or music once the game started
    EntFire("rounds_button_1", "lock")
    EntFire("rounds_button_2", "lock")
    EntFire("music_button_1", "lock")
    EntFire("music_button_2", "lock")
   
    // Disabled button skins
    EntFire("button_1", "skin", "1")
    EntFire("button_2", "skin", "1")
    EntFire("button_music_1", "skin", "1")
    EntFire("button_music_2", "skin", "1")  
    
    // Change the hint text message for the buttons
    Entities.FindByName(null, "hint_laps").__KeyValueFromString("hint_caption", "The game has already started!")
    Entities.FindByName(null, "hint_laps").__KeyValueFromString("hint_activator_caption", "The game has already started!")
    Entities.FindByName(null, "hint_music").__KeyValueFromString("hint_caption", "The game has already started!")
    Entities.FindByName(null, "hint_music").__KeyValueFromString("hint_activator_caption", "The game has already started!")

    bStartTeleportFinished = true
}

// TODO: remove these functions and call the lap increment/decrement in the output itself
function AddLap() {
    iGelocityRounds++
    printlP2MM(0, true, "" + iGelocityRounds)
}

function SubtractLap() {
    iGelocityRounds--
    printlP2MM(0, true, "" + iGelocityRounds)
}

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Change the names of these so that they don't close when we don't want them to
        Entities.FindByName(null, "door_start_2_2").__KeyValueFromString("targetname", "door_start_2_override")
        Entities.FindByName(null, "door_start_2_1").__KeyValueFromString("targetname", "door_start_1_override")
        Entities.FindByName(null, "door_start_1_2").__KeyValueFromString("targetname", "door_start_2_override")
        Entities.FindByName(null, "door_start_1_1").__KeyValueFromString("targetname", "door_start_1_override")

        EntFire("door_start_2_override", "Open")
        EntFire("door_start_1_override", "Open")

        // Activate all the paint spheres and remove immediately
        // for (local ent; ent = Entities.FindByClassname(ent, "paint_sphere");) {
        //     EntFire(ent.GetName(), "paint", "", 0.8)
        //     EntFire(ent.GetName(), "kill", "", 1)
        // }
        EntFire("gel_relay", "Trigger", "", 1) // new logic for it. TODO: Test to see if players can join midgame with this
        
        EntFire("checkpoint_orange_1", "kill")
        EntFire("checkpoint_blue_1", "kill")

        // Prevent closing the start door in case the match already started
        EntFire("startdoor_2_manager", "AddOutput", "OnChangeToAllTrue door_start:Disable::0")

        // So that the "final lap" text actually appears
        Entities.FindByName(null, "last_lap_text").__KeyValueFromString("channel", "5")

        // We steal this one for optimizing edicts
        Entities.FindByName(null, "rounds_text_orange").__KeyValueFromString("targetname", "p2mm_rounds_text_override")

        Entities.FindByName(null, "rounds_button_2").ConnectOutput("OnPressed", "AddLap")
        Entities.FindByName(null, "rounds_button_1").ConnectOutput("OnPressed", "SubtractLap")
        Entities.FindByName(null, "startdoor_2_manager").ConnectOutput("OnChangeToAllTrue", "StartGelocityTeleport")

        // Optimize edict count
        RemoveAllClassname("beam_spotlight")
        RemoveAllClassname("logic_auto", 5)
        RemoveAllClassname("keyframe_rope")
        RemoveAllClassnameDistance("info_target", Vector(-6797.413574, 3837.398682, -447.968750), 600)
    }

    if (MSLoop) {
        // If we have not started or finished racing, update the statuses of everyone
        if (!bGameDoneGelocity) {
            
            // Prevent starting cheese
            if (!bStartTeleportFinished) {
                for (local p; p = Entities.FindByClassname(p, "player");) {
                    if (p.GetOrigin().z < -170 && p.GetOrigin().y > 16.03) {
                        p.SetOrigin(Vector(-5406.540527, 803.267151, -127.968750))
                        p.SetAngles(0, -45, 0)
                    }
                }
            }

            // Finish line
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-1150.777283, 792.685608, -191.968750), 500);) {
                local pclass = FindPlayerClass(p)
                local pcolor = pclass.color.r.tostring() + " " + pclass.color.g.tostring() + " " + pclass.color.b.tostring()
                // See if someone won first
                if (pclass.nCurrentLap > iGelocityRounds) {
                    bGameDoneGelocity = true

                    // Set Message Text and display it
                    Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("message", pclass.username + " has won the game!")
                    Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("color", pcolor)
                    EntFire("p2mm_rounds_text_override", "Display")
                    
                    // Steal the orange winner logic and entities
                    Entities.FindByName(null, "light_win_red").__KeyValueFromString("_light", pcolor + " 400")
                    EntFire("orange_wins", "Trigger")
                    
                    break
                } else {
                    // No one won, see if we should update the lap counter instead
                    if (pclass.GelocityCheckPointType == LAP_FINISHLINE) {
                        if ((pclass.nCurrentLap + 1) == iGelocityRounds) {
                            if (!bRelayLastLapHasTriggered) {
                                // Handles music and other stuff in addition to the display text
                                EntFireByHandle(Entities.FindByName(null, "relay_last_lap"), "Trigger", "", 0, null, null)
                                bRelayLastLapHasTriggered = true
                            } else {
                                // Only show the display text and don't reset music sounds
                                EntFire("last_lap_text", "Display")
                            }
                        }
                        pclass.nCurrentLap = pclass.nCurrentLap + 1
                        pclass.GelocityCheckPointType = LAP_CHECKPOINT1
                        printlP2MM(0, true, pclass.username + " is now on lap " + pclass.nCurrentLap)

                        // Set Message Text and display it
                        if (!bGameDoneGelocity) {
                            Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("message", pclass.username +" is on lap " + pclass.nCurrentLap)
                            Entities.FindByName(null, "p2mm_rounds_text_override").__KeyValueFromString("color", pcolor)
                        }
                        EntFire("p2mm_rounds_text_override", "Display")
                    }
                }
            }

            // Checkpoint
            // All players must hit this area in the map before they can increment their laps
            for (local p; p = Entities.FindByClassnameWithin(p, "player", Vector(-2412.738770, -2896.909912, -299.889404), 750);) {
                local pclass = FindPlayerClass(p)
                if (pclass.GelocityCheckPointType == LAP_CHECKPOINT1) {
                    pclass.GelocityCheckPointType = LAP_FINISHLINE
                    printlP2MM(0, true, "Set the \"GelocityCheckPointType\" status to \"LAP_FINISHLINE\" for " + pclass.username)
                }
            }
        }
    }
}