CommandList.push(
    class {
        name = "slap"
        level = 4

        // !slap (target arg: Specific player, team target. Self if no arg.)
        function CC(p, args) {
            local SlapPlayer = function(player) {
                EntFireByHandle(player, "sethealth", "-50", 0, player, player)
                player.SetVelocity(Vector(RandomInt(-900, 900), RandomInt(300, 900), RandomInt(-900, 900)))
            }

            if (args.len() == 0 || GetAdminLevel(p) < 4) {
                SlapPlayer(p)
                return SendChatMessage("Slapped yourself.", p)
            }
            
            args[0] = strip(args[0])
            local target = FindPlayerByName(args[0])

            if ((args[0].find("@") != null) && (target == null)) {
                switch (args[0]) {
                    case "@a":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            SlapPlayer(player) 
                        }
                        SendChatMessage("Slapped all players!", p)
                        return

                    case "@b":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_BLUE) {
                                SlapPlayer(player)
                            }
                        }
                        SendChatMessage("Slapped all Atlas players!", p)
                        return

                    case "@o":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_RED) {
                                SlapPlayer(player)
                            }
                        }
                        SendChatMessage("Slapped all P-Body players!", p)
                        return
                    
                    case "@s":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_SINGLEPLAYER) {
                                SlapPlayer(player)
                            }
                        }
                        SendChatMessage("Slapped all Singleplayer team players!", p)
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
                SlapPlayer(target)
                SendChatMessage("Slapped player " + FindPlayerClass(target).username + "!", p)
            }
        }
    }
)