//  ██████╗██████╗             █████╗   ██╗██╗           ███████╗██╗███╗  ██╗ █████╗ ██╗     ███████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║           ██╔════╝██║████╗ ██║██╔══██╗██║     ██╔════╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║           █████╗  ██║██╔██╗██║███████║██║     █████╗  
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╔══╝  ██║██║╚████║██╔══██║██║     ██╔══╝  
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗██║     ██║██║ ╚███║██║  ██║███████╗███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝╚═╝     ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝╚══════╝╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // make doors not close
        Entities.FindByName(null, "a_entrance_door").__KeyValueFromString("targetname", "a_entrance_door_p2mmoverride")
        Entities.FindByName(null, "b_entrance_door").__KeyValueFromString("targetname", "b_entrance_door_p2mmoverride")
        Entities.FindByName(null, "entrance_ap").__KeyValueFromString("targetname", "entrance_ap_p2mmoverride")
        EntFire("core_door_trigger", "AddOutput", "OnStartTouch b_entrance_door_p2mmoverride:SetAnimation:vert_door_slow_opening")
        EntFire("core_door_trigger", "AddOutput", "OnStartTouch entrance_ap_p2mmoverride:Open")
        Entities.FindByName(null, "rs_main_door_trigger").__KeyValueFromString("targetname", "rs_main_door_trigger_p2mmoverride")
        EntFire("cs_virgil_240", "AddOutput", "OnCompletion rs_main_door_trigger_p2mmoverride:Enable")
        Entities.FindByName(null, "ls_main_door_trigger").__KeyValueFromString("targetname", "ls_main_door_trigger_p2mmoverride")
        EntFire("all_phases_completed", "AddOutput", "OnTrigger ls_main_door_trigger_p2mmoverride:Enable")
        EntFire("prep_finale_rl", "AddOutput", "OnTrigger ls_main_door_trigger_p2mmoverride:Enable")

        // make fire trigger work for multiplayer
        Entities.FindByName(null, "intro_water_fire_detector_1").__KeyValueFromString("CheckAllIDs", "1")
        Entities.FindByName(null, "intro_water_fire_detector_2").__KeyValueFromString("CheckAllIDs", "1")

        // if the map isnt completed, we have to reset and try again
        
        if (GetMapName().find("sp_") != null) {
            EntFire("finale_death_rl", "AddOutput", "OnTrigger !self:RunScriptCode:EverybodyHasFailed():242:-1")
        } else EntFire("finale_death_rl", "AddOutput", "OnTrigger !self:RunScriptCode:EverybodyHasFailed():360:-1")
        Entities.FindByName(null, "timer_kill").Destroy()

        // replaced ending logic
        Entities.FindByName(null, "movie_aegis_interior").__KeyValueFromString("targetname", "movie_aegis_interior_p2mmoverride")
        Entities.FindByName(null, "movie_lift_sunset").__KeyValueFromString("targetname", "movie_lift_sunset_p2mmoverride")
        EntFire("press_e_to_hire_us_valve", "AddOutput", "OnPressed movie_aegis_interior_p2mmoverride:PlayMovieForAllPlayers")
        EntFire("movie_aegis_interior_p2mmoverride", "AddOutput", "OnPlaybackFinished movie_lift_sunset_p2mmoverride:PlayMovieForAllPlayers")
        EntFire("movie_lift_sunset_p2mmoverride", "AddOutput", "OnPlaybackFinished p2mm_servercommand:Command:changelevel sp_a5_credits")
        Entities.FindByName(null, "end_command").Destroy()

    }
    
    if (MSPostPlayerSpawn) {
        EntFire("a_entrance_door_p2mmoverride", "SetAnimation", "vert_door_opening")

        // below is ripped from portal_stories\scripts\vscripts\turretswitch.nut
	    baboo <- null;
	    while((baboo = Entities.FindByClassname(baboo,"npc_portal_turret_floor")) != null){
	    	if ( baboo.IsValid() ){
	    		baboo.SetModel("models/portal_stories/props_underground/turret/turret.mdl");
	    	}
	    }
    }
}

function EverybodyHasFailed() {
    CoopGladosBlowUpBots()
    textnobodywin <- Entities.CreateByClassname("game_text")
    textnobodywin.__KeyValueFromString("targetname", "p2mm_failescapetext")
    textnobodywin.__KeyValueFromString("message", "Everyone died from oxygen deprivation.\n Restarting map...")
    textnobodywin.__KeyValueFromString("holdtime", "999")
    textnobodywin.__KeyValueFromString("spawnflags", "1")
    textnobodywin.__KeyValueFromString("x", "-1")
    textnobodywin.__KeyValueFromString("y", "0.50")
    textnobodywin.__KeyValueFromString("effect", "2")
    textnobodywin.__KeyValueFromString("fxtime", "999")
    textnobodywin.__KeyValueFromString("color2", "230 30 30")
    textnobodywin.__KeyValueFromString("color", "0 0 0")
    textnobodywin.__KeyValueFromString("fadein", "0.05")
    EntFire("p2mm_failescapetext", "Display")
    deathfade <- Entities.CreateByClassname("env_fade")
    deathfade.__KeyValueFromString("targetname", "p2mm_startfade")
    deathfade.__KeyValueFromString("duration", "1")
    deathfade.__KeyValueFromString("rendercolor", "0 0 0")
    deathfade.__KeyValueFromString("renderamt", "255")
    deathfade.__KeyValueFromString("spawnflags", "8")
    EntFireByHandle(deathfade, "Fade", "", 1, null, null)
    EntFire("p2mm_servercommand", "Command", "restart_level", 4)
}
