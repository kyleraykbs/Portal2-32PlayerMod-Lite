import http.client as httplib
import os, sys
import shutil
import subprocess
import urllib.parse
import urllib.request
from datetime import datetime
from pathlib import Path

import requests

import Scripts.BasicFunctions as BF
import Scripts.GlobalVariables as GVars
from Scripts.BasicLogger import Log

# When making your fork, make sure to change these to accommodate your version
currentVersion = "2.3.0" #! Change this before releasing a new version!
ownerName = "Portal-2-Multiplayer-Mod" # The user or organization that owns the repository
repoName = "Portal-2-Multiplayer-Mod"  # The repository name, you can't use the id :(
repoBranch = "main" # Change this to the target branch to retrieve ModFiles from

newRepoName = "P2MM-Entanglement" # Repository name for P2MM 3.0, this is checked when it's released


# thanks stackOverflow for this solution <3
def HasInternet() -> bool:
    """Check for internet connection

    Returns
    -------
    bool
        has internet or not
    """

    conn = httplib.HTTPSConnection("8.8.8.8", timeout=5)
    try:
        conn.request("HEAD", "/")
        return True
    except Exception:
        return False
    finally:
        conn.close()


def CheckForNewClient() -> dict:
    """Checks for any new released clients on the repository

    Returns:
        dict: Whether a new client exists or not
    """

    if not HasInternet():
        Log("No Internet Connection!")
        return {"status": False}
    
    if sys.argv[0].endswith(".py"):
        Log("Can't update, running from source!")
        return {"status": False}

    Log("Searching for a new client...")

    endpoint = "https://api.github.com/repos"
    foundNewVer = True
    foundNewRepo = False

    #! search for a new client on the old repo
    try:
        latestReleaseData = requests.get(
            f"{endpoint}/{ownerName}/{repoName}/releases/latest").json()
    except Exception as e:
        Log(f"Error retrieving the latest releases: {str(e)}")
        return {"status": False}

    if "tag_name" in latestReleaseData:
        if (currentVersion == latestReleaseData["tag_name"]):
            Log("Current release is up to date!")
            foundNewVer = False
        elif (currentVersion != latestReleaseData["tag_name"]) and not ("beta" in latestReleaseData["tag_name"]):
            Log("Found new release!")
            foundNewVer = True

    #! search for a new client on the new repo
    try:
        newRepoData = requests.get(
            f"{endpoint}/{ownerName}/{newRepoName}/releases/latest").json()
    except Exception as e:
        Log(f"Error retrieving the latest releases in the new repository: {str(e)}")
        return {"status": False}

    if "tag_name" in newRepoData:
        foundNewRepo = True

    if foundNewRepo or foundNewVer:
        results = {
            "status": True,
            "newRepo": False
        }

        if foundNewRepo:
            results["newRepo"] = True

    else:
        results = {"status": False}

    return results


def DownloadClient(newRepo: bool) -> bool:
    """Downloads the new client

    Args:
        newRepo (bool): If this new client is from the 3.0 repository

    Returns:
        bool: Whether the download succeeded or not
    """

    if not HasInternet():
        Log("No Internet Connection!")
        return False

    # Get the right version of the new client executable
    if (GVars.iow):
        packageType = ".EXE"
    elif (GVars.iol or GVars.iosd):
        packageType = ".APPIMAGE"

    Log(f"Getting packageType: {packageType}")

    endpoint = "https://api.github.com/repos"

    if not newRepo:
        r = requests.get(
            f"{endpoint}/{ownerName}/{repoName}/releases/latest").json()
    else:
        r = requests.get(
            f"{endpoint}/{ownerName}/{newRepoName}/releases/latest").json()

    downloadLink = ""

    # this goes through all the binaries in the latest release until one of them ends with the package type (.exe, .pkg etc...)
    for i in range(len(r["assets"])):
        if (r["assets"][i]["browser_download_url"].upper().endswith(packageType)):
            Log("Found new client to download!")
            downloadLink = r["assets"][i]["browser_download_url"]
            break

    # make sure there's a download link
    if downloadLink == "":
        Log("There is no download link so we can't download!")
        return False

    # download the file in the same directory
    # i don't want to bother with folders
    Log("Downloading...")
    path = os.path.dirname(GVars.executable) + os.sep + "p2mm" + packageType
    urllib.request.urlretrieve(downloadLink, path)
    Log(f"Downloaded new client in: {path}")

    if (GVars.iol or GVars.iosd):
        Log("Linux detected, gotta chmod that bad boy!")
        os.system(f"chmod +x {path}")

    command = path + " updated " + GVars.executable
    subprocess.Popen(command, shell=True)
    Log("Launched the new client!")
    return True


