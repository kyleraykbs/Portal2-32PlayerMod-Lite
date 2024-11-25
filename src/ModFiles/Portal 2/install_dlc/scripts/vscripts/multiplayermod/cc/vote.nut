// Modify these as needed...
VotingCooldownWaitPeriod <- 15 // Seconds before next voting can begin after one finished
VotingTime <- 30 // Seconds to actually submit a vote before it automatically ends
MinimumPlayersInitiateVote <- 3 // Minimum number of players required to start a vote

//-----------------------------------------------------------------------------------

VoteCounter <- Entities.CreateByClassname("game_text")
VoteCounter.__KeyValueFromString("targetname", "VoteCounter")
VoteCounter.__KeyValueFromString("x", "0.005")
VoteCounter.__KeyValueFromString("y", "0.9")
VoteCounter.__KeyValueFromString("message", "Vote #: 0/0")
VoteCounter.__KeyValueFromString("holdtime", "1")
VoteCounter.__KeyValueFromString("fadeout", "1.2")
VoteCounter.__KeyValueFromString("fadein", "1.2")
VoteCounter.__KeyValueFromString("channel", "0")
VoteCounter.__KeyValueFromString("spawnflags", "1")
VoteCounter.__KeyValueFromString("color", "255 255 255")

VoteTimer <- Entities.CreateByClassname("game_text")
VoteTimer.__KeyValueFromString("targetname", "VoteTimer")
VoteTimer.__KeyValueFromString("x", "0.005")
VoteTimer.__KeyValueFromString("y", "0.85")
VoteTimer.__KeyValueFromString("message", "Time: " + VotingTime.tostring() + "s")
VoteTimer.__KeyValueFromString("holdtime", "1")
VoteTimer.__KeyValueFromString("fadeout", "1.2")
VoteTimer.__KeyValueFromString("fadein", "1.2")
VoteTimer.__KeyValueFromString("channel", "1")
VoteTimer.__KeyValueFromString("spawnflags", "1")
VoteTimer.__KeyValueFromString("color", "255 255 255")

ShouldDisplayVoteText <- false // Should both game_text's display to everyone right now?
VoteInitTime <- null // When did this vote start?
LastVoteCooldownTime <- Time() // By default, there is no cooldown on map spawn
ReversedTimer <- false // Did we reverse the timer for the vote?

// Basically a global variable outside of the class scope for telling if a vote is active
bAllowVoteTimeCheck <- false // Can we check for the vote timer?

// We aren't going to modify this class directly, we are just going to clone it
// and read these default values, and store a SHARED instance in this array
VoteInstanceArray <- []

//-----------------------------------------------------------------------------------

class Vote {
    ActiveVote = null
    iVotedYes = 0
    iVotedNo = 0
    Arg2 = null

    bVoteInProgress = false
    pVoteInitiator = null
    iCurrentNumberOfPlayers = 0
}

// Recalculate total number of players and their vote status for the display
function Vote::UpdatePlayerCountText() {
    local totalnumplayers = 0
    local yes = 0
    local no = 0
    // Can't really use CalcNumPlayers() here
    for (local ent; ent = Entities.FindByClassname(ent, "player");) {
        totalnumplayers++
        if (FindPlayerClass(ent).hasvotedyes) {
            yes++
        }
        else if (FindPlayerClass(ent).hasvotedno) {
            no++
        }
    }
    iCurrentNumberOfPlayers = totalnumplayers
    iVotedYes = yes
    iVotedNo = no
    Entities.FindByName(null, "VoteCounter").__KeyValueFromString("message", "Vote (Y/N/All): " + iVotedYes.tostring() + "/" + iVotedNo.tostring() + "/" + iCurrentNumberOfPlayers.tostring())
}

