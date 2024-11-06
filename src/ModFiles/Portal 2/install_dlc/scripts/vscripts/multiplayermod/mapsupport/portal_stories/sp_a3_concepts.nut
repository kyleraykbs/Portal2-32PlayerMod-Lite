//  ██████╗██████╗             █████╗ ██████╗             █████╗  █████╗ ███╗  ██╗ █████╗ ███████╗██████╗ ████████╗ ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗████╗ ██║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██║  ╚═╝██║  ██║██╔██╗██║██║  ╚═╝█████╗  ██████╔╝   ██║   ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██║  ██╗██║  ██║██║╚████║██║  ██╗██╔══╝  ██╔═══╝    ██║    ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝╚█████╔╝██║ ╚███║╚█████╔╝███████╗██║        ██║   ██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝  ╚════╝ ╚═╝  ╚══╝ ╚════╝ ╚══════╝╚═╝        ╚═╝   ╚═════╝



viewactive <- false
tploop <- -1
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Start without Portal Gun for starting elevator cutscene in normal mode
        if (!Config_TrollFaceMode) {UTIL_Team.Spawn_PortalGun(false)}

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // delete box spawn
        Entities.FindByClassnameNearest("info_player_start", Vector(472, 2712, -348), 64).Destroy()

        // taking control of the elevator
        EntFireByHandle(Entities.FindByClassname(null, "info_player_start"), "setparent", "AutoInstance1-elevator_1", 0, null, null)
        Entities.FindByName(null, "AutoInstance1-elevator_1_interior_start_trigger").Destroy()
        elevator_viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        elevator_viewcontrol.__KeyValueFromString("targetname", "elevator_viewcontrol")
        elevator_viewcontrol.__KeyValueFromString("fov", "120")
        elevator_viewcontrol.SetOrigin(Vector(-192, 359, -1566))
        EntFire("elevator_viewcontrol", "setparent", "AutoInstance1-elevator_1", 0, null)
        elevator_viewcontrol.SetAngles(0, 90, 0)

        // remove death fade
        Entities.FindByName(null, "death_fade-fade_to_death").Destroy()

        // checkpoint
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(1632, 1104, 64), 128), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint()", 0, null, null)

        // making doors not close
        Entities.FindByName(null, "@entry_door").__KeyValueFromString("targetname", "entry_door_p2mmoverride")
        Entities.FindByName(null, "exit_door").__KeyValueFromString("targetname", "exit_door_p2mmoverride")
        Entities.FindByClassnameNearest("trigger_once", Vector(1632, 896, 80), 16).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(1632, 64, 40), 16).Destroy()
        EntFire("AutoInstance1-leaving_elevator_trigger", "AddOutput", "OnTrigger entry_door_p2mmoverride:open")
        EntFire("r1_exit_trigger", "AddOutput", "OnStartTouch exit_door_p2mmoverride:open")

        // destroy starting trigger and make voiceline start again
        Entities.FindByName(null, "AutoInstance1-source_elevator_door_open_trigger").Destroy()
        EntFire("AutoInstance1-@elevator_1_end_path", "AddOutput", "OnPass cs_virgil_103:Start")


        // Make changing levels work
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("InstanceAuto6-elevator_1", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("InstanceAuto6-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a3_paint_fling:3.5", 0, null)
        } else EntFire("InstanceAuto6-elevator_1", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a3_paint_fling:3.5", 0, null)

    }

    if (MSPostPlayerSpawn) {
        if (Config_TrollFaceMode) {
            EntFire("AutoInstance1-@elevator_1_end_path", "AddOutput", "OnPass !self:RunScriptCode:TeleportFailsafe():0:1")
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
            }
            tploop = 0
        } else {
            for (local p; p = Entities.FindByClassname(p, "player");) {
                p.__KeyValueFromString("rendermode", "10")
            }
            tploop = 0
            EntFire("elevator_viewcontrol", "Enable")
            viewactive = true
            EntFire("AutoInstance1-@elevator_1_end_path", "AddOutput", "OnPass !self:RunScriptCode:EndScene():0:1")
        }
        EntFire("AutoInstance1-light_elevator_dynamic", "TurnOn")
        EntFire("AutoInstance1-elevator_1", "MoveToPathNode", "AutoInstance1-@elevator_1_bottom_path_1")
        EntFire("AutoInstance1-elevator_1", "StartForward", "", 1)
        EntFire("AutoInstance1-light_elevator_fill", "TurnOn")
        EntFire("AutoInstance1-signs_on", "Trigger")
    }
    if (MSOnPlayerJoin) {
        if (viewactive) {
            printlP2MM(0, true, "Player joined (Resetting viewcontrol)")
            for (local p; p = Entities.FindByClassname(p, "player");) {
                p.__KeyValueFromString("rendermode", "10")
            }
            EntFire("elevator_viewcontrol", "Disable", "", 0.5, null)
            EntFire("elevator_viewcontrol", "Enable", "", 0.6, null)
        }
    }
    if (MSLoop) {
        if (tploop > -1) {
            if (tploop < 1) {
                for (local p; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(p.GetOrigin().x p.GetOrigin().y p.GetOrigin().z + 1))
                }
                tploop = 60
                }
            tploop--
        }
    }
}
function EndScene() {
    // stop the viewcontrol and give the players their gun
    UTIL_Team.Spawn_PortalGun(true)
    EntFire("elevator_viewcontrol", "Disable", null, 0)
    GamePlayerEquip <- Entities.CreateByClassname("game_player_equip")
    GamePlayerEquip.__KeyValueFromString("weapon_portalgun", "1")
    EntFire("elevator_viewcontrol", "Disable", "", 1)
    for (local p; p = Entities.FindByClassname(p, "player");) {
        p.__KeyValueFromString("rendermode", "0")
        EntFireByHandle(GamePlayerEquip, "use", "", 0, p, p)
        p.SetAngles(0, 90, 0)
    }
    // Enable secondary fire for all guns
    EntFire("weapon_portalgun", "AddOutput", "CanFirePortal2 1", 0, null)
    GamePlayerEquip.Destroy()
    viewactive = false
    TeleportFailsafe()
}
function Checkpoint() {
    EntFire("info_player_start", "setparent", "", 0, null)
    // i sure do love race conditions ;D
    EntFire("p2mm_servercommand", "Command", "script Entities.FindByClassname(null, \"info_player_start\").SetOrigin(Vector(1632, 891, 48))", 0.1)
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, -90, 0)
}
function TeleportFailsafe() {
    tploop = -1
    local playersinside = []
    for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(576, 350, -78), 128);) {
        playersinside.push(p)
        printlP2MM(0, true, FindPlayerClass(p).username + " added to donotteleport array")
    }
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        local isplayerinindex = false
        foreach (player in playersinside) {
            if (p == player) {
                isplayerinindex = true
            }
        }
        if (!isplayerinindex) {
            p.SetOrigin(Vector(576, 495, 0))
        }
    }
}

