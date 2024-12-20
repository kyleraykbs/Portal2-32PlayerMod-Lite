# █ █▀▄▀█ █▀█ █▀█ █▀█ ▀█▀ █▀   ▄█▄   █░█ ▄▀█ █▀█ █ █▄▄ █░░ █▀▀ █▀
# █ █░▀░█ █▀▀ █▄█ █▀▄ ░█░ ▄█   ░▀░   ▀▄▀ █▀█ █▀▄ █ █▄█ █▄▄ ██▄ ▄█

import os
import time
import threading
import subprocess
import traceback

from Scripts.BasicLogger import Log
import Scripts.GlobalVariables as GVars
import Scripts.Configs as CFG
import Scripts.BasicFunctions as BF


# █▀▀ █ █░░ █▀▀   █▀▄▀█ █▀█ █░█ █▄░█ ▀█▀ █▀▀ █▀█
# █▀░ █ █▄▄ ██▄   █░▀░█ █▄█ █▄█ █░▀█ ░█░ ██▄ █▀▄

def SetVScriptConfigFile(vsconfigfile: str) -> None:
    Log("====================================================")
    Log("Setting VScript config file: " + vsconfigfile)
    p2cfgs = CFG.GetConfigList("menu", "portal2")

    lines = open(vsconfigfile, "r", encoding="utf-8").readlines()

    indx = -1
    for line in lines:
        indx += 1
        # remove all spaces
        line = line.strip().replace(" ", "")

        # if the line contains a // remove it
        if (line.find("//") != -1):
            line = line.split("//")[0]
        # if the line is empty skip it
        if (line == ""):
            continue
        # if the line doesnt contain a = or <- skip it
        if (line.find("=") == -1 and line.find("<-") == -1):
            continue

        key = ""

        # if the line has a <-
        if (line.find("<-") != -1):
            # split the <-
            key = line.split("<-")[0]

        # if the line has a =
        if (line.find("=") != -1):
            # split the =
            key = line.split("=")[0]

        for p2cfg in p2cfgs:
            if (key == p2cfg):
                val = GVars.configData[p2cfg]["value"]
                Log("Setting " + p2cfg + " To " + val)
                line = key + " <- " + val
                Log(line)
                lines[indx] = line + "\n"

    ################## ADMINS
    # convert the lines to a string with newlines
    lines = ''.join(lines)
    Log(lines) # Made this be logged for debugging and helping solve issues wih users

    # find the admins section
    admins = lines.find("Admins <-")
    # find the next [ after the admins section
    nextBracket = lines.find("[", admins)
    # add the player line after the admins section
    for player in GVars.configData["Players"]["value"]:
        name = player["name"]
        level = player["adminLevel"]
        steamid = player["steamid"]
        Log("Adding " + name + " to Admins...")

        lines = lines[:nextBracket + 1] + '\n"[' + level + "]" + steamid + '", // ' + name + lines[nextBracket + 1:]

    open(vsconfigfile, "w", encoding="utf-8").write(lines)

    Log("====================================================")

def MountMod(gamepath: str) -> None:
    Log("            __________Mounting Mod Start_________")
    Log("Gathering DLC folder data...")

    # find a place to mount the mod folder
    modFolderMountPoint = PrepareTempContent(gamepath)

    nutConfigFile = GVars.modFilesPath + os.sep + "scripts" + os.sep + "vscripts" + os.sep + "multiplayermod" + os.sep + "config.nut"
    if os.path.exists(nutConfigFile):
        SetVScriptConfigFile(nutConfigFile)
    
    destination = BF.CopyFolder(GVars.modFilesPath + os.sep + ".", gamepath + os.sep + modFolderMountPoint)
    Log(f"Successfully copied the ModFiles to {destination}!")

    mountedModFiles = gamepath + os.sep + modFolderMountPoint
    if gamepath.find("Portal 2") != -1:
        os.rename(mountedModFiles + os.sep + "media_portal2", mountedModFiles + os.sep + "media")
        os.rename(mountedModFiles + os.sep + "maps" + os.sep + "soundcache_portal2", mountedModFiles + os.sep + "maps" + os.sep + "soundcache")
        os.rename(mountedModFiles + os.sep + "scripts" + os.sep + "extras_portal2.txt", mountedModFiles + os.sep + "scripts" + os.sep + "extras.txt")
    elif gamepath.find("Portal Stories Mel") != -1:
        os.rename(mountedModFiles + os.sep + "maps" + os.sep + "soundcache_portal_stories", mountedModFiles + os.sep + "maps" + os.sep + "soundcache")
        os.rename(mountedModFiles + os.sep + "scripts" + os.sep + "extras_portal_stories.txt", mountedModFiles + os.sep + "scripts" + os.sep + "extras.txt")
        os.rename(mountedModFiles + os.sep + "scripts" + os.sep + "vscripts" + os.sep + "transitions_portal_stories", mountedModFiles + os.sep + "scripts" + os.sep + "vscripts" + os.sep + "transitions")
    # elif gamePath.find("Aperture Tag") != -1:
    #   os.rename(mountedModFiles + os.sep + "maps" + os.sep + "soundcache_aperturetag", mountedModFiles + os.sep + "maps" + os.sep + "soundcache")
    #   os.rename(mountedModFiles + os.sep + "scripts" + os.sep + "extras_aperturetag.txt", mountedModFiles + os.sep + "scripts" + os.sep + "extras.txt")

    Log("            ___________Mounting Mod End__________")

