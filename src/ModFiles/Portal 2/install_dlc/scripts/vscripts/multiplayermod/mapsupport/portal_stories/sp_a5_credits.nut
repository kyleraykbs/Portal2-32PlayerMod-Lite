//  ██████╗██████╗             █████╗ ███████╗            █████╗ ██████╗ ███████╗██████╗ ██╗████████╗ ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗██╔════╝           ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║██████╗            ██║  ╚═╝██████╔╝█████╗  ██║  ██║██║   ██║   ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║╚════██╗           ██║  ██╗██╔══██╗██╔══╝  ██║  ██║██║   ██║    ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝██║  ██║███████╗██████╔╝██║   ██║   ██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        UTIL_Team.Spawn_PortalGun(false)
        UTIL_Team.Pinging(false)
        Entities.FindByClassname(null, "logic_auto").Destroy()
        Entities.FindByName(null, "after_credits_movie").__KeyValueFromString("targetname", "after_credits_movie_p2mmoverride")
        EntFire("credits_movie", "AddOutput", "OnPlaybackFinished after_credits_movie_p2mmoverride:PlayMovieForAllPlayers")
        Entities.FindByName(null, "end_command").Destroy()
        EntFire("after_credits_movie_p2mmoverride", "AddOutput", "OnPlaybackFinished p2mm_servercommand:Command:script SendChatMessage(\"There is no Lobby map for Portal Stories Mel. Closing server in 10 seconds... (changelevel in console to cancel)\")")
        EntFire("after_credits_movie_p2mmoverride", "AddOutput", "OnPlaybackFinished p2mm_servercommand:Command:disconnect \"Server Shutdown Sequence Completed.\":10")
    }    
    if (MSPostPlayerSpawn) {
        EntFire("proxy", "ModifySpeed", "0")
        EntFire("credits_movie", "PlayMovieForAllPlayers")        
    }
}
