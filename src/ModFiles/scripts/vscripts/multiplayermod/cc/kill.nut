CommandList.push(
    class {
        name = "kill"
        level = 0

        // !kill (target arg: Specific player, team target. Self if no arg.)
        function CC(p, args) { 
            local KillPlayer = function(player) {
                // Kill the specified player
                if (player.GetHealth() == 0) { return }
                EntFireByHandle(player, "sethealth", "-100", 0, player, player)
            }
            local KillPlayerMessage = function(iTextIndex, player) {
                // Array of kill messages to call apon
                KillPlayerText <- [
                    "Killed Yourself.", //0
                    "Killed Player.", //1
                    "Killed All Players.", //2
                    "Killed All Atlas Players.", //3
                    "Killed All P-Body Players.", //4
                    "Killed All Singleplayer Team Players." //5
                    "[ERROR] Player not found!", //6
                    "You are already dead!", //7
                    "Player is already dead!" //8
                ]
                SendChatMessage(KillPlayerText[iTextIndex], player)
            }

            // Check if the user has permissions, or its just that they want to target themselves
            if (GetAdminLevel(p) < 3 || args.len() == 0) {
                if (p.GetHealth() == 0) {
                    KillPlayerMessage(7, p)
                }
                KillPlayer(p)
                KillPlayerMessage(0, p)
                return
            }

            args[0] = strip(args[0])
            local target = FindPlayerByName(args[0])

            try {
                if (args.len() == 1) {

                    local targetOperation = false
                    if ((args[0].find("@") != null) && (target == null)) {
                        targetOperation = true
                    }
                    if (targetOperation) {
                        switch (args[0]) {
                            case "@a":
                                for (local player; player = Entities.FindByClassname(player, "player");) {
                                    KillPlayer(player)
                                }
                                KillPlayerMessage(2, p)
                                return

                            case "@b":
                                for (local player; player = Entities.FindByClassname(player, "player");) {
                                    if (player.GetTeam() == TEAM_BLUE) {
                                        KillPlayer(player)
                                    }
                                }
                                KillPlayerMessage(3, p)
                                return

                            case "@o":
                                for (local player; player = Entities.FindByClassname(player, "player");) {
                                    if (player.GetTeam() == TEAM_RED) {
                                        KillPlayer(player)
                                    }
                                }
                                KillPlayerMessage(4, p)
                                return
                            
                            case "@s":
                                for (local player; player = Entities.FindByClassname(player, "player");) {
                                    if (player.GetTeam() == TEAM_SINGLEPLAYER) {
                                        KillPlayer(player)
                                    }
                                }
                                KillPlayerMessage(5, p)
                                return

                            default:
                                SendChatMessage("[ERROR] Invalid target operation used! \"@a\", \"@b\", \"@o\", and \"@s\" are your options!", p)
                                return
                        }
                    }
                    if (target == null) {
                        KillPlayerMessage(6, p)
                        return
                    }
                    if (target.GetHealth() == 0) {
                        KillPlayerMessage(8, p)
                        return
                    }
                    KillPlayer(target)
                    KillPlayerMessage(1, p)
                    return
                }
                SendChatMessage("[ERROR] Too many arguments!", p)
            } catch (exception) {
                SendChatMessage("[ERROR] Error occured, killing player!", p)
                if (p.GetHealth() == 0) {
                    KillPlayerMessage(7, p)
                }
                KillPlayer(p)
                KillPlayerMessage(0, p)
            }
        }
    }
)