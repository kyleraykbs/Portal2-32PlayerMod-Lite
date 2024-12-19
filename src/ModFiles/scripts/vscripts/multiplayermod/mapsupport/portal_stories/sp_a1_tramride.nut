//  ██████╗██████╗             █████╗   ███╗             ████████╗██████╗  █████╗ ███╗   ███╗██████╗ ██╗██████╗ ███████╗
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ╚══██╔══╝██╔══██╗██╔══██╗████╗ ████║██╔══██╗██║██╔══██╗██╔════╝
// ╚█████╗ ██████╔╝           ███████║██╔██║                ██║   ██████╔╝███████║██╔████╔██║██████╔╝██║██║  ██║█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║                ██║   ██╔══██╗██╔══██║██║╚██╔╝██║██╔══██╗██║██║  ██║██╔══╝
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗   ██║   ██║  ██║██║  ██║██║ ╚═╝ ██║██║  ██║██║██████╔╝███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝

MapStarted <- false
function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Remove Portal Gun
        UTIL_Team.Spawn_PortalGun(false)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)
                
        // delete tramspawn
        Entities.FindByClassnameNearest("info_player_start", Vector(-4592, -4460, 146), 999).Destroy()
        
        playerSpawn <- Entities.FindByClassnameNearest("info_player_start", Vector(-2992, -344, 5), 9999)
        playerSpawn.__KeyValueFromString("targetname", "playerSpawn")
        playerSpawn.SetAngles(0, 90, 0)
        playerSpawn.SetOrigin(Vector(-2992, -334, 5)) //! This needs to be moved after the starting cut scene
        
        // Make intro screen work
        Entities.FindByClassnameNearest("logic_auto", Vector(-6096, -6152, -112), 999).Destroy()
        MelIntro_Relay <- Entities.CreateByClassname("logic_relay")
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger StartFade:FadeReverse::0:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger mel_logo_camera_mover:Open::0.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger MelIntro_Viewcontroller:Enable::0.35:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger bg_music:PlaySound::1:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger StartFade2:Fade::4:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger tramstart_relay:Trigger::7.75:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger MelIntro_Viewcontroller:Disable::10.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger StartFade:FadeReverse::10.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger intro_Soundscape:Enable::10.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger chapter_subtitle_text:Display::13.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger chapter_title_text:Display::13.5:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger !self:RunScriptCode:MapStart():8:-1", 0, null, null)
        EntFireByHandle(MelIntro_Relay, "AddOutput", "OnTrigger !self:RunScriptCode:MapStarted=true:8:-1", 0, null, null)
        
        MelIntro_Viewcontroller <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        MelIntro_Viewcontroller.__KeyValueFromString("targetname", "MelIntro_Viewcontroller")
        MelIntro_Viewcontroller.__KeyValueFromString("target_team", "-1")
        MelIntro_Viewcontroller.__KeyValueFromString("target", "Mel_Logo")
        MelIntro_Viewcontroller.__KeyValueFromString("fov", "85")
        MelIntro_Viewcontroller.__KeyValueFromString("spawnflags", "2")
        MelIntro_Viewcontroller.SetOrigin(Vector(-5904, -6232, 128))
        MelIntro_Viewcontroller.SetAngles(0, 90, 0)
        EntFireByHandle(MelIntro_Viewcontroller, "setparent", "mel_logo_camera_mover", 0, null, null)
        
        MelIntro_StartFade <- Entities.CreateByClassname("env_fade")
        MelIntro_StartFade.__KeyValueFromString("targetname", "MelIntro_StartFade")
        MelIntro_StartFade.__KeyValueFromString("duration", "0")
        MelIntro_StartFade.__KeyValueFromString("rendercolor", "0 0 0")
        MelIntro_StartFade.__KeyValueFromString("renderamt", "255")
        MelIntro_StartFade.__KeyValueFromString("spawnflags", "8")


        // Make changing levels work
        if (GetMapName().find("sp_") != null) {
            EntFire("Player_Subway_Path_63", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel sp_a1_mel_intro:6", 0, null)
        } else EntFire("Player_Subway_Path_63", "AddOutput", "OnPass p2mm_servercommand:Command:changelevel st_a1_mel_intro:6", 0, null)
    }
    
    if (MSPostMapSpawn) {}


    if (MSPostPlayerSpawn) {
        EntFireByHandle(MelIntro_StartFade, "Fade", "", 0, null, null) // Semiworks
        EntFireByHandle(MelIntro_Relay, "Trigger", "", 5, null, null)
    }

    if (MSOnPlayerJoin) {
        if (!MapStarted) {
            // Used to make sure newly joining players can see the intro scene
            EntFireByHandle(MelIntro_Viewcontroller, "Enable", "", 0, null, null)
        }
    }
}

function MapStart() {
    for (local ent = null; ent = Entities.FindByClassname(ent, "player"); ) {
        ent.SetOrigin(Vector(-4592, -4460, 110))
    }
    playerSpawn.SetOrigin(Vector(-4592, -4460, 110))
    EntFireByHandle(playerSpawn, "SetParent", "Subway_TankTrain", 0, null, null)
}
