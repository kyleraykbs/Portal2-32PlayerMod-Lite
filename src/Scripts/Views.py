from MainWindow import Gui
from Models.ConfigButtonModel import ConfigButton
import Scripts.Updater as Up
import Scripts.Configs as CFG
from Models.LabelModel import Label
from Models.ButtonModel import Button
import Scripts.GlobalVariables as GVars
import Scripts.BasicFunctions as BF
from Scripts.BasicLogger import Log
from steamid_converter import Converter


def MainMenu(ui: Gui) -> tuple[list[Button], list[Label]]:
    Button_LaunchGame = Button(
        GVars.translations["play_button"], ui.Button_LaunchGame_func, (50, 255, 120), isAsync=True)
    Button_Settings = Button(
        GVars.translations["settings_button"], ui.Button_Settings_func)
    Button_Update = Button(
        GVars.translations["update_button"], ui.Button_Update_func, (255, 0, 255), isAsync=True)
    Button_ManualMode = Button(
        GVars.translations["manual_mounting_button"], ui.Button_ManualMode_func)
    Button_Workshop = Button(
        GVars.translations["workshop_button"], ui.Button_Workshop_func, (14, 216, 235))
    Button_ResourcesMenu = Button(
        GVars.translations["resources_button"], ui.Button_ResourcesMenu_func, (75, 0, 255))
    Button_Exit = Button(
        GVars.translations["exit_button"], ui.Button_Exit_func, (255, 50, 50), isAsync=True, clickAnimation="none")

    Text_MainMenuText = Label(GVars.translations["welcome"], color=(
        255, 234, 0), xPos=790, xEnd=1000, yPos=20)
    Text_LauncherVersionText = Label(
        GVars.translations["version"] + Up.currentVersion, color=(255, 234, 0), xPos=20, xEnd=300, yPos=20)

    Buttons = [Button_LaunchGame, Button_Settings, Button_Update,
               Button_ManualMode, Button_Workshop, Button_ResourcesMenu]
    Labels = [Text_MainMenuText, Text_LauncherVersionText]

    if ui.DevMode:
        Button_Test = Button("Test Button", ui.Button_Test_func)
        Text_DevMode = Label(GVars.translations["dev_mode_enabled"], color=(
            255, 0, 0), xPos=75, xEnd=750, yPos=725)

        Buttons.append(Button_Test)
        Labels.append(Text_DevMode)

    Buttons.append(Button_Exit)

    return (Buttons, Labels)


def SettingsMenu(ui: Gui) -> None:
    Button_GeneralSettingsMenu = Button(
        GVars.translations["general_settings_button"], ui.Button_GeneralSettingsMenu_func)
    Button_AdvancedSettingsMenu = Button(
        GVars.translations["advanced_settings_button"], ui.Button_AdvancedSettingsMenu_func)
    Button_AdminsMenu = Button(
        GVars.translations["admins_button"], ui.Button_AdminsMenu_func, (0, 255, 255))
    Button_LanguageMenu = Button(
        GVars.translations["languages_button"], ui.Button_LanguageMenu_func, (175, 75, 0))
    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)
    
    Buttons = [Button_GeneralSettingsMenu, Button_AdvancedSettingsMenu,
               Button_AdminsMenu, Button_LanguageMenu]

    if ui.DevMode:
        Button_HiddenSettings = Button(
            GVars.translations["dev_settings_button"], ui.Button_DevSettings_func)
        Buttons.append(Button_HiddenSettings)

    Buttons.append(Button_Back)

    return (Buttons, [])


def WorkshopMenu(ui: Gui) -> None:
    Button_GetWorkShopCommand = Button(
        GVars.translations["get_level_button"], ui.Button_GetWorkShopCommand_func)
    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)
    Text_WorkshopMenuInfo = Label(
        GVars.translations["workshop_menu_info"],
        color=(255, 234, 0),
        xPos=75, xEnd=1100, yPos=220)

    Buttons = [Button_GetWorkShopCommand, Button_Back]
    Labels = [Text_WorkshopMenuInfo]

    return (Buttons, Labels)


def ManualMountingMenu(ui: Gui) -> None:
    Button_ManualMount = Button(
        GVars.translations["mount_button"], ui.Button_ManualMount_func, (50, 255, 120), isAsync=True)
    Button_ManualUnmount = Button(
        GVars.translations["unmount_button"], ui.Button_ManualUnmount_func, (255, 50, 50), isAsync=True)
    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)

    Buttons = [Button_ManualMount, Button_ManualUnmount, Button_Back]

    return (Buttons, [])


