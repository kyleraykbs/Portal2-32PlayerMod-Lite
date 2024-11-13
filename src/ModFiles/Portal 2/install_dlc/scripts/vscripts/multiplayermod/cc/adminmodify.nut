CommandList.push(
    class {
        name = "adminmodify"
        level = 6

        // !adminmodify (target arg: player) (new admin level)
        function CC(p, args) {
            try {
                args[0] = strip(args[0])
                local plr = FindPlayerByName(args[0])
                try {
                    args[1] = strip(args[1])
                    args[1] = args[1].tointeger()
                    try {
                        if (typeof(args[1]) == "integer") {
                            if (args[1] >= 0 && args[1] <= 6) {
                                SetAdminLevel(args[1].tostring(), plr.entindex())
                            }
                        }
                    } catch (exception) {
                    SendChatMessage("[ERROR] Input a number after the player name to set a new admin level!", p)
                        return
                    }
                } catch (exception) {
                    if (plr != null) {
                        SendChatMessage(GetPlayerName(plr.entindex()) + "'s admin level: " + GetAdminLevel(plr), p)

                        // Update the config.nut admins array memory in case their name was on there
                        // This way, they can't just leave and reconnect
                        foreach (admin in Admins) {
                            // Separate the SteamID and the admin level
                            local level = split(admin, "[]")[0]
                            local SteamID = split(admin, "]")[1]

                            if (SteamID == FindPlayerClass(plr).steamid.tostring()) {
                                if (SteamID == GetSteamID(1).tostring()) {
                                    // Host always has max perms even if defined lower
                                    if (level.tointeger() < 6) {
                                        return
                                    }
                                    admin = "[" + level + "]" + SteamID
                                } else {
                                    admin = "[" + level + "]" + SteamID
                                }
                            }
                        }
                    } else {
                        SendChatMessage("[ERROR] Player not found!", p)
                    }
                }
            } catch (exception) {
                SendChatMessage("[ERROR] Input a player name!", p)
            }
        }
    }
)