# Using the identifier file in P2MM's (basegamedir)_tempcontent folder, it can be determined
# which (basegamedir)_tempcontent folder that is mounted to Portal 2 is in fact P2MM's DLC folder
def FindP2MMFolder(gamepath: str) -> str | bool:
    for file in os.listdir(gamepath):
        # Find all the folders that start with "(basegamedir)_tempcontent" and check if they have the identifier.
        if file.endswith("_tempcontent") and not file.startswith("p2mm_override_") and os.path.isdir(gamepath + os.sep + file) and ("p2mm.identifier" in os.listdir(gamepath + os.sep + file)):
            p2mmFolder = gamepath + os.sep + file
            Log("Found P2MM's (basegamedir)_tempcontent folder: " + p2mmFolder)
            return p2mmFolder
    Log("P2MM's (basegamedir)_tempcontent folder was not found!")
    Log("It's most likely not been mounted to Portal 2 yet, already been unmounted, or the game path is incorrect...")
    return False

# Make sure the dlc folders that come with Portal 2 exist.
# They are required since they include stuff for multiplayer and fixes for other things Portal 2 related.
# portal2_dlc1 is required for multiplayer to work since it includes mp_coop_lobby_3 (although mp_coop_lobby_2 exists as a backup) and the stuff for the DLC course Art Therapy.
# portal2_dlc2 is also required, while its mainly for PeTi, it also includes a bunch of other assets and fixes for Portal 2 that Valve had done.
# If either of these folders are not detected P2MM won't start or be mounted.
def CheckForRequiredP2DLC(gamepath: str) -> bool:
    Log("Checking for DLC folders portal2_dlc1 and portal2_dlc2...")

    if (not (os.path.exists(gamepath + os.sep + "portal2_dlc1") or os.path.exists(gamepath + os.sep + "portal2_dlc2"))):
        Log("Either DLC folder portal2_dlc1 or portal2_dlc2 was not found!")
        Log("P2MM will not be mounted/started!")
        return False
    Log("DLC folders were found...")
    return True

# Find and delete P2MM's (basegamedir)_tempcontent folder
def DeleteModFolder(gamepath: str) -> bool:
    if (not os.path.exists(gamepath)):
        Log("Portal 2 game path not found! Can't remove P2MM temp content folders!")
        return False
    
    Log("           _________Deleting Any P2MM DLC Folders________")

    foundP2MMFolder = FindP2MMFolder(gamepath)
    if foundP2MMFolder:
        Log("Found old temp content folder: " + foundP2MMFolder)
        # delete the folder even if it's not empty
        BF.DeleteFolder(foundP2MMFolder)
        Log("Deleted old temp content folder: " + foundP2MMFolder)
    
    # Rename p2mm_override_(basegamedir)_tempcontent folder, if it exists, back to what that it was named before
    for file in os.listdir(gamepath):
        if file.startswith("p2mm_override_") and os.path.isdir(gamepath + os.sep + file):
            os.rename(gamepath + os.sep + file, gamepath + os.sep + file[14:])
            break

