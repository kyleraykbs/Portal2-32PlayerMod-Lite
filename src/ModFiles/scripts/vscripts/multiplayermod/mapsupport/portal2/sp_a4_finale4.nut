//  ██████╗██████╗             █████╗   ██╗██╗           ███████╗██╗███╗  ██╗ █████╗ ██╗     ███████╗  ██╗██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██║████╗ ██║██╔══██╗██║     ██╔════╝ ██╔╝██║
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           █████╗  ██║██╔██╗██║███████║██║     █████╗  ██╔╝ ██║
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╔══╝  ██║██║╚████║██╔══██║██║     ██╔══╝  ███████║
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║     ██║██║ ╚███║██║  ██║███████╗███████╗╚════██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝     ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚══════╝╚══════╝     ╚═╝

Sp_A4_Finale4ElevatorTeleport <- true
Sp_A4_Finale4ElevatorTopTeleport <- true
parentthingerdinger <- true
NewSpawnPoint <- false

fogs <- [
    {name = "environment_vista", fogname = "environment_vista_fog", fogdelay = 0}
    {name = "environment_darkness_1", fogname = "@environment_darkness_1_fog", fogdelay = 0}
    {name = "relay_environment_neuro2", fogname = "environment_fog_neuro_2", fogdelay = 0}
    {name = "environment_darkness_2", fogname = "@environment_darkness_fog_2", fogdelay = 0}
    {name = "environment_darkness_3", fogname = "@environment_darkness_fog_3", fogdelay = 0}
    {name = "environment_moonshot_1", fogname = "@environment_moonshot_1", fogdelay = 0}
    {name = "environment_darkness_4", fogname = "@environment_darkness_fog_4", fogdelay = 0}
]

function CatwalkDisableRender() {
    Entities.FindByName(null, "p2mmcatwalkmodeloverride").__KeyValueFromString("rendermode", "10")
    Entities.FindByName(null, "p2mmcatwalk2modeloverride").__KeyValueFromString("rendermode", "10")
}

//## hook line and sinker hooks ##//
function TeleportPlayersBehindEndingElevator() {
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(-11264, 576, 128))
    }
}

function MoveSoundScape() {
    printlP2MM(0, true, "JELLO! For some reason...")
    // EntFire("end_soundscape", "disable")
    // Entities.FindByName(null, "end_soundscape").SetOrigin(Vector(-11264, 576, 128))
    // EntFire("end_soundscape", "Disable", "", 0.1)

    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(-11258, 342, 1072))
    }

    // setpos_exact -11257.973633 342.373840 1071.778320;setang_exact 0.000000 -156.680191 0.000000
}

function TeleportPlayersUp() {
    Entities.FindByClassname(null, "player").SetOrigin(Vector(-190 0 64))
}