// Starts a vote
function Vote::BeginVote(arg1, arg2, pPlayer) {
    if (arg1 == "kick") {
        if (FindPlayerByName(arg2) == null) {
            return SendChatMessage("[ERROR] Player not found!", pPlayer)
        }
        if (!IsDedicatedServer()) {
            if (FindPlayerByName(arg2) == UTIL_PlayerByIndex(1)) {
                return SendChatMessage("[ERROR] Cannot kick server operator!", pPlayer)
            }
        }
    }

    // It's a valid option, so now we update some variables
    ActiveVote = arg1 // What are we voting for?
    Arg2 = arg2 // Second argument varies based on what the vote is for
    VoteInitTime = Time() // Get the current time that this vote has started
    bAllowVoteTimeCheck = true // Allow the timer to count down from VotingTime

    // Update the class info
    FindPlayerClass(pPlayer).startedvote = true
    // Handled in SubmitVote now
    // FindPlayerClass(pPlayer).hasvotedyes = ???
    // FindPlayerClass(pPlayer).hasvotedno = ???

    local intermediateArg2 = ""
    if (ActiveVote == "kick") {
        intermediateArg2 =  " (" + FindPlayerClass(FindPlayerByName(VoteInstanceArray[0].Arg2)).username + ")"
    }
    if (ActiveVote == "changelevel") {
        intermediateArg2 = " (" + VoteInstanceArray[0].Arg2 + ")"
    }

    SendChatMessage("[VOTE] Started vote for " + arg1 + "." + intermediateArg2)
    Vote.SubmitVote("yes", pPlayer)
    SendChatMessage("[VOTE] Put \"!vote yes\" or \"!vote no\" in the chat before the time runs out!")

    // Update the text color
    local rgb = FindPlayerClass(pPlayer).color
    Entities.FindByName(null, "VoteCounter").__KeyValueFromString("color", rgb.r.tostring() + " " + rgb.g.tostring() + " " + rgb.b.tostring())
    Entities.FindByName(null, "VoteTimer").__KeyValueFromString("color", rgb.r.tostring() + " " + rgb.g.tostring() + " " + rgb.b.tostring())

    // Update the text player counts
    UpdatePlayerCountText()

    // Allow it to display to everyone now
    ShouldDisplayVoteText = true
}

// Vote is in progress; People can submit a vote
function Vote::SubmitVote(arg1, arg2) {
    if (arg1 == "yes") {
        FindPlayerClass(arg2).hasvotedyes = true
        iVotedYes++
    } else {
        FindPlayerClass(arg2).hasvotedno = true
        iVotedNo++
    }
    UpdatePlayerCountText()
    SendChatMessage("[VOTE] Submitted vote for " + arg1 + ".", arg2)

    // Everyone voted, so let's decide now
    if (iVotedYes + iVotedNo == iCurrentNumberOfPlayers) {
        DoVote()
    }
}

// Vote has succeeded or failed
// Do the actions accordingly
function Vote::DoVote(arg1 = null) {
    if (arg1 != "cancel") {
        if (/*iVotedYes > iVotedNo && arg1 != "fail" || */arg1 == "succeed") {
            SendChatMessage("[VOTE] The vote has succeeded.")

            // Add stuff for actually changing in game stuffs
            switch (VoteInstanceArray[0].ActiveVote) {
            case "changelevel":
                SendChatMessage("[VOTE] Changing map in 5 seconds.")
                EntFire("p2mm_servercommand", "command", "changelevel " + VoteInstanceArray[0].Arg2, 5)
                break
            case "kick":
                SendChatMessage("[VOTE] Kicking player in 5 seconds.")
                EntFire("p2mm_servercommand", "command", "kick " + FindPlayerClass(FindPlayerByName(VoteInstanceArray[0].Arg2)).username, 5)
                break
            case "duogunonly":
                // How do we deal with other weapon classes?
                if (!IsDedicatedServer()) {
                    SendChatMessage("[VOTE] Stripping all player guns except host in 5 seconds.")
                    UTIL_Team.Spawn_PortalGun(false, "all")
                    // Remove Portal Gun
                    for (local ent = null; ent = Entities.FindByClassname(ent, "weapon_portalgun");) {
                        if (FindPlayerClass(ent.GetRootMoveParent()).id == 1 || FindPlayerClass(ent.GetRootMoveParent()).id == 2) {
                            continue
                        }
                        EntFireByHandle(ent, "AddOutput", "CanFirePortal1 0", 5, null, null)
                        EntFireByHandle(ent, "AddOutput", "CanFirePortal2 0", 5, null, null)
                        EntFireByHandle(ent, "disabledraw", "", 5, null, null)
                    }
                    for (local ent = null; ent = Entities.FindByClassname(ent, "predicted_viewmodel");) {
                        if (FindPlayerClass(ent.GetRootMoveParent()).id == 1 || FindPlayerClass(ent.GetRootMoveParent()).id == 2) {
                            continue
                        }
                        EntFireByHandle(ent, "disabledraw", "", 5, null, null)
                    }
                    break
                }
            default:
                SendChatMessage("[VOTE] You should not see this. This is fatal.")
                break
            }
        }
        else if (iVotedYes == iVotedNo) {
            local charPluralVotes = ""
            if (iVotedYes > 1) {
                charPluralVotes = "s"
            }
            SendChatMessage("[VOTE] The vote has failed and tied, each with " + iVotedYes.tostring() + " vote" + charPluralVotes + ".")
        }
        else if (iVotedYes < iVotedNo && arg1 != "succeed" || arg1 == "fail") {
            SendChatMessage("[VOTE] The vote has failed.")
        }
    }

    CleanUpVote()
}

