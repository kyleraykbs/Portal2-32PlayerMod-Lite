CommandList.push(
    class {
        name = "rocket"
        level = 0

        // !rocket (target arg: Specific player, team target. Self if no arg.)
        function CC(p, args) {
            local RocketPlayer = function(player) {
                player.SetVelocity(Vector(player.GetVelocity().x, player.GetVelocity().y, 500))
                EntFireByHandle(player, "sethealth", "-99999999999", 0.75, null, null)
            }

            if (args.len() == 0 || GetAdminLevel(p) < 4) {
                RocketPlayer(p)
                SendChatMessage("Rocketed yourself.", p)
                return
            }

            args[0] = strip(args[0])
            local target = FindPlayerByName(args[0])

            if ((args[0].find("@") != null) && (target == null)) {
                switch (args[0]) {
                    case "@a":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            RocketPlayer(player) 
                        }
                        SendChatMessage("Rocketed all players!", p)
                        return

                    case "@b":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_BLUE) {
                                RocketPlayer(player)
                            }
                        }
                        SendChatMessage("Rocketed all Atlas players!", p)
                        return

                    case "@o":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_RED) {
                                RocketPlayer(player)
                            }
                        }
                        SendChatMessage("Rocketed all P-Body players!", p)
                        return
                    
                    case "@s":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_SINGLEPLAYER) {
                                RocketPlayer(player)
                            }
                        }
                        SendChatMessage("Rocketed all Singleplayer team players!", p)
                        return

                    default:
                        SendChatMessage("[ERROR] Invalid target operation used! \"@a\", \"@b\", \"@o\", and \"@s\" are your options!", p)
                        return
                }
            }
            
            if (target == null) {
                SendChatMessage("[ERROR] Player not found!", p)
                return
            } else {
                RocketPlayer(target)
                SendChatMessage("Rocketed player " + FindPlayerClass(target).username + "!", p)
            }
        }
    }
)