PermaPotato = true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Assign env_globals
        env_global01 <- Entities.FindByName(null, "p2mm_env_global01")
        env_global02 <- Entities.FindByName(null, "p2mm_env_global02")
        env_global03 <- Entities.FindByName(null, "p2mm_env_global03")
        env_global04 <- Entities.FindByName(null, "p2mm_env_global04")

        UTIL_Team.Pinging(true, "all", 1)
        UTIL_Team.Taunting(true, "all", 1)

        // Sp_A2_Finale4 first elevator viewcontrol creation
        Sp_A2_Finale4Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        Sp_A2_Finale4Viewcontrol.__KeyValueFromString("targetname", "Sp_A2_Finale4Viewcontrol")
        Sp_A2_Finale4Viewcontrol.__KeyValueFromString("target_team", "-1")
        Sp_A2_Finale4Viewcontrol.SetOrigin(Vector(0, -80, -1332))
        Sp_A2_Finale4Viewcontrol.SetAngles(20, 90, 0)
        EntFireByHandle(Sp_A2_Finale4Viewcontrol, "setparent", "basement_breakers_platform", 0.1, null, null)

        Entities.FindByName(null, "catwalk_model").__KeyValueFromString("targetname", "p2mmcatwalkmodeloverride")
        Entities.FindByName(null, "catwalk2_model").__KeyValueFromString("targetname", "p2mmcatwalk2modeloverride")

        Entities.FindByName(null, "ending_glados_model").__KeyValueFromString("HoldAnimation", "1")

        // Here if we need to ent_fire something
        //EntFireByHandle(Entities.FindByName(null, "NAME"), "ACTION", "VALUE", DELAYiny, ACTIVATOR, CALLER)
        // Destroy objects
        //Entities.FindByName(null, "NAME").Destroy()
        Entities.FindByName(null, "light_dynamic_moon").SetOrigin(Vector(-1129.962646, -674.902405, -457.062744))
        Entities.FindByName(null, "light_dynamic_moon").SetAngles(-4.563643, 65.281807, 0.000000)
        Entities.FindByName(null, "light_dynamic_moon").__KeyValueFromString("lightfov", "160")
        Entities.FindByName(null, "light_dynamic_moon").__KeyValueFromString("lightworld", "1")
        Entities.FindByName(null, "light_dynamic_moon").__KeyValueFromString("spawnflags", "2")

        EntFire("catwalk_break_relay", "AddOutput", "OnTrigger p2mmcatwalkmodeloverride:Kill")
        EntFire("catwalk_break_relay", "AddOutput", "OnTrigger p2mmcatwalk2modeloverride:Kill")

        // Setup function ent_fires
        EntFire("breaker_path2", "AddOutput", "OnPass p2mm_servercommand:command:script TeleportPlayersUp():1")
        EntFire("socket1_start_relay", "AddOutput", "OnTrigger p2mm_servercommand:command:script CatwalkDisableRender():2")
        EntFire("replace_relay", "AddOutput", "OnTrigger p2mm_servercommand:command:script TeleportPlayersBehindEndingElevator()")
        EntFire("container_path2", "AddOutput", "OnPass p2mm_servercommand:command:script MoveSoundScape()")

        EntFire("breaker_path2", "AddOutput", "OnPass Sp_A2_Finale4Viewcontrol:disable::1")
        EntFire("claw3_movelinear", "AddOutput", "OnFullyOpen pipe_orange_relay:trigger::10")

        EntFire("breaker_path2", "AddOutput", "OnPass env_global01:turnoff::1")
        EntFire("breaker_path2", "AddOutput", "OnPass env_global02:turnoff::1")
        EntFire("breaker_path2", "AddOutput", "OnPass env_global03:turnoff::1")
        EntFire("breaker_path2", "AddOutput", "OnPass env_global04:turnoff::1")


        EntFire("relay_neurotoxin_death", "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel sp_a4_finale4:7")
        EntFire("relay_destruction_death", "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel sp_a4_finale4:7")


        Entities.FindByName(null, "@arrival_video_master").SetOrigin(Vector(574.587524, -30.347410, 235.043121))
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("moviefilename", "media/sp_30_a4_finale5.bik")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("width", "256")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("height", "128")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("forcedslave", "0")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("forceprecache", "0")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("looping", "0")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("stretch", "0")
        Entities.FindByName(null, "@arrival_video_master").__KeyValueFromString("targetname", "p2mm_video")

        Entities.FindByName(null, "transition_portal1").Destroy()
        Entities.FindByName(null, "transition_portal2").Destroy()
        Entities.FindByName(null, "fail_hurt_trigger").Destroy()

        // Entities.FindByName(null, "end_player_teleport").Destroy()
        // Entities.FindByName(null, "knockout_teleport_1").Destroy()

        //Entities.FindByName(null, "@clientcommand").Destroy()
        Entities.FindByName(null, "credits").Destroy()

        Entities.FindByName(null, "ending_playmovie").__KeyValueFromString("targetname", "ending_playmovie_p2mp_override")
        Entities.FindByName(null, "credits_music").__KeyValueFromString("targetname", "credits_music_meme")
        
        EntFire("container_path2", "AddOutput", "OnPass ending_playmovie_p2mp_override:playmovieforallplayers::2")
        memeplaymovie <- Entities.CreateByClassname("logic_playmovie")
        memeplaymovie.__KeyValueFromString("targetname", "credits_playmovie_p2mp")
        memeplaymovie.__KeyValueFromString("MovieFilename", "sp_credits_bg")
        memeplaymovie.__KeyValueFromString("loopvideo", "1")
        memeplaymovie.__KeyValueFromString("fadeintime", "1")
        EntFire("container_path2", "AddOutput", "OnPass credits_playmovie_p2mp:PlayLevelTransitionMovie::131")
        EntFire("container_path2", "AddOutput", "OnPass credits_music_meme:playsound::131.2")

        memeplaymovie2 <- Entities.CreateByClassname("logic_playmovie")
        memeplaymovie2.__KeyValueFromString("targetname", "after_credits_playmovie_p2mp")
        memeplaymovie2.__KeyValueFromString("MovieFilename", "sp_ending_callback")
        EntFire("container_path2", "AddOutput", "OnPass after_credits_playmovie_p2mp:playmovieforallplayers::272")
        
        memeplaymovie23 <- Entities.CreateByClassname("logic_playmovie")
        memeplaymovie23.__KeyValueFromString("targetname", "after_credits_playmovie_p2mp_loop")
        memeplaymovie23.__KeyValueFromString("MovieFilename", "menu_act05")

        LoopTeleportPlayersEnding <- false

        EntFire("container_path2", "AddOutput", "OnPass after_credits_playmovie_p2mp_loop:playmovieforallplayers::317")

        point_servercommand_credits_counter <- Entities.CreateByClassname("point_servercommand")
        point_servercommand_credits_counter.__KeyValueFromString("targetname", "point_servercommand_credits_counter")
        EntFire("container_path2", "AddOutput", "OnPass point_servercommand_credits_counter:command:changelevel mp_coop_lobby_3:320")

        EntFire("container_path2", "AddOutput", "OnPass env_global01:turnoff::318")
        EntFire("container_path2", "AddOutput", "OnPass env_global02:turnoff::318")
        EntFire("container_path2", "AddOutput", "OnPass env_global03:turnoff::318")
        EntFire("container_path2", "AddOutput", "OnPass env_global04:turnoff::318")

        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "notinelevator")
        EntFire("breaker_socket_button", "AddOutput", "OnPressed notinelevator:kill", 0, null)
        
        EntFire("@core01", "AddOutput", "OnPlayerPickup @core01:disablepickup", 0, null)
        EntFire("@core01", "AddOutput", "OnPlayerDrop @core01:enablepickup", 0, null)

        EntFire("@core02", "AddOutput", "OnPlayerPickup @core02:disablepickup", 0, null)
        EntFire("@core02", "AddOutput", "OnPlayerDrop @core02:enablepickup", 0, null)

        EntFire("@core03", "AddOutput", "OnPlayerPickup @core03:disablepickup", 0, null)
        EntFire("@core03", "AddOutput", "OnPlayerDrop @core03:enablepickup", 0, null)

        OneTimeRenableViewControl <- false

        for (local ent = null; ent = Entities.FindByClassname(ent, "func_portal_detector");) {
            ent.__KeyValueFromString("CheckAllIDs", "1")
            //printl("Found func_portal_detector")
            EntFireByHandle(ent, "AddOutput", "OnStartTouchPortal ReEnableViewControl:kill::3", 0, null, null)
        }

        Sp_A2_CoreViewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        Sp_A2_CoreViewcontrol.__KeyValueFromString("target_team", "-1")
        Sp_A2_CoreViewcontrol.__KeyValueFromString("targetname", "Sp_A2_CoreViewcontrol")
        Sp_A2_CoreViewcontrol.__KeyValueFromString("fov", "75")
        EntFireByHandle(Sp_A2_CoreViewcontrol, "setparent", "ending_vehicle", 0.1, null, null)
        EntFireByHandle(Sp_A2_CoreViewcontrol, "setparentattachment", "eyes", 0.2, null, null)

        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "DummyObjectWheatlyLook")
        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "DummyObjectWheatlyLookOn")
        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "ReEnableViewControl")
        Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "rollcameracontrol")


        WatchPlayerWheatley <- true
        DoDestroyDummy <- true
        socketnum <- 1
        EntFire("core_hit_trigger", "AddOutput", "OnTrigger DummyObjectWheatlyLook:kill", 0, null)
        EntFire("wheatley_lookat_player_relay", "AddOutput", "OnTrigger DummyObjectWheatlyLookOn:kill", 0, null)

        Entities.FindByClassnameNearest("trigger_once", Vector(0, -384, 96), 350).__KeyValueFromString("targetname", "topofelevator")

        for (local ent = null; ent = Entities.FindByName(ent, "breaker_hatch_door");) {
            ent.__KeyValueFromInt("forceclosed", 1)
        }
    }

    if (MSOnPlayerJoin) {
        // Find all players
        for (local p = null; p = Entities.FindByClassname(p, "player");) {
            //EntFireByHandle(p2mm_clientcommand, "Command", "r_flashlightbrightness 0.1", 0, p, p)
            //EntFireByHandle(p, "setfogcontroller", "@environment_mines_fog", 0, null, null)
            EntFire("Sp_A2_CoreViewcontrol", "disable")
        }
    }

    if (MSLoop) {

        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-11271, -22, 63), 1020);) {
            p.SetVelocity(Vector(0, 0, -300))
        }

        // Teleport all players in elevator out
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-11266, 320, 80), 80);) {
            p.SetOrigin(Vector(-11264, 576, 128))
        }

        // CUTSCENE
        if (Entities.FindByName(null, "ending_vehicle")) {
            if (!Entities.FindByName(null, "rollcameracontrol")) {
                if (Entities.FindByName(null, "ReEnableViewControl")) {
                    for (local p = null; p = Entities.FindByClassname(p, "player");) {
                        p.SetOrigin(Vector(529, 73, -1))
                        p.SetAngles(-83.8, 191.2, 0)
                    }
                }
            }

            if (!Entities.FindByName(null, "ReEnableViewControl")) {
                EntFireByHandle(Sp_A2_CoreViewcontrol, "Enable", "", 0, null, null)
                if (!OneTimeRenableViewControl) {
                    UTIL_Team.Pinging(false)
                    UTIL_Team.Taunting(false)
                    OneTimeRenableViewControl <- true
                    EntFireByHandle(Sp_A2_CoreViewcontrol, "setparent", "chell", 55.15, null, null)
                    EntFireByHandle(Sp_A2_CoreViewcontrol, "setparentattachment", "vehicle_driver_eyes", 55.25, null, null)
                    for (local p = null; p = Entities.FindByClassname(p, "player");) {
                        p.SetOrigin(Vector(1106, -142, 64))
                        EntFireByHandle(p2mm_clientcommand, "Command", "r_flashlightbrightness 0.1", 0, p, p)
                    }
                }
            }

            if (!parentthingerdinger) {
                for (local ent; ent = Entities.FindByClassname(ent, "weapon_portalgun");) {
                    EntFireByHandle(ent, "disabledraw", "", 0, null, null)
                }
            }

            if (parentthingerdinger) {
                parentthingerdinger <- false
                // make players invisible
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.__KeyValueFromInt("renderamt", 0)
                    p.__KeyValueFromInt("renderfx", 0)
                    EntFireByHandle(p, "disabledraw", "", 0, null, null)
                }
                EntFire("rollcameracontrol", "kill", "", 16.1, null)
                UTIL_Team.Pinging(false)
                UTIL_Team.Taunting(false)
                EntFireByHandle(Sp_A2_CoreViewcontrol, "disable", "", 16, null, null)
                EntFireByHandle(Sp_A2_CoreViewcontrol, "Enable", "", 0.3, null, null)
                EntFireByHandle(Sp_A2_CoreViewcontrol, "setparent", "ending_vehicle", 0.1, null, null)
                EntFireByHandle(Sp_A2_CoreViewcontrol, "setparentattachment", "vehicle_driver_eyes", 0.2, null, null)
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(1106, -142, 64))
                }
            }
        }

        EntFire("@core01", "AddOutput", "OnPlayerPickup @core01:disablepickup", 0, null)
        EntFire("@core01", "AddOutput", "OnPlayerDrop @core01:enablepickup", 0, null)

        EntFire("@core02", "AddOutput", "OnPlayerPickup @core02:disablepickup", 0, null)
        EntFire("@core02", "AddOutput", "OnPlayerDrop @core02:enablepickup", 0, null)

        EntFire("@core03", "AddOutput", "OnPlayerPickup @core03:disablepickup", 0, null)
        EntFire("@core03", "AddOutput", "OnPlayerDrop @core03:enablepickup", 0, null)

        if (!Entities.FindByName(null, "socket1_trigger")) {
            EntFire("@core01" "disablepickup")
        }

        if (!Entities.FindByName(null, "socket2_trigger")) {
            EntFire("@core02" "disablepickup")
        }

        if (!Entities.FindByName(null, "socket3_trigger")) {
            EntFire("@core03" "disablepickup")
        }


        // WHEATLEY LOOK
        try {
            FoundPlayerNextToPortalspa4finale4 <- false
            GlobalDistanceScorespa4finale4 <- 999999
            playerpointerfinale4 <- null
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (Entities.FindByClassnameNearest("prop_portal", p.GetOrigin(), 100)) {
                    FoundPlayerNextToPortalspa4finale4 <- true
                    local entcoords = Entities.FindByName(null, "wheatley_bottom_swivel").GetOrigin()
                    local playercoords = p.GetOrigin()

                    playercoords = Vector(UnNegative(playercoords.x), UnNegative(playercoords.y), UnNegative(playercoords.z))
                    entcoords = Vector(UnNegative(entcoords.x), UnNegative(entcoords.y), UnNegative(entcoords.z))

                    distancedistancescore <- playercoords - entcoords
                    distancedistancescore <- distancedistancescore.x + distancedistancescore.y + distancedistancescore.z

                    if (distancedistancescore < GlobalDistanceScorespa4finale4) {
                        GlobalDistanceScorespa4finale4 <- distancedistancescore
                        playerpointerfinale4 <- p.GetName()
                    }
                }
            }

            if (Entities.FindByName(null, "wheatley_shadow_brush")) {
                for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(763., 256, 42), 150);) {
                    playerpointerfinale4 <- p.GetName()
                }
            }


            if (!Entities.FindByName(null, "DummyObjectWheatlyLook")) {
                printl("DummyObjectWheatlyLook not found running objective")
                Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "DummyObjectWheatlyLook")
                WatchPlayerWheatley <- false
                EntFireByHandle(Entities.FindByName(null, "wheatley_bottom_swivel"), "SetTargetEntity", "chassis_target", 0, null, null)
            }

            cursocket <- "socket" + socketnum + "_trigger"
            //printl(WatchPlayerWheatley)

            // if (!WatchPlayerWheatley) {
            //     printl(cursocket)
            //     if (!Entities.FindByName(null, cursocket)) {
            //         if (DoDestroyDummy) {
            //             // Entities.FindByName(null, "DummyObjectWheatlyLookOn").Destroy()
            //             EntFire("DummyObjectWheatlyLookOn", "kill", "", 8, null)
            //             socketnum <- socketnum + 1
            //             DoDestroyDummy <- false
            //         }
            //     }
            // }

            if (!Entities.FindByName(null, "DummyObjectWheatlyLookOn")) {
                printlP2MM(0, true, "DummyObjectWheatlyLookOn not found running objective")
                Entities.CreateByClassname("prop_dynamic").__KeyValueFromString("targetname", "DummyObjectWheatlyLookOn")
                WatchPlayerWheatley <- true
            }

            if (WatchPlayerWheatley) {
                if (playerpointerfinale4 == null) {
                    local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "wheatley_bottom_swivel").GetOrigin(), 10000)
                    EntFireByHandle(Entities.FindByName(null, "wheatley_bottom_swivel"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
                    EntFire("futbol_shooter", "SetTarget", ClosestPlayerMain.GetName(), 0, null)

                } else {
                    EntFireByHandle(Entities.FindByName(null, "wheatley_bottom_swivel"), "SetTargetEntity", playerpointerfinale4, 0, null, null)
                    EntFire("futbol_shooter", "SetTarget", playerpointerfinale4, 0, null)
                }
            }
        } catch (e) {}

        /////////// END OF LOOK

        if (!Entities.FindByName(null, "notinelevator")) {
            if (Sp_A4_Finale4ElevatorTeleport) {
                EntFireByHandle(Sp_A2_Finale4Viewcontrol, "Enable", "", 0, null, null)
                PermaPotato = false
                UTIL_Team.Pinging(false)
                UTIL_Team.Taunting(false)
                EntFire("environment_darkness_1", "Trigger", "", 5, null)
                EntFire("light_dynamic_wheatley", "TurnOn", "", 5, null)
                // EntFireByHandle(Sp_A2_Finale4Viewcontrol, "disable", "", 13, null, null)
                // EntFire("p2mm_servercommand", "command", "script Entities.FindByClassname(null, \"player\").SetOrigin(Vector(-191.816742 -0.485268 64.031250))", 13)

                //script Entities.FindByClassname(null, "player").SetOrigin(Vector(-191.816742 -0.485268 64.031250))

                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-2, -221, -1335))
                }
                Sp_A4_Finale4ElevatorTeleport <- false
            }
        }

        if (!Entities.FindByName(null, "topofelevator")) {
            //printl("topofelevator")
            if (Sp_A4_Finale4ElevatorTopTeleport) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(1, -77, 200))
                }
                Sp_A4_Finale4ElevatorTopTeleport <- false
                NewSpawnPoint <- true
            }
        }

        if (NewSpawnPoint) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-1691, -635, -2619), 500);) {
                p.SetOrigin(Vector(1, -77, 200))
            }
        }
    }
}