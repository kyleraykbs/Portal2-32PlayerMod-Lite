import os

import Scripts.BasicFunctions as BF
import Scripts.GlobalVariables as GVars
import Scripts.Configs as CFG

def GetLastLog() -> str:
    logsPath = os.path.join(GVars.modPath, "Logs")
    logs = os.listdir(logsPath)
    logs.sort(reverse=True)
    return os.path.join (logsPath + "/" + logs[0])

def GetConsoleFile() -> str | None:
    path = BF.NormalizePath(GVars.configData['Portal2-Path']['value'] + "/portal2/console.log")
    if os.path.exists(path) and os.path.isfile(path):
        return path
    return None

# should we do any filtering? (the console.txt file saves the local ip on)
def WriteConsoleToLog() -> None:
    consoleFile = GetConsoleFile()
    if consoleFile == None:
        return

    logFile = GetLastLog()

    # just using the logger might be better looking, but i just prefer this monstrosity
    with open(logFile, "a", encoding="utf8") as log:
        log.write("# PORTAL 2 CONSOLE LOGS:\n\n")
        log.writelines(
            FilterConsole(open(consoleFile, "r", encoding="utf8", errors="ignore").readlines())
        )
        log.write("\n\n# PORTAL 2 CONSOLE LOGS END.\n\n")

        if (GVars.configData["Dev-Mode"]["value"]):
            for line in open(consoleFile, "r", encoding="utf8", errors="ignore").readlines():
                print(line)

def FilterConsole(text: list[str]) -> list[str]:
    lastMap = None

    if len(text) == 0:
        return [""]

    i = -1
    while True:
        i +=1
        if i == len(text)-1: break

        # removes duplicate lines (idk why but portal logs everything twice when loading)
        if text[i] == text[i+1]:
            text.pop(i)
            i -= 1
            continue

        # masks the user's ip (ik it's cursed but i ran some benchmarks and it's fast - cabiste)
        if "IP " in text[i]:
            text[i] += " "
            text[i] = text[i].replace(text[i][text[i].index("IP ")+3: text[i].index(" ", text[i].index("IP ")+3, len(text[i]))], "XXX.XXX.XXX.XXX")
            continue

        # gets the last loaded map
        if text[i].startswith("(P2:MM VSCRIPT): MAP LOADED:"):
            parts = text[i].split(":")
            lastMap = ":".join(parts[3:]).strip()
            continue

    if lastMap is not None:
        CFG.EditConfig("Last-Map", lastMap.replace("\n", "").strip())
        print(lastMap)

    return text
