// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗            ███████╗ █████╗ ███╗  ██╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝██╔══██╗████╗ ██║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           █████╗  ███████║██╔██╗██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██╔══╝  ██╔══██║██║╚████║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗██║     ██║  ██║██║ ╚███║
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚══╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel mp_coop_lobby_3:5")

        // We are going to fix the ending line not playing in the map
        Entities.FindByName(null, "@relay_explode_bots_transition").Destroy()

        // Re-make the exact same logic_relay but with a different timing for playing the ending video
        // The timing is tight for the level transition, but it barely fits together
        Entities.CreateByClassname("logic_relay").__KeyValueFromString("targetname", "@relay_explode_bots_transition")
        EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger @glados:RunScriptCode:GladosBlowUpBots()")
        EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger fade_exit_level:Fade::2.6")
        EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger template_movie_level_transition:ForceSpawn::4") // Change this from 2.4 to 3
        EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger transition_script:RunScriptCode:TransitionFromMap():4")
        EntFire("@relay_explode_bots_transition", "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel mp_coop_lobby_3:5") // Add this output
    }
}