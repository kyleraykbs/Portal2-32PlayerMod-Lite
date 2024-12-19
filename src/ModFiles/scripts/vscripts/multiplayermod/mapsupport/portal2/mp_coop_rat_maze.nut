// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗            ██████╗  █████╗ ████████╗           ███╗   ███╗ █████╗ ███████╗███████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔══██╗██╔══██╗╚══██╔══╝           ████╗ ████║██╔══██╗╚════██║██╔════╝
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██████╔╝███████║   ██║              ██╔████╔██║███████║  ███╔═╝█████╗
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██╔══██╗██╔══██║   ██║              ██║╚██╔╝██║██╔══██║██╔══╝  ██╔══╝
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗██║  ██║██║  ██║   ██║   ██████████╗██║ ╚═╝ ██║██║  ██║███████╗███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═════════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

GameStarted <- false
HasTauntedBlue <- false
HasTauntedOrange <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSPostPlayerSpawn) {
        GameStarted <- true
    }

    // This is to make up for the patched command to earn the taunt
    // All players will taunt in the spawn room if one person on a team triggers it
    if (MSLoop) {
        if (GameStarted) {
            if (!HasTauntedBlue) {
                for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-256, -832, -575.97), 128);) {
                    if (p.GetTeam() == TEAM_BLUE) {
                        HasTauntedBlue <- true
                        for (local q = null; q = Entities.FindByClassnameWithin(q, "player", Vector(-160, -736, -575.97), 256);) {
                            if (q.GetTeam() == TEAM_BLUE) {
                                EntFireByHandle(p2mm_clientcommand, "command", "taunt rps", 0.40, q, q)
                            }
                        }
                    }
                }
            }
            if (!HasTauntedOrange) {
                if (!HasTauntedOrange) {
                    for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-256, -640, -575.97), 128);) {
                        if (p.GetTeam() == TEAM_RED) {
                            HasTauntedOrange <- true
                            for (local q = null; q = Entities.FindByClassnameWithin(q, "player", Vector(-160, -736, -575.97), 256);) {
                                if (q.GetTeam() == TEAM_RED) {
                                    EntFireByHandle(p2mm_clientcommand, "command", "taunt rps", 0.40, q, q)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