// Restart everything as if no one has used the CC yet
// (Basically the destructor)
function Vote::CleanUpVote() {
    // Vote forcefully failed or didn't have enough votes
    bAllowVoteTimeCheck = false // Disable this first thing to possibly prevent more DoVotes
    VoteInstanceArray.clear() // Remove all items from this array

    for (local player; player = Entities.FindByClassname(player, "player");) {
        FindPlayerClass(player).startedvote = false // Forget who initiated the vote
        FindPlayerClass(player).hasvotedyes = false // Forget all those that had voted yes
        FindPlayerClass(player).hasvotedno = false // Forget all those that had voted no
    }
    UpdatePlayerCountText()

    ReversedTimer = false
    ShouldDisplayVoteText = false
    VoteTimer.__KeyValueFromString("message", "Time: " + VotingTime.tostring() + "s")
    LastVoteCooldownTime = Time() + VotingCooldownWaitPeriod
}

//-----------------------------------------------------------------------------------

CommandList.push(
    class {
        name = "vote"
        level = 0

        // !vote (vote choice arg: changelevel, kick, or duogunonly) (arg for changelevel map name or kick player name)
        function CC(p, args) {
            if (!Player2Joined && !IsDedicatedServer()) {
                // Just loaded into a map
                SendChatMessage("[VOTE] Wait until the game begins...", p)
                return
            }
            // WE ONLY WANT TO SHARE ONE INSTANCE OF THE CLASS FOR VOTING
            // OTHERWISE WE GET SOME VARIABLES MIXED UP, SUCH AS WHO STARTED
            // A VOTE AND WHO ALREADY VOTED

            local bCurrentCCPlayerInitiatedVote = false
            local Vote = Vote(p)
            VoteInstanceArray.push(Vote)
            Vote = VoteInstanceArray[0]

            try {
                // Always attempt to remove the second array if it exists
                VoteInstanceArray[1].remove()
            } catch (exception) {}

            // End result: We always end up using a shared class instance
            //---------------------------------------------------------------

            // This isn't in the constructor since we need to refresh
            // this info every time CC is activated here by anyone
            local iNumPlayersRightNow = 0
            for (local player; player = Entities.FindByClassname(player, "player");) {
                iNumPlayersRightNow++
                if (FindPlayerClass(player).startedvote) {
                    Vote.bVoteInProgress = true
                    if (p == player) {
                        // This player initiated the vote and
                        // is invoking the command again
                        bCurrentCCPlayerInitiatedVote = true
                        Vote.pVoteInitiator = p
                    }
                }
            }
            // We don't want to set Vote.iCurrentNumberOfPlayers to 0
            // then back to the real number since it can mess up the player count
            Vote.iCurrentNumberOfPlayers = iNumPlayersRightNow

            // Obey the cooldown to initiate a vote
            if (Time().tointeger() < LastVoteCooldownTime.tointeger() && !Vote.bVoteInProgress) {
                SendChatMessage("[VOTE] Vote command is on cooldown for " + VotingCooldownWaitPeriod.tostring() + " seconds.", p)
                return
            }

            // Obey the required number of players needed to initiate a vote
            if (Vote.iCurrentNumberOfPlayers < MinimumPlayersInitiateVote && !Vote.bVoteInProgress) {
                SendChatMessage("[VOTE] Cannot vote if there are less than " + MinimumPlayersInitiateVote.tostring() + " players.", p)
                return
            }

            // Depending on who invokes the command, prompt them with different messages
            if (args.len() == 0) {
                if (Vote.bVoteInProgress) {
                    if (bCurrentCCPlayerInitiatedVote) {
                        SendChatMessage("[VOTE] End a vote with: cancel", p)
                        if (IsAdminLevelEnough(p)) {
                            SendChatMessage("[VOTE] Admins can force an outcome with: fail, succeed", p)
                        }
                    } else {
                        if (FindPlayerClass(p).hasvotedyes || FindPlayerClass(p).hasvotedno) {
                            SendChatMessage("[VOTE] You have already voted.", p)
                        } else {
                            SendChatMessage("[VOTE] Vote with: yes, no", p)
                        }
                    }
                } else {
                    if (IsDedicatedServer()) {
                        SendChatMessage("[VOTE] Start a vote with: changelevel, kick", p)
                    } else {
                        SendChatMessage("[VOTE] Start a vote with: changelevel, kick, duogunonly", p)
                    }
                    VoteInstanceArray.clear()
                }
                return
            }

            args[0] = strip(args[0]).tolower()

            //----------------------------
            // There is a vote in progress
            //----------------------------

            if (Vote.bVoteInProgress) {
                local IsAdminLevelEnough = function(player) {
                    if (GetAdminLevel(player) >= 3) {
                        return true
                    }
                    return false
                }

                // Standard voter
                if (!bCurrentCCPlayerInitiatedVote && !IsAdminLevelEnough(p) && (FindPlayerClass(p).hasvotedyes || FindPlayerClass(p).hasvotedno)) {
                    return SendChatMessage("[VOTE] You have already voted.", p)
                }

                // Vote initiator didn't try to cancel
                if (bCurrentCCPlayerInitiatedVote && args[0] != "cancel" && args[0] != "succeed" && args[0] != "fail") {
                    return SendChatMessage("[VOTE] You initiated a vote and voted already.", p)
                }

                //----------------------------

                if (args[0] == "cancel") {
                    // Only cancel if it's an admin or the vote initiator
                    if (bCurrentCCPlayerInitiatedVote || IsAdminLevelEnough(p)) {
                        Vote.DoVote("cancel")
                        return SendChatMessage("[VOTE] The vote has been cancelled.")
                    }
                    return SendChatMessage("[VOTE] Cannot cancel the vote if you did not start it.", p)
                }
                else if (args[0] == "changelevel" || args[0] == "kick" || args[0] == "duogunonly" && !IsDedicatedServer()) {
                    // Don't start new votes
                    SendChatMessage("[ERROR] Cannot start another vote if one is in progress!", p)
                }
                else if (args[0] == "yes" || args[0] == "no") {
                    // Submit a vote
                    Vote.SubmitVote(args[0], p)
                } else if (args[0] == "succeed" || args[0] == "fail") {
                    // Admin control
                    if (IsAdminLevelEnough(p)) {
                        SendChatMessage("[VOTE] Overruled the vote.", p)
                        Vote.DoVote(args[0])
                    } else {
                        SendChatMessage("[VOTE] You need at least admin level 6 to overrule votes.", p)
                    }
                } else {
                    // Randomness was entered
                    if (FindPlayerClass(p).hasvotedyes || FindPlayerClass(p).hasvotedno) {
                        SendChatMessage("[VOTE] You have already voted.", p)
                    } else {
                        SendChatMessage("[VOTE] Voting options are: yes, no", p)
                    }
                }
                return
            }

            //--------------------------------
            // There was no vote in progress
            //--------------------------------

            if (args[0] == "cancel") {
                SendChatMessage("[ERROR] Cannot cancel. No vote active!", p)
                VoteInstanceArray.clear()
            }
            else if (args[0] == "changelevel") {
                // Start a new vote
                try {
                    args[1] = strip(args[1])
                } catch (exception) {
                    SendChatMessage("[ERROR] Enter a second argument!", p)
                    VoteInstanceArray.clear()
                    return
                }
                if (!IsMapValid(args[1])) {
                    SendChatMessage("[ERROR] Map is not installed on server!", p)
                    VoteInstanceArray.clear()
                    return
                }
                Vote.BeginVote(args[0], args[1], p)
            }
            else if (args[0] == "kick") {
                // Start a new vote
                try {
                    args[1] = strip(args[1])
                } catch (exception) {
                    SendChatMessage("[ERROR] Enter a second argument!", p)
                    VoteInstanceArray.clear()
                    return
                }
                Vote.BeginVote(args[0], args[1], p)
            }
            else if (args[0] == "duogunonly" && !IsDedicatedServer()) {
                // Start a new vote
                Vote.BeginVote(args[0], null, p)
            }
            else if (args[0] == "yes" || args[0] == "no" || args[0] == "succeed" || args[0] == "fail") {
                // Cannot vote for something yet
                SendChatMessage("[ERROR] No vote is active!", p)
                VoteInstanceArray.clear()
            } else {
                // No valid option chosen
                if (IsDedicatedServer()) {
                    SendChatMessage("[ERROR] Voting options are: changelevel, kick!", p)
                } else {
                    SendChatMessage("[ERROR] Voting options are: changelevel, kick, duogunonly!", p)
                }
                VoteInstanceArray.clear()
            }
        }
    }
)