def CheckForNewFiles() -> bool:
    """Checking for new ModFiles

    Returns:
        bool: Whether it found new ModFiles or not
    """

    if not HasInternet():
        Log("No Internet Connection!")
        return False
    
    if sys.argv[0].endswith(".py"):
        Log("Can't update, running from source!")
        return False

    Log("Checking for new files...")
    
    # plan
    # check if identifier file exists, if not then ModFiles don't exist and need to be downloaded
    # download modIndex.json
    # check if the date is greater than the one saved in the local identifier file
    # ask the user if they want to update
    # if yes read where the files are saved on the github repo
    # download all the files and delete the old ones

    # check if the identifier file exists or not
    localIDPath = f"{GVars.modFilesPath}{os.sep}"
    if GVars.configData["Dev-Mode"]["value"]:
        print("localIDPath and which identifier file exists?")
        print(localIDPath)
        print(localIDPath + "p2mm.identifier: " + os.path.exists(localIDPath + "p2mm.identifier"))

    if not (os.path.exists(localIDPath + "p2mm.identifier")):
        Log("Identifier file doesn't exist so the ModFiles are probably unavailable too...")
        return True

    Log("Found local identifier file!")

    # if there was an error retrieving this file that means most likely that we changed it's name and released a new client
    try:
        r = requests.get(
            f"https://raw.githubusercontent.com/{ownerName}/{repoName}/{repoBranch}/ModIndex.json").json()
    except Exception as e:
        Log(f"Error getting the index file: {str(e)}")
        return False

    # compare the dates of the local file and the file on the repo
    localDate = datetime.strptime(open(localIDPath + "p2mm.identifier", "r").read(), "%Y-%m-%d")
    remoteDate = datetime.strptime(r["Date"], "%Y-%m-%d")

    # if the remote date is less or equal to the local date that means our client is up to date
    if (remoteDate <= localDate):
        Log("ModFiles are up to date!")
        return False

    Log(f"The remote date {remoteDate} is greater than the local date {localDate}!")

    return True


def DownloadNewFiles() -> bool:
    """Downloading new ModFiles

    Returns:
        bool: Whether the download succeeded or not
    """

    if not HasInternet():
        Log("No Internet Connection!")
        return False

    r = requests.get(
        f"https://raw.githubusercontent.com/{ownerName}/{repoName}/{repoBranch}/ModIndex.json")
    r = r.json()
    Log(f'Downloading {str(len(r["Files"]))} files...')

    # download the files to a temp folder
    tempPath = GVars.modPath + os.sep + ".temp"
    for file in r["Files"]:
        downloadLink = f"https://raw.githubusercontent.com/{ownerName}/{repoName}/{repoBranch}/"+urllib.parse.quote(
            r["Path"]+file)

        Path(os.path.dirname(
            tempPath + file.replace("/", os.sep))).mkdir(parents=True, exist_ok=True)  # create the folder where the file exists
        try:
            urllib.request.urlretrieve(
                downloadLink, tempPath + file.replace("/", os.sep))
        except Exception as e:
            Log(f"Failed to download a file: {str(e)}")
    Log("Finished downloading!")

    try:
        # when downloading is done delete the old ModFiles
        BF.DeleteFolder(BF.NormalizePath(GVars.modFilesPath))
            #GVars.modPath + "/ModFiles/Portal 2/install_dlc"))
        Log("Deleted old files!")
    except Exception as e:
        Log("There was no old ModFiles...")
        Log(str(e))

    # then copy the new files there
    shutil.move(tempPath, BF.NormalizePath(GVars.modFilesPath))
        #GVars.modPath + "/ModFiles/Portal 2/install_dlc"))
    Log("Copied new files to " + GVars.modFilesPath)
        #BF.NormalizePath("/ModFiles/Portal 2/install_dlc"))