teams <- [
    "Singleplayer",
    "Spectator", // This is not used at all since respawning is broken
    "Red", // P-body
    "Blue" // Atlas
]

CommandList.push(
    class {
        name = "changeteam"
        level = 0

        // !changeteam (optional arg: 0 Singleplayer, 2 P-Body, or 3 Atlas)
        function CC(p, args) {
            try {
                args[0] = strip(args[0])
                if (args[0] == "0" || args[0] == "2" || args[0] == "3" ) {
                    if (p.GetTeam() == args[0].tointeger()) {
                        return SendChatMessage("[ERROR] You are already on this team!", p)
                    } else {
                        p.SetTeam(args[0].tointeger())
                        return SendChatMessage("Team is now set to " + teams[args[0].tointeger()] + ".", p)
                    }
                }
                SendChatMessage("[ERROR] Enter a valid team number: 0, 2, or 3!", p)
            } catch (exception) {
                // No argument, so just cycle through the teams
                if (args.len() == 0) {
                    local iNewTeam = null
                    switch (p.GetTeam()) {
                        case TEAM_SINGLEPLAYER: iNewTeam = TEAM_RED;    break;
                        case TEAM_RED:          iNewTeam = TEAM_BLUE;   break;
                        case TEAM_BLUE: iNewTeam = TEAM_SINGLEPLAYER;   break;
                    }
                    p.SetTeam(iNewTeam)
                    SendChatMessage("Toggled to " + teams[iNewTeam] + " team.", p)
                }
            }
        }
    }
)