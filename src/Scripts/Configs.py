import os
import json
import locale
from Scripts.BasicLogger import Log
import Scripts.GlobalVariables as GVars

# █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▀ █▀▄▀█ █▀▀ █▄░█ ▀█▀
# █▄▄ █▄█ █░▀█ █▀░ █ █▄█   █░▀░█ █▀█ █░▀█ █▀█ █▄█ ██▄ █░▀░█ ██▄ █░▀█ ░█░

DefaultPlayer = {"name": "New Player", "steamid": "0", "adminLevel": "0"}

def GetSysLang() -> str:
    """Gets the default system language

    Returns
    -------
    str
        translation file name, english if the language is not supported
    """

    sysDefaultLocale = locale.getlocale()[0]

    if sysDefaultLocale == None:
        Log("Automatic language grabbing failed! Defaulting to English...")
        return "English"

    if sysDefaultLocale.split("_")[0].lower() == "fr":
        return "Fran\u00e7ais"

    if sysDefaultLocale.split("_")[0].lower() == "es":
        return "Espa\xf1ol"

    if sysDefaultLocale.split("_")[0].lower() == "pl":
        return "Polski"

    if sysDefaultLocale.split("_")[0].lower() == "pt_BR":
        return "Português (Brasil)"

    if sysDefaultLocale.split("_")[0].lower() == "zh":

        chineseType = sysDefaultLocale.split("_")[1].lower()

        if chineseType in ["cn", "sg", "hans"]:
            return "简体中文 (Simplified Chinese)"

        if chineseType in ["hk", "mo", "hant"]:
            return "繁體中文 (Traditional Chinese)"

    if sysDefaultLocale.split("_")[0].lower() == "it":
        return "Italiano"

    return "English"

# Default config values for the launcher:
# "value".
# "menu": where the config should appear.
# "description": appears as a label when the config is hovered over.
# "warning": same as description and appears below it but in red.
DefaultConfig = {
    "Active-Language": {
        "value": GetSysLang(),
        "menu": "",
        "description": "The launcher's language.",
        "warning": "",
        "prompt": ""
    },
    "Last-Map": {
        "value": "",
        "menu": "",
        "description": "The last map played.",
        "warning": "",
        "prompt": ""
    },

    "Launcher-SFX": {
        "value": True,
        "menu": "general",
        "description": "Makes the buttons play sound effects.",
        "warning": "",
        "prompt": ""
    },
    "Portal2-Path": {
        "value": "undefined",
        "menu": "general",
        "description": "Path of the Portal 2 Folder.",
        "warning": "",
        "prompt": "Enter the path to the Portal 2 folder."
    },
    "Auto-Unmount": {
        "value": True,
        "menu": "general",
        "description": "Automatically unmount the mod when the game closes.",
        "warning": "It's recommended to leave this on!",
        "prompt": ""
    },
    "Start-From-Last-Map": {
        "value": False,
        "menu": "general",
        "description": "Automatically start Portal 2 from the last played map.",
        "warning": "",
        "prompt": ""
    },
    "Discord-RPC": {
        "value": True,
        "menu": "general",
        "description": "Enable Discord Rich Presence for P2:MM.",
        "warning": "",
        "prompt": ""
    },

    "Portal2-VR-Mod": {
        "value": False,
        "menu": "advanced",
        "description": "Enable this to start P2:MM with the Portal 2 VR Mod.",
        "warning": "P2VR v0.1.5 needed as latest pre-release is unstable. Make sure P2VR works before using it with P2MM!",
        "prompt": ""
    },
    "Discord-Webhook": {
        "value": False,
        "menu": "advanced",
        "description": "Turn on using a webhook to send chat messages to Discord.",
        "warning": "Discord-Webhook-URL must be specified for this to work.",
        "prompt": ""
    },
    "Discord-Webhook-URL": {
        "value": "",
        "menu": "advanced",
        "description": "Webhook URL used to send webhook events to from your server.",
        "warning": "Console in Portal 2 will report if URL is invalid.",
        "prompt": "Webhook used to send webhook events to from your server."
    },
    "Custom-Launch-Options": {
        "value": "",
        "menu": "advanced",
        "description": "Add your own launch options for Portal 2. Example: '+map mp_coop_lobby_3'",
        "warning": "Leave this alone if you don't know what it does!",
        "prompt": "Launch options for Portal 2.\nExample: '+map mp_coop_lobby_3'"
    },

    "Players": {
        "value": [
            DefaultPlayer
        ],
        "menu": "players",
        "description": "A list of Admins.",
        "warning": "",
        "prompt": ""
    },

    "Dev-Mode": {
        "value": False,
        "menu": "dev",
        "description": "Enables debugging.",
        "warning": "Only enable this if you know what you're doing!",
        "prompt": ""
    }
}

ImmutableKeys = {"value", "menu", "description", "warning", "prompt"}

