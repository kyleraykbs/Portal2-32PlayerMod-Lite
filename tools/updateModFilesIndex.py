import os, json
from datetime import datetime

#? Purpose:
#* This Python script is used to update the ModIndex.json file as well as 
#* the identifier file found in the ModFiles.
#* This is used by the launcher to check if the version of the ModFiles
#* on remote is newer than what is downloaded on the users system, and if
#* the user has all the files. If not they will be asked to update their
#* ModFiles.

#? User Process:
#* 1- Run script from the root directory. `python tools\updateModFilesIndex.py`
#* 2- Copy the relative path of the identifier file. (ex: src\ModFiles\p2mm.identifier)
#* 3- Input the path when the script asks for it.
#* 4- A file should be created/updated (ModIndex.json) that means everything ran correctly, the identifier given will also be updated.
#* 5- Push the changes to GitHub.

# Goes through all the files in the directory and saves their full name in fileList
def GetFiles(path):
    print("Getting current files in ModFiles folder...")

    fileList = []

    for root, dirs, files in os.walk(path):
        for file in files:
            fileList.append(os.path.join(root, file).replace(path,"").replace(os.sep, "/"))

    return fileList

def SaveData():
    filesData = {
        "Date": str(datetime.now().date()),
        "Path": "",
        "Files":[]
    }
    
    # Define path to identifier file and json index file
    filesData["Path"] = f"src{os.sep}ModFiles{os.sep}p2mm.identifier"
    indexPath = f"{os.getcwd() + os.sep}ModIndex.json"

    # Check if the identifier file exists
    if not os.path.exists(filesData["Path"]):
        print("p2mm.identifier file is not found! Exiting...")
        exit(0)
    
    # Write current date to the identifier file so it can be checked for updating
    print("Writing current date to identifier file...")
    open(os.getcwd() + os.sep + filesData["Path"], "w", encoding="utf-8").write(filesData["Date"])
    
    # Change filesData["Path"] to just the directory and make it a absolute path
    filesData["Path"] = os.getcwd() + os.sep + os.path.dirname(filesData["Path"]) # this to get the absolute path of the folder for whoever is running this code
    
    # Get a list of all the ModFiles directories files
    filesData["Files"] = GetFiles(filesData["Path"])

    # Make urls work correctly
    filesData["Path"] = filesData["Path"].replace(os.sep, "/")
    
    # Write our collected file data to the json index file
    print("Writing collected files to index file...")
    with open(indexPath, "w", encoding="utf-8") as indexFile:
        json.dump(filesData, indexFile, indent=4)

SaveData()
print("Finished writing to index and identifier file! :D")
exit(0)