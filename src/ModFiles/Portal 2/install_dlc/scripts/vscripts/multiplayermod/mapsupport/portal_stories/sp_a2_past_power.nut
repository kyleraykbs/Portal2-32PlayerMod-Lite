//  ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗  ██████╗████████╗           ██████╗  █████╗  ██╗       ██╗███████╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝           ██╔══██╗██╔══██╗ ██║  ██╗  ██║██╔════╝██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝███████║╚█████╗    ██║              ██████╔╝██║  ██║ ╚██╗████╗██╔╝█████╗  ██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔═══╝ ██╔══██║ ╚═══██╗   ██║              ██╔═══╝ ██║  ██║  ████╔═████║ ██╔══╝  ██╔══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║     ██║  ██║██████╔╝   ██║   ██████████╗██║     ╚█████╔╝  ╚██╔╝ ╚██╔╝ ███████╗██║  ██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝     ╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═════════╝╚═╝      ╚════╝    ╚═╝   ╚═╝  ╚══════╝╚═╝  ╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // remove autostart elevator
        Entities.FindByClassnameNearest("logic_auto", Vector(1360, 272, -188), 64).Destroy()
        Entities.FindByName(null, "elevator-start_trigger").Destroy()

        // make doors not close
        Entities.FindByName(null, "room_1_door_0-proxy").Destroy()
        Entities.FindByName(null, "orange_pump_station_door_1-close").Destroy()
        Entities.FindByName(null, "orange_pump_station_door_3-close").Destroy()
        Entities.FindByName(null, "sd1_door").__KeyValueFromString("targetname", "sd1_door_p2mmoverride")
        Entities.FindByName(null, "bts_door_2").__KeyValueFromString("targetname", "bts_door_2_p2mmoverride")
        Entities.FindByName(null, "ap4").__KeyValueFromString("targetname", "ap4_p2mmoverride")
        Entities.FindByName(null, "model").__KeyValueFromString("targetname", "model_p2mmoverride")
        EntFire("cs_40", "AddOutput", "OnCompletion sd1_door_p2mmoverride:SetAnimation:open")
        EntFire("bts_door_2_button", "AddOutput", "OnPressed bts_door_2_p2mmoverride:SetAnimation:open")
        EntFire("Blue_gel_exit_button", "AddOutput", "OnPressed ap4_p2mmoverride:open")
        EntFire("door", "AddOutput", "OnPressed model_p2mmoverride:SetAnimation:open")

        // for some reason the catapult helper resets in mp? :clueless:
        Entities.FindByName(null, "fake_catapult").__KeyValueFromString("useThresholdCheck", "1")

        // checkpoints
        EntFire("close_orange_trigger", "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint(1)")
        EntFire("Blue_gel_exit_button", "AddOutput", "OnPressed !self:RunScriptCode:Checkpoint(2)")

        // delete box spawn
        Entities.FindByClassnameNearest("info_player_start", Vector(4864, 1008, 2644), 64).Destroy()

        // Make changing levels work
        Entities.FindByName(null, "sphere_transfer").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(4864, 1008, 2644), 64).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-4064 5232 1524.53), 64).Destroy()
        EntFire("AutoInstance1-exit_elevator-exit_lift_train", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("AutoInstance1-exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a2_ramp:3.5", 0, null)
        } else EntFire("AutoInstance1-exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a2_ramp:3.5", 0, null)

    }
    
    if (MSPostPlayerSpawn) {
        EntFire("elevator-entrance_lift_train", "StartForward", null, 1)
        EntFire("room_1_door_0-door_open", "Trigger", null, 6)
        Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(1240, 272, 224))

    }
}
function Checkpoint(point) {
    switch(point) {
        case 1:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-2236, -528, -128))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 180, 0)
            return
        case 2:
            Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-3584, 2848, 485))
            Entities.FindByClassname(null, "info_player_start").SetAngles(0, 180, 0)
            return
    }
}
