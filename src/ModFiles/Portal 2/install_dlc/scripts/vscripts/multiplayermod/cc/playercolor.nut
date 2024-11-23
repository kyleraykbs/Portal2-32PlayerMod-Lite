CommandList.push(
    class {
        name = "playercolor"
        level = 0
    

        // !playercolor (r OR reset) (g) (b) (optional arg: player)
        function CC(p, argsog) {
            local ErrorOut = function(p) {
                SendChatMessage("Change player color by color name or RGB value (ex. 0 255 0). Type reset to revert to default color given upon joining.", p)
            }

            if (argsog.len() == 1) {
               args <- [argsog[0], 0, 0]    
            } else {
                args <- argsog
            }

            try {
                args[0] = strip(args[0])
            } catch (exception) {
                printl(exception)
                return ErrorOut(p)
            }

            if (args[0] == "reset") {
                local pTargetPlayer = p
                local pTargetPlayerText = "your"
                try {
                    args[1] = strip(args[1])
                    local plr = FindPlayerByName(args[1])
                    if (plr == null) {
                        return SendChatMessage("[ERROR] Player not found!", pTargetPlayer)
                    }
                    if (plr != p) {
                        pTargetPlayer = plr
                        pTargetPlayerText = FindPlayerClass(pTargetPlayer).username + "'s"
                    }

                } catch (exception) {}
                // Update the player class (RESET BACK TO DEFAULT WITH MULTIPLYING)
                FindPlayerClass(pTargetPlayer).color = GetPlayerColor(pTargetPlayer)

                // Color the player without multiplying the value
                local pColor = GetPlayerColor(pTargetPlayer, false)
                EntFireByHandle(pTargetPlayer, "color", pColor.r + " " + pColor.g + " " + pColor.b, 0, p, p)
                if (pTargetPlayer != p) {
                    // Send to other player as well
                    // Special case for changing chat color to a mildly dark green
                    SendToChat("\x05(P2:MM): Successfully reset " + pTargetPlayerText + " color.", p.entindex())
                    SendToChat("\x05(P2:MM): Successfully reset " + pTargetPlayerText + " color.", pTargetPlayer.entindex()) // Notify the other player who got colored as well
                } else {
                    // Only one person changed color
                    SendChatMessage("Successfully reset " + pTargetPlayerText + " color.", p)
                }
                return
            }

            
            local x = GetColorByName(args[0])
            local playerextra;
            if(x != null) {
                if (args.len() == 2) {
                    playerextra = args[1]
                    args.append(null);
                }
                args[0] = x.r;
                args[1] = x.g;
                args[2] = x.b; // nice
                if (playerextra != null) {
                    args.append(playerextra)
                }
            }

            try {
                args[1] = strip(args[1].tostring())
                args[2] = strip(args[2].tostring())
            } catch (exception) {
                printl(exception)
                return ErrorOut(p)
            }

            local IsCustomRGBIntegerValid = function(x) {
                try {
                    x = x.tointeger()
                } catch (err) {
                    return false
                }

                if (x >= 0 && x <= 255) {
                    return true
                }
                return false
            }

            // Make sure that all args are integers
            for (local i = 0; i < 3 ; i++) {
                if (!IsCustomRGBIntegerValid(args[i])) {
                    return ErrorOut(p)

                }
                args[i] = args[i].tointeger()
            }

            local pTargetPlayer = p
            local pTargetPlayerText = "your"

            // Is there a player name specified?
            try {
                args[3] = strip(args[3])
                local plr = FindPlayerByName(args[3])

                if (plr == null) {
                    return SendChatMessage("[ERROR] Player not found!", p)
                }

                if (GetAdminLevel(p) < 2 && plr != p) {
                    return SendChatMessage("[ERROR] You need to have admin level 2 or higher to use on others!", p)
                }

                if (plr != p) {
                    pTargetPlayer = plr
                    pTargetPlayerText = FindPlayerClass(plr).username + "'s"
                }
            } catch (exception) {}

            // Doing this so that if someone picks a color that we actually
            // have a preset name for, it will switch the name to it
            local NewColorName = "Custom Color"
            for (local i = 1; i <= 33; i++) {
                local color = GetPlayerColor(i, false)
                if (color.r == args[0] && color.g == args[1] && color.b == args[2]) {
                    NewColorName = color.name
                    break
                }
            }

            // Update the player class
            // Note that the color member variable stores the MULTIPLIED versions
            FindPlayerClass(pTargetPlayer).color = class {
                r = MultiplyRGBValue(args[0])
                g = MultiplyRGBValue(args[1])
                b = MultiplyRGBValue(args[2])
                name = NewColorName
            }

            // Change the color
            EntFireByHandle(pTargetPlayer, "color", args[0].tostring() + " " + args[1].tostring() + " " + args[2].tostring(), 0, p, p)

            if (pTargetPlayer != p) {
                // Send to other player as well
                // Special case for changing chat color to a mildly dark green
                SendToChat("\x05(P2:MM): Successfully changed " + pTargetPlayerText + " color.", p.entindex())
                SendToChat("\x05(P2:MM): Successfully changed " + pTargetPlayerText + " color.", pTargetPlayer.entindex()) // Notify the other player who got colored as well
            } else {
                // Only one person changed color
                SendChatMessage("Successfully changed " + pTargetPlayerText + " color.", p)
            }
        }
    }
)