def ResourcesMenu(ui: Gui) -> None:
    Button_GitHub = Button(
        GVars.translations["github_button"], ui.Button_GitHub_func, (255, 255, 255), isAsync=True)
    Button_Wiki = Button(
        GVars.translations["wiki_button"], ui.Button_Wiki_func, (115, 50, 145), isAsync=True)
    Button_Discord = Button(
        GVars.translations["discord_server_button"], ui.Button_Discord_func, (75, 75, 150), isAsync=True)
    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)

    Buttons = [Button_GitHub, Button_Wiki, Button_Discord, Button_Back]

    return (Buttons, [])


def TestingMenu(ui: Gui) -> None:
    Button_InputField = Button("User Input", ui.Button_InputField_func)
    PopupBox_Gui = Button("Popup Box", ui.PopupBox_test_func)
    Button_PrintToConsole = Button(
        "Print to Console", ui.Button_PrintToConsole_func)
    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)

    Text_TestMenuTextTest1 = Label(
        "DisplayText: All default settings")
    Text_TestMenuTextTest2 = Label(
        "DisplayText2: color=(52, 67, 235), yPos=600", color=(52, 67, 235), yPos=600)
    Text_TestMenuTextTest3 = Label(
        "DisplayText3: color=(214, 30, 17), xPos=600", color=(214, 30, 17), xPos=600)
    Text_TestMenuTextTest4 = Label(
        "DisplayText4: color=(143, 222, 24), xPos=600, yPos=600", color=(143, 222, 24), xPos=600, yPos=600)
    Text_TestMenuTextTest5 = Label(
        "DisplayText5: color=(255, 255, 0), xPos=600, xEnd=1900, yPos=300", color=(255, 255, 0), xPos=600, xEnd=1900, yPos=300)

    Labels = [Text_TestMenuTextTest1, Text_TestMenuTextTest2,
              Text_TestMenuTextTest3, Text_TestMenuTextTest4,
              Text_TestMenuTextTest5]
    Buttons = [Button_InputField, PopupBox_Gui,
               Button_PrintToConsole, Button_Back]

    return (Buttons, Labels)


def LanguageMenu(ui: Gui) -> None:

    Buttons: list[Button] = []
    Languages = BF.GetAvailableLanguages()

    for language in Languages:
        if GVars.configData["Active-Language"]["value"] == language:
            language = "→ " + language

        Buttons.append(Button(
            language, ui.Button_Language_func, (150, 150, 255)))

    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)

    Buttons.append(Button_Back)

    return (Buttons, [])


def SettingsSubMenu(ui: Gui, menu: str) -> None:

    Buttons: list[Button] = []
    for key in GVars.configData:
        if GVars.configData[key]["menu"] == menu:
            Buttons.append(ConfigButton(key, ui, menu))

    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)
    Buttons.append(Button_Back)

    return (Buttons, [])