# Prepare the location for (basegamedir)_tempcontent for P2MM's files. Renaming any preexisting ones so it 
def PrepareTempContent(gamepath: str) -> str:
    Log("Preparing game directory for P2MM's (basegamedir)_tempcontent folder...")
    
    # Go through each file in the gamepath to find any existing temp content folders
    for file in os.listdir(gamepath):
        # Find all the folders that start with "_tempcontent", there should only be one.
        # If any folder we find is a (basegamedir)_tempcontent folder without the identifier file inside 
        if file.endswith("_tempcontent") and os.path.isdir(gamepath + os.sep + file) and not os.path.exists(gamepath + os.sep + file + os.sep + "p2mm.identifier"):
            Log("Found a different (basegamedir)_tempcontent folder!")
            Log("Have to rename the folder so we can use our (basegamedir)_tempcontent folder.")
            # Hopefully nobody already has a p2mm_override_(basegamedir)_tempcontent folder :D
            if (not os.path.exists(gamepath + os.sep + "p2mm_override_" + file)):
                os.rename(gamepath + os.sep + file, gamepath + os.sep + "p2mm_override_" + file)
    if gamepath.find("Portal Stories Mel") != -1:
        return "portal_stories_tempcontent"
    # elif gamepath.find("Aperture Tag") != -1:
    #     return "aperturetag_tempcontent"
    return "portal2_tempcontent"
    
def Portal2Running() -> bool:
    """Check if Portal 2 is running.

    Returns:
        bool: Whether Portal 2 is running or not
    """

    return ("portal2.exe" or "portal2_linux") in subprocess.run(["tasklist"] if GVars.iow else ["ps", "aux"], stdout=subprocess.PIPE, text=True).stdout.lower()

# █ █▄░█ █ ▀█▀
# █ █░▀█ █ ░█░

# Parse the launch arguments with whats in the Custom-Launch-Options (CLO).
def AssembleArgs(gamepath: str) -> str | bool:
    #* ConVars/Console Command used here created by plugin:
    #? "+p2mm_developer 0/1": When on, developer log messages for the plugin and VScript will appear in the console.
    #? "+p2mm_lastmap (map)": Used by Portal 2 for the main menu and for starting up singleplayer maps.
    #? "+p2mm_splitscreen 0/1": A ConVar for the launcher to pass and for the main menu to set to start sessions with splitscreen.
    #? "+p2mm_map (map)": A console command used to start and setup P2:MM sessions.
    #?  Sets up ConVars, variables, and flags, as well as handling starting a session on a singleplayer map.
    
    try:
        # Working with the launch arguments and Custom-Launch-Options (CLO) as a table helps with making
        # any needed changes before it is turned into a string then passed on to the Portal 2 executable.
        args = ["-tempcontent", "-novid", "-allowspectators", "-nosixense", "-condebug p2mm.log", "-usercon"]
        CLO = []

        if gamepath.find("Portal Stories Mel") != -1:
            args.insert(1, "-game portal_stories")
        # elif gamePath.find("Aperture Tag") != -1:
        #   args.insert(1, "-game aperturetag")

        if GVars.configData['Portal2-VR-Mod']['value']: # Add launch arguments needed for the VR mod
            args.extend([
                "-window",
                "-width 1280",
                "-height 720",
                "+mat_motion_blur_percent_of_screen_max 0",
                "+mat_queue_mode 0",
                "+mat_vsync 0",
                "+mat_antialias 0",
                "+mat_grain_scale_override 0"
            ])

        preCLO = GVars.configData['Custom-Launch-Options']['value'].replace('"', "\"").strip().split(" ")

        [CLO.append(arg) for arg in preCLO if not arg in CLO] # Remove duplicate launch arguments
        if GVars.configData['Portal2-VR-Mod']['value'] and ("-vulkan" in " ".join(CLO)): # Remove the "-vulkan" argument for the host as it doesn't work with the VR mod
            Log("'-vulkan' found in Custom Launch Options! Doesn't work with VR mod so it will be removed for the host.")
            args.remove(args[args.index("-vulkan")])
        
        if not GVars.configData['Discord-RPC']['value']:
            args.extend(["+p2mm_discord_rpc 0"])
        
        if GVars.configData['Discord-Webhook']['value']:
            args.extend(["+p2mm_discord_webhooks 1"])
            args.extend(["+p2mm_discord_webhooks_url \"" + GVars.configData['Discord-Webhook-URL']['value'] + "\""])
        
        Log("Default launch args: " + str(args))
        Log("preCLO: " + str(preCLO))
        Log("CLO: " + str(CLO))

        # If "+ss_map" is in the CLO, set the plugin's splitscreen ConVar to true for "p2mm_startsession" to read,
        # then replace any "+map" and "+ss_map" with "+p2mm_map" for the mod to properly start.
        # The user can also manually specify "+p2mm_splitscreen", check for and if its not there add it in.
        if not ("+p2mm_splitscreen" in " ".join(CLO)):
            args.extend(("+p2mm_splitscreen 1" if "+ss_map" in " ".join(CLO) else "+p2mm_splitscreen 0").split(" "))
        args.extend(" ".join(CLO).replace("+map", "+p2mm_map").replace("+ss_map", "+p2mm_map").split(" "))

        # Add the last map played for the Last Map System if enabled, if a last map was recorded, and if the last map already isn't in Custom-Launch-Options (CLO).
        if ((GVars.configData["Start-From-Last-Map"]["value"]) and (len(GVars.configData["Last-Map"]["value"].strip()) > 0) and (not GVars.configData["Last-Map"]["value"].strip() in " ".join(args))):
            Log("Last Map System on and has value: " + GVars.configData["Last-Map"]["value"].strip())
            # Make sure that if last map is enabled, the last map is set for starting the session.
            if ("+p2mm_map" in " ".join(args)):
                args = list(map(lambda x: x.replace(args[args.index("+p2mm_map") + 1], GVars.configData["Last-Map"]["value"].strip()), args))
            else:
                args.extend(["+p2mm_map", GVars.configData["Last-Map"]["value"].strip()])

        # While the Last Map System can be disabled, the user can still pass "+p2mm_lastmap"
        # to start at a certain map, while really they should just use "+p2mm_map".
        # To reduce the number of map changes and reduce load time, replace the map specified with
        # "+p2mm_map" with the one with "+p2mm_lastmap", then remove "+p2mm_lastmap" and its value.
        if ("+p2mm_lastmap" in " ".join(args)):
            Log("Forced +p2mm_lastmap in args.")
            if ("+p2mm_map" in " ".join(args)):
                args = list(map(lambda x: x.replace(args[args.index("+p2mm_map") + 1], args[args.index("+p2mm_lastmap") + 1]), args))
                args.remove(args[args.index("+p2mm_lastmap") + 1])
                args.remove("+p2mm_lastmap")
            else:
                args.extend(["+p2mm_map", args[args.index("+p2mm_lastmap") + 1]])
                args.remove(args[args.index("+p2mm_lastmap") + 1])
                args.remove("+p2mm_lastmap")
        
        args = " ".join(args).strip()
    except Exception:
        Log(f"{traceback.format_exception()}")
        Log("Launch arguments weren't able to be parsed correctly!")
        Log("This is most likely due to incorrectly inputting launch arguments into the Custom-Launch-Options. Please check and made sure they are inputted correctly.")
        Log("Game will launch without Custom-Launch-Options and start with default launch arguments (-novid -allowspectators -nosixense -conclearlog -condebug -usercon)...")
        return False

    Log("Final args: " + args)
    return args

