CommandList.push(
    class {
        name = "tp"
        level = 2

        // !tp (target arg: Specific player, team target. destination player if only this arg.) (destination arg: player)
        function CC(p, args) {
            local TeleportTargetOperation = function(operation, destination, p) {
                switch (operation) {
                    case "@a":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            player.SetOrigin(destination.GetOrigin())
                            player.SetAngles(destination.GetAngles().x, destination.GetAngles().y, destination.GetAngles().z)
                        }
                        SendChatMessage(destination == p ? "Brought all players." : "Teleported all players.", p)
                        return

                    case "@b":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_BLUE) {
                                player.SetOrigin(destination.GetOrigin())
                                player.SetAngles(destination.GetAngles().x, destination.GetAngles().y, destination.GetAngles().z)
                            } 
                        }
                        SendChatMessage(destination == p ? "Brought all Atlas players." : "Teleported all Atlas players.", p)
                        return

                    case "@o":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_RED) {
                                player.SetOrigin(destination.GetOrigin())
                                player.SetAngles(destination.GetAngles().x, destination.GetAngles().y, destination.GetAngles().z)
                            } 
                        }
                        SendChatMessage(destination == p ? "Brought all P-Body players." : "Teleported all P-Body players.", p)
                        return
                    
                    case "@s":
                        for (local player; player = Entities.FindByClassname(player, "player");) {
                            if (player.GetTeam() == TEAM_SINGLEPLAYER) {
                                player.SetOrigin(destination.GetOrigin())
                                player.SetAngles(destination.GetAngles().x, destination.GetAngles().y, destination.GetAngles().z)
                            } 
                        }
                        SendChatMessage(destination == p ? "Brought all Singleplayer team players." : "Teleported all Singleplayer team players.", p)

                    default:
                        SendChatMessage("[ERROR] Invalid target operation used! \"@a\", \"@b\", \"@o\", and \"@s\" are your options!", p)
                        return
                }
            }

            if (args.len() == 0) {
                SendChatMessage("[ERROR] Input a teleport!", p)
                return
            }
            if (args.len() > 2) {
                SendChatMessage("[ERROR] Too many arguments given!", p)
                return
            }

            // args[0] -> if exists -> target to teleport, if there is a "@" check for which team target to use
            args[0] = strip(args[0])
            local target = FindPlayerByName(args[0])

            local targetOperation = false
            if ((args[0].find("@") != null) && (target == null)) {
                targetOperation = true
            }

            if ((target == null) && (!targetOperation)) {
                SendChatMessage("[ERROR] Player not found!", p)
                return
            }

            if (args.len() == 1) {
                if (targetOperation) {
                    TeleportTargetOperation(args[0], p, p)
                    return
                }

                if (target == p) {
                    SendChatMessage("[ERROR] You are already here!", p)
                    return
                }

                p.SetOrigin(target.GetOrigin())
                p.SetAngles(target.GetAngles().x, target.GetAngles().y, target.GetAngles().z)
                SendChatMessage("Teleported to player.", p)
                return
            }

            // args[1] if exist -> player to teleport the target to
            args[1] = strip(args[1])
            local destination = FindPlayerByName(args[1])

            if (destination == null) {
                SendChatMessage("[ERROR] Player not found!", p)
                return
            }
            
            if (targetOperation) {
                TeleportTargetOperation(args[0], destination, p)
                return
            }

            // if the second argument is a player
            target.SetOrigin(destination.GetOrigin())
            target.SetAngles(destination.GetAngles().x, destination.GetAngles().y, destination.GetAngles().z)
            if (target == p) {
                SendChatMessage("Teleported to player.", p)
                return
            } else {
                // Special case for changing chat color to a mildly dark green
                SendToChat("\x05(P2:MM): Teleported player.", p.entindex())
                SendToChat("\x05(P2:MM): You've been teleported.", target.entindex()) // Notify the other player who got teleported as well
                return
            }
        }
    }
)