def AdminsMenu(ui: Gui) -> None:
    CFG.ValidatePlayerKeys()

    PlayerKey: dict[str,
                    str] = GVars.configData["Players"]["value"][ui.CurrentSelectedPlayer]

    if GVars.configData["Dev-Mode"]["value"]:
        Log(f"Selected players key information: {PlayerKey}")

    # displays and changes the player name
    def Button_PlayerName_func() -> None:
        def AfterInputPlayerName(inp: str) -> None:
            Log("Saving player name: " + inp)
            CFG.EditPlayer(ui.CurrentSelectedPlayer, inp.strip())
            ui.CreateToast(GVars.translations["saved_toast"], 5, (75, 200, 75))
            ui.RefreshAdminsMenu()

        ui.GetUserInput(AfterInputPlayerName,
                        GVars.translations["players_enter_username"], PlayerKey["name"])

    playerName = Button(
        GVars.translations["players_name"] + PlayerKey["name"], Button_PlayerName_func, (255, 255, 120))

    # sets the steam id for the player
    def Button_PlayerSteamId_func() -> None:
        def AfterInputSteamID(inp: str) -> None:
            Log("Saving SteamID: " + str(inp))

            if not (inp.isdigit()):
                try:
                    # this is only useful if the user gives a steamID2
                    inp = Converter.to_steamID3(inp.strip())
                    # replace all [] with ""
                    inp = inp.replace("[", "").replace("]", "")
                    # only get everything after the last ":"
                    inp = inp.split(":")[-1]
                    ui.CreateToast(
                        GVars.translations["players_converted_steamid"], 5, (75, 120, 255))
                except Exception as e:
                    ui.CreateToast(
                        GVars.translations["players_invalid_steamid"], 5, (255, 50, 50))
                    Log(str(e))
                    return

            CFG.EditPlayer(ui.CurrentSelectedPlayer, steamId=inp)
            ui.CreateToast(GVars.translations["saved_toast"], 5, (75, 200, 75))
            ui.RefreshAdminsMenu()

        # ui.ChangeMenu(ui.BlankButton, append=True)
        ui.GetUserInput(
            AfterInputSteamID, GVars.translations["players_enter_steamid"], PlayerKey["steamid"])

    playerSteamId = Button(
        "SteamID: " + PlayerKey["steamid"], Button_PlayerSteamId_func, (255, 255, 120))

    # sets the admin level for th player
    def Button_AdminLevel_func() -> None:
        def AfterInputAdminLevel(inp: str) -> None:

            if not inp.isdigit():
                ui.CreateToast(
                    GVars.translations["players_admin_toast_not-a-number"], 5, (255, 50, 50))
                return

            if int(inp) > 6 or int(inp) < 0:
                ui.CreateToast(
                    GVars.translations["admin_level_toast_out-of-range"], 5, (255, 255, 50))
                return

            # here i'm converting to int then to str so it removes all the extra 0s on the left side (05 -> 5)
            CFG.EditPlayer(ui.CurrentSelectedPlayer, level=str(int(inp)))
            ui.CreateToast(GVars.translations["saved_toast"], 5, (75, 200, 75))
            Log("Saving admin level as " + str(inp))
            ui.RefreshAdminsMenu()

        # ui.ChangeMenu(ui.BlankButton, append=True)
        ui.GetUserInput(
            AfterInputAdminLevel, GVars.translations["players_admin-enter-admin-level"], PlayerKey["adminLevel"])

    adminLevel = Button(
        GVars.translations["players_admin_level"] + PlayerKey["adminLevel"], Button_AdminLevel_func, (255, 255, 120))

    # changes the view to the next player
    def Button_NextPlayer_func() -> None:

        if ui.CurrentSelectedPlayer < len(GVars.configData["Players"]["value"]) - 1:
            Log("Next player")
            ui.CurrentSelectedPlayer += 1
        else:
            Log("No more players")
            ui.CurrentSelectedPlayer = 0

        ui.RefreshAdminsMenu()
        ui.ChangeView(ui.AdminsMenu, False)

    nextPlayer = Button(
        GVars.translations["players_next_button"], Button_NextPlayer_func, (255, 255, 120))

    # adds a player to the list
    def Button_AddPlayer_func() -> None:

        Log("Adding blank player...")
        GVars.configData["Players"]["value"].append(CFG.DefaultPlayer)
        CFG.WriteConfigFile(GVars.configData)
        Log(str(len(GVars.configData["Players"]["value"]) - 1))
        ui.CurrentSelectedPlayer = len(
            GVars.configData["Players"]["value"]) - 1
        ui.RefreshAdminsMenu()

    addPlayer = Button(
        GVars.translations["players_add_player"], Button_AddPlayer_func, (120, 255, 120))

    # deletes a player from the list
    def Button_DeletePlayer_func() -> None:

        if len(GVars.configData["Players"]["value"]) <= 1:
            ui.CreateToast(
                GVars.translations["players_toast_must_be_at_least_one_player"], 5, (255, 50, 50))
            return

        Log("Deleting player...")
        CFG.DeletePlayer(ui.CurrentSelectedPlayer)
        ui.CurrentSelectedPlayer -= 1
        ui.RefreshAdminsMenu()

    deletePlayer = Button(
        GVars.translations["players_remove_player"], Button_DeletePlayer_func, (255, 50, 50))

    Button_Back = Button(
        GVars.translations["back_button"], ui.Button_Back_func)
    
    Text_SettingsAdminsText = Label(
        GVars.translations["settings_menu_admins_label"], color=(255, 234, 0), 
        xPos=40, xEnd=1000, yPos=620)

    ####################
    Buttons: list[Button] = []
    Buttons.append(playerName)
    Buttons.append(playerSteamId)
    Buttons.append(adminLevel)
    Buttons.append(nextPlayer)
    Buttons.append(addPlayer)
    Buttons.append(deletePlayer)
    Buttons.append(Button_Back)

    Labels: list[Label] = []
    Labels.append(Text_SettingsAdminsText)

    return (Buttons, Labels)