# START THE GAME!!!
def LaunchGame(gamepath: str, args: str) -> None:
    Log("=============")
    Log("Running Game...")

    try:
        if (GVars.iow):
            # for hiding the cmd window on windows
            si = subprocess.STARTUPINFO()
            si.dwFlags |= subprocess.STARTF_USESHOWWINDOW

            # start portal 2 with the launch options and dont wait for it to finish
            def RunGame() -> None:
                # start portal 2 with the launch options and dont wait for it to finish
                Log("")
                Log(f'Starting Portal 2: "{gamepath + os.sep}portal2.exe" {args}')
                subprocess.call(f'"{gamepath + os.sep}portal2.exe" {args}', startupinfo=si)
                Log("Game exited successfully.")
                # Run The AfterFunction
                GVars.AfterFunction()
            # start the game in a new thread
            thread = threading.Thread(target=RunGame)
            thread.daemon = True
            thread.start()

        elif (GVars.iol or GVars.iosd): #launching for linux
            def RunGame():
                def RunGame():
                    Log("")
                    Log(f'Starting Portal 2: steam -applaunch 620 {args}\n')
                    os.system(f'steam -applaunch 620 {args}')
                thread = threading.Thread(target=RunGame)
                thread.daemon = True
                thread.start()

                def CheckForGame() -> None:
                    shouldcheck = True
                    latched = False
                    while shouldcheck:
                        gamerunning = str(os.system("pidof portal2_linux"))
                        if gamerunning == "256":
                            if latched == True:
                                GVars.AfterFunction()
                                shouldcheck = False
                        elif not latched:
                            latched = True
                        time.sleep(1)
                CheckForGame()
            thread = threading.Thread(target=RunGame)
            thread.daemon = True
            thread.start()

    except Exception as e:
        Log("Failed to launch Portal 2!")
        Log("Error: " + str(e))
        os._exit(1)