# verifies the config file by making sure that the processed data has the same keys as the default
# if it doesn't then we'll transfer the values from the local config file to the default one and write the default one
def VerifyConfigFileIntegrity(config: dict) -> dict:
    Log("=========================")
    Log("Validating config data...")

    copiedConfigKeys = config.keys()
    errors = 0
    # VALIDATE ALL THE KEYS ARE CORRECT
    for key in copiedConfigKeys:
        if key not in DefaultConfig.keys():
            Log(f"The key [{key}] is invalid, fixing it...")
            config.pop(key)
            errors +=1

        # validate all the immutable values
        for property in config[key]:
            if property not in ImmutableKeys:
                if config[key][property] != DefaultConfig[key][property]:
                    Log(f"The value for [{key}][{property}] is invalid, fixing it...")
                    config[key][property] = DefaultConfig[key][property]
                    errors +=1

    # VALIDATE ALL THE KEYS EXIST
    for key in DefaultConfig.keys():
        if key not in config.keys():
            Log(f"The key [{key}] is missing, fixing it...")
            config[key] = DefaultConfig[key]
            errors +=1

    # VALIDATE THAT ALL THE KEYS HAVE ALL THE VALUES
    for key in DefaultConfig:
        for property in DefaultConfig[key]:
            if property not in config[key]:
                Log(f"The value for [{key}][{property}] is missing, fixing it...")
                config[key][property] = DefaultConfig[key][property]
                errors +=1
    Log("=========================")

    if errors > 0:
        WriteConfigFile(config)

    # if the config keys are the same as the default then just return them
    return config


def ValidatePlayerKeys() -> None:
    Log("Validating player keys...")
    try:
        index = 0
        errs = 0
        player: dict
        for player in GVars.configData["Players"]["value"]:
            if player.keys() != DefaultPlayer.keys():
                errs += 1
                tempPlayer = DefaultPlayer
                print(f"Local player keys = {player.keys()} \n saved player keys = {tempPlayer.keys()}")
                for key in tempPlayer.keys():
                    try:
                        tempPlayer[key] = player[key]
                    except Exception as e:
                        Log(str(e))
                GVars.configData["Players"]["value"][index] = tempPlayer

            if errs > 0:
                Log(f"Found {str(errs)} key errors in a player property")

            index += 1

        if errs > 0:
            WriteConfigFile(GVars.configData)

        Log("Validated all keys!")

    except Exception as e:
        Log("ERROR: " + str(e))
        GVars.configData["Players"]["value"] = [DefaultPlayer]
        WriteConfigFile(GVars.configData)


def GetConfigList(search: str, val: str) -> list:
    lst = []
    for key in GVars.configData:
        if GVars.configData[key][search] == val:
            lst.append(key)
    return lst

def WriteConfigFile(configs: dict) -> None:
    filepath = FindConfigPath()
    # just to make sure the file doesn't exist
    try:
        os.remove(filepath)
        Log("Deleted old file")
    except Exception as e:
        Log(f"Config file doesn't exist? {str(e)}")

    Log("Writing to file...")
    with open(filepath, "w", encoding="utf-8") as cfg:
        json.dump(configs, cfg, indent=4)

# since we already checked for the integrity of the config file earlier we don't need to re-read from it just change the value in the loaded file and write the whole thing back
def EditConfig(search: str, newvalue: str) -> None:
    GVars.configData[search]["value"] = newvalue
    WriteConfigFile(GVars.configData)

def EditPlayer(index: int, name: str = None, steamId: str = None, level: str = None):
    if name is not None:
        GVars.configData["Players"]["value"][index]["name"] = name
    if steamId is not None:
        GVars.configData["Players"]["value"][index]["steamid"] = steamId
    if level is not None:
        GVars.configData["Players"]["value"][index]["adminLevel"] = level

    WriteConfigFile(GVars.configData)

def DeletePlayer(index: int):
    GVars.configData["Players"]["value"].pop(index)
    WriteConfigFile(GVars.configData)

#? why this is a separate function that only has 2 lines?
#* well it will make it easier to change the path in the future if we wished to, just change the return value and it will work fine
def FindConfigPath() -> str:
    Log("Finding config path...")
    # default config path should be here
    return GVars.configPath + os.sep + "configs.cfg"

# to import the config data from the local config file
def ImportConfig() -> dict:
    try:
        Log("            __________Config Data Start__________")
        Log("Importing Config...")

        configPath = FindConfigPath()

        # if the file doesn't exist then create it
        if not os.path.exists(configPath):
            WriteConfigFile(DefaultConfig)

        # read all the lines in the config file
        config = open(configPath, "r", encoding="utf-8").read().strip()

        # if the file is empty then re-create it
        if len(config) == 0:
            WriteConfigFile(DefaultConfig)

        # process the config file into useable data
        Log("Processing config...")

        processedConfig = json.loads(config)

        Log("Configs imported successfully!")

        # at last pass the data to the verify function to make sure everything is clean
        return VerifyConfigFileIntegrity(processedConfig)

    except Exception as e:
        Log(f"Error importing the config file: {str(e)}")
        WriteConfigFile(DefaultConfig)
        GVars.HadToResetConfig = True
        return ImportConfig()