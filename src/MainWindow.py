import json
import os
import subprocess
import sys
import threading
import time
import webbrowser

import __main__
import pygame
from pygame.locals import *
import pygame.locals

import Scripts.BasicFunctions as BF
import Scripts.Configs as CFG
import Scripts.GlobalVariables as GVars
import Scripts.RunGame as RG
import Scripts.Updater as UP
import Scripts.Workshop as Workshop
import Scripts.Views as Views
import Scripts.PortalConsole as PCon
from Scripts.BasicLogger import Log, StartLog


from Models.LabelModel import Label
from Models.ButtonModel import Button
from Models.PopupBoxModel import PopupBox
from Models.ConfigButtonModel import ConfigButton

# set current directory to the directory of this file
os.chdir(os.path.dirname(os.path.abspath(__file__)))


class Gui:
    def __init__(self, devMode: bool) -> None:
        pygame.mixer.pre_init(channels=1)
        pygame.init()
        pygame.mixer.init()

        self.HoverSound = pygame.mixer.Sound("GUI/sounds/hoverSound.wav")
        self.HoverSound.set_volume(0.05)

        #! public variables
        self.CoolDown: int = 0
        self.CurInput: str = ""
        self.ToastList: list = []
        self.InputPrompt: str
        self.AdminsMenu: list = []
        self.PopupBox: PopupBox = None
        self.IsUpdating: bool = False
        self.AfterInputFunction = None
        self.SecAgo: float = time.time()
        self.SelectedPopupButtonIndex: int
        self.LookingForInput: bool = False
        self.CurrentSelectedPlayer: int = 0
        self.Views: list[function] = []

        # ##############################################
        # The resolution of the launcher when it opens.
        # Why the height is 800 is to accommodate the Steam Decks resolution if launching the launcher in Gaming Mode
        self.screen = pygame.display.set_mode((1280, 800), RESIZABLE)
        self.Clock = pygame.time.Clock()
        self.DevMode: bool = devMode
        self.Running: bool = True
        self.ShouldUpdateUi: bool = True
        self.FPS: int = 60

        # Set the launchers title and icon
        pygame.display.set_caption('Portal 2: Multiplayer Mod Launcher') 
        pygame.display.set_icon(pygame.image.load("GUI/images/p2mm-icon.ico").convert_alpha())  

        ###############################################################################

        self.ChangeView(Views.MainMenu)
        self.CurrentButtonsIndex: int = 0
        self.CurrentViewButtons: list[Button]
        self.CurrentViewLabels: list[Label]
        self.SelectedButton: Button = self.CurrentViewButtons[self.CurrentButtonsIndex]

    def PlaySound(self, sound: pygame.mixer.Sound) -> None:
        """Plays the launcher's sounds when hovering / clicking on a button
        Args:
            sound (pygame.mixer.Sound): the sound to play
        """

        LauncherSFX = GVars.configData["Launcher-SFX"]["value"]
        if LauncherSFX:
            pygame.mixer.Sound.play(sound)

#######################################################################

    def gradientRect(self, window: pygame.Surface, leftColor: tuple, rightColor: tuple, targetRectangle: pygame.Rect) -> None:
        color_rect = pygame.Surface((2, 2))  # tiny! 2x2 bitmap
        pygame.draw.line(color_rect, leftColor, (0, 0),
                         (0, 1))  # left color line
        pygame.draw.line(color_rect, rightColor, (1, 0),
                         (1, 1))  # right color line
        color_rect = pygame.transform.smoothscale(
            color_rect, (targetRectangle.width, targetRectangle.height))  # stretch!
        window.blit(color_rect, targetRectangle)

    def BackMenu(self) -> None:
        if len(self.Views) > 1:
            self.ChangeView(None, False)

    # the button to go to the previous menu
    def Button_Back_func(self) -> None:
        self.BackMenu()

    def RefreshAdminsMenu(self) -> None:
        self.ChangeView(Views.AdminsMenu, False)


    #!############################
    #! MAIN BUTTONS FUNCTIONS
    #!############################

    # Mounts and launches Portal 2

    def Button_LaunchGame_func(self) -> None:
        if self.CoolDown > 0:
            return

        self.CoolDown = int(3 * 60)
        RunGameScript()

    # Switches to the settings menu
    def Button_Settings_func(self) -> None:
        self.ChangeView(Views.SettingsMenu)

    # Checks for any updates for the launcher
    def Button_Update_func(self) -> None:
        if self.CoolDown > 0:
            return

        self.CoolDown = int(3 * 60)

        if not CheckForUpdates():
            self.CreateToast(
                GVars.translations["already_updated_toast"], 5, (200, 75, 220))

    # Switches to the manual mod mounting and unmounting menu
    def Button_ManualMode_func(self) -> None:
        self.ChangeView(Views.ManualMountingMenu)

    # Switches to the workshop menu, where you can get the changelevel command for workshop maps
    def Button_Workshop_func(self) -> None:
        self.ChangeView(Views.WorkshopMenu)

    # Switches to the resources menu, access to links to the GitHub Repo, P2MM Discord, etc
    def Button_ResourcesMenu_func(self) -> None:
        self.ChangeView(Views.ResourcesMenu)

    # Performs a clean close of the launcher, it will close down and unmount Portal 2 if it's open
    def Button_Exit_func(self) -> None:
        self.Running = False

    #!############################
    #! SETTINGS BUTTONS FUNCTIONS
    #!############################

    # Switches to the General Settings
    def Button_GeneralSettingsMenu_func(self) -> None:
        self.RefreshSettingsMenu("general")
    
    # Switches to the Advanced Settings
    def Button_AdvancedSettingsMenu_func(self) -> None:
        self.RefreshSettingsMenu("advanced")

    # Switches to the Player menu where you can add admins
    def Button_AdminsMenu_func(self) -> None:
        self.ChangeView(Views.AdminsMenu)

    # Switches to the Language menu where you can pick a language for the launcher
    def Button_LanguageMenu_func(self) -> None:
        self.ChangeView(Views.LanguageMenu)

    # Access to the launchers Developer settings
    def Button_DevSettings_func(self) -> None:
        self.RefreshSettingsMenu("dev")

    def RefreshSettingsMenu(self, menu: str, append: bool = True):
        self.ChangeView(lambda ui: Views.SettingsSubMenu(ui, menu), append)

    #!############################
    #! MANUAL MODE BUTTONS FUNCTIONS
    #!############################

    # Button to manually mount P2MM
    def Button_ManualMount_func(self) -> None:
        if self.CoolDown > 0:
            return

        self.CoolDown = int(3 * 60)
        MountModOnly()

    # Button to manually unmount P2MM
    def Button_ManualUnmount_func(self) -> None:
        if self.CoolDown > 0:
            return

        self.CoolDown = int(3 * 60)
        if UnmountScript():
            Ui.CreateToast(GVars.translations["unmounted_toast"], 5, (125, 0, 125))


    #!############################
    #! WORKSHOP BUTTONS FUNCTIONS
    #!############################

    # Get's the id from a map's url then copies the changelevel command to the clipboard
    def Button_GetWorkShopCommand_func(self) -> None:
        def AfterInput(input: str):
            map = Workshop.MapFromSteamID(input)

            if map is not None:
                clipboardOP = BF.ClipboardOperation("changelevel " + map, True)
                if clipboardOP == False:
                    self.CreateToast(
                        GVars.translations["xclip_needed_toast_copy"] if GVars.linuxSessionType == "x11"
                        else GVars.translations["wl-clipboard_needed_toast_copy"], 3, (255, 0, 255))
                    return
                self.CreateToast(
                        GVars.translations["workshop_changelevel_command_copied"], 3, (255, 0, 255))
                return

            self.CreateToast(
                GVars.translations["workshop_map_not_found"], 6, (255, 255, 0))

        self.GetUserInput(AfterInput, GVars.translations["workshop_link"])

    #!############################
    #! RESOURCES BUTTONS FUNCTIONS
    #!############################

    def Button_GitHub_func(self) -> None:
        # open the discord invite in the default browser
        webbrowser.open(
            "https://github.com/Portal-2-Multiplayer-Mod/Portal-2-Multiplayer-Mod")

    def Button_Wiki_func(self) -> None:
        # open the 2.0 series wiki in the default browser
        webbrowser.open(
            "https://github.com/Portal-2-Multiplayer-Mod/Portal-2-Multiplayer-Mod/wiki")

    def Button_Discord_func(self) -> None:
        # open the discord invite in the default browser
        webbrowser.open("https://discord.com/invite/kW3nG6GKpF")

    #!############################
    #! TESTING BUTTONS FUNCTIONS
    #!############################

    # a button for testing stuff

    def Button_Test_func(self) -> None:
        self.ChangeView(Views.TestingMenu)

#! END OF BUTTON FUNCTIONS

    def ChangeView(self, menu, append: bool = True):
        if menu is None and len(self.Views) > 1:
            self.Views.pop()
        elif append:
            self.Views.append(menu)

        if len(self.Views) < 1:
            print("no views :(")
        else:
            elements = self.Views[-1](self)

            self.CurrentViewButtons = elements[0]
            self.CurrentViewLabels = elements[1]

            self.CurrentButtonsIndex = 0
            self.SelectedButton = self.CurrentViewButtons[self.CurrentButtonsIndex]

    ####################

    # Test for input fields
    def Button_InputField_func(self) -> None:
        def AfterInput(input) -> None:
            self.CreateToast("Input: " + input, 3, (255, 255, 0))

        # self.ChangeMenu(self.BlankButton, append=True)
        self.GetUserInput(
            AfterInput, "As you can see this text can \n go onto another line :)")

    # Test for popup boxes
    def PopupBox_test_func(self) -> None:
        def YesInput() -> None:
            self.CreateToast("Let's go!!!", 3, (75, 255, 75))

        def NoInput() -> None:
            self.CreateToast("Bruh...", 3, (255, 75, 75))

        Button_Confirm = Button(
            GVars.translations["yes_toast"], YesInput, (75, 200, 75))
        Button_Decline = Button(
            GVars.translations["no_toast"], NoInput, (255, 75, 75))
        self.CreatePopupBox("Trolling Time!?!?!", "Have you given Cabiste an\nAneurysm today?",
                      [Button_Confirm, Button_Decline])

    # Test to print text to console
    def Button_PrintToConsole_func(self) -> None:
        print(self.Clock.get_fps())

    ################################

    def SelectAnimation(self, btn: Button, anim: str) -> None:
        if anim == "pop":
            btn.CurrentAnimation = "pop1"

    def RunAnimation(self, button: Button, anim: str) -> None:
        if anim == "pop1":
            if button.SizeMultiplier < 4:
                button.SizeMultiplier += 1
            else:
                button.CurrentAnimation = "pop2"
        if anim == "pop2":
            if button.SizeMultiplier > 1:
                button.SizeMultiplier -= 1
            else:
                button.SizeMultiplier = 1
                button.CurrentAnimation = ""

    # Displaying the "prompt" and "warning" fields when hovering over settings
    def DrawLabel(self, text: str, x: float = None, y: float = None, color: tuple = (255, 255, 255)) -> None:

        if x is None:
            x = self.screen.get_width() / 16
        if y is None:
            y = self.screen.get_height() / 16

        if (len(text) > 0):
            text = pygame.font.Font(GVars.translations["font"], int(int(
                int((int(self.screen.get_width() / 15) + int(self.screen.get_height() / 25)) / (len(text) * 0.1))))).render(text, True, color)
            if not self.LookingForInput:
                self.screen.blit(text, (x, y))

    def GetUserInput(self, action=None, prompt: str = "", preInput: str = "") -> None:

        Log("Getting user input...")

        self.LookingForInput = True
        self.CurInput = preInput

        self.InputPrompt = prompt
        self.AfterInputFunction = action

    def CreateToast(self, text: str, time: int = 3, color: tuple = (255, 75, 75)) -> None:
        Log(text)

        if "\n" not in text:
            self.ToastList.append([text, time, color])
            return

        # if the text has newlines, split it up
        text = text.split("\n")
        for i in range(0, len(text)):
            self.ToastList.append([text[i], time, color])

    def CreatePopupBox(self, title: str, text: str, buttons: list) -> None:

        # MANUAL #
        # title = "A String Title For The Box"
        # text = "A String Of Text To Display In The Box (use \n for newlines)"
        # buttons = [["Button Text", "Button Function"], ["Button Text", "Button Function"], etc, etc.....]
        ##########

        self.SelectedPopupButtonIndex = 0
        # PopupBox = [title, text, buttons]  # TITLE, TEXT, BUTTONS
        Log("Creating popup box... Tile: " + str(title) + " Text: " + text)
        self.PopupBox = PopupBox(title, text, buttons)
        self.ShouldUpdateUi = True

    # the language button (English, French, etc...)
    def Button_Language_func(self) -> None:
        lang: str = self.CurrentViewButtons[self.CurrentButtonsIndex].Text.replace(
            "→ ", "")
        Log("Language set: " + lang)
        CFG.EditConfig("Active-Language", lang)
        LoadTranslations()
        self.__init__(self.DevMode)
        self.CreateToast(GVars.translations["language_updated_toast"])

    ###############################################################################

    def DrawButtons(self):

        buttonIndex = 0
        W = self.screen.get_width()
        H = self.screen.get_height()

        shouldUpdate = False

        for button in self.CurrentViewButtons:
            buttonIndex += 1

            if button == self.SelectedButton:
                color = button.ActiveColor
            else:
                color = button.InactiveColor

            self.RunAnimation(button, button.CurrentAnimation)

            text = pygame.font.Font(
                GVars.translations["font"], button.Size + button.SizeMultiplier).render(button.Text, True, color)

            self.screen.blit(text, (W / button.xPos, (H / button.yPos -
                             (text.get_height() / 2)) * (buttonIndex / 5.6)))
            button.X = W / button.xPos
            button.Y = ((H / button.yPos) - (text.get_height() / 2)
                        ) * (buttonIndex / 5.6)
            button.Width = text.get_width()
            button.Height = text.get_height()

            if button.CurrentAnimation == "":
                shouldUpdate = True

        return shouldUpdate

    def DrawLabels(self):
        for label in self.CurrentViewLabels:
            text = pygame.font.Font(GVars.translations["font"], label.Size)

            # 2D array where each row is a list of words.
            words = [word.split(' ') for word in label.Text.splitlines()]
            space = text.size(' ')[0]  # The width of a space.
            max_width = label.xEnd
            x = label.xPos
            y = label.yPos
            # This code will wrap any text that goes off screen, thanks Stack Overflow for this :)
            for line in words:
                for word in line:
                    word_surface = text.render(word, True, label.Color)
                    word_width, word_height = word_surface.get_size()
                    if x >= max_width:
                        x = label.xPos  # Reset the x.
                        y += word_height  # Start on new row.
                    self.screen.blit(word_surface, (x, y))
                    x += word_width + space
                x = label.xPos  # Reset the x.
                y += word_height  # Start on a new row.

    def DrawInputBox(self):

        windowWidth = self.screen.get_width()
        windowHeight = self.screen.get_height()
        fntdiv: int = 32
        fontSize = int(windowWidth / fntdiv)
        mindiv = 25

        #! renders the horizontal ruler
        # "hr" for short, the line separating the input and the label
        horizontalRule = pygame.Surface((windowWidth / 1.5, windowWidth / 100))
        horizontalRule.fill((255, 255, 255))
        # tuple[X position, Y position]
        hrPosition = ((windowWidth - horizontalRule.get_width()) / 2, (windowHeight / 2))
        self.screen.blit(horizontalRule, hrPosition)

        #! renders the label under the ruler
        labels = self.InputPrompt.split("\n")
        for i in range(len(labels)):
            label = pygame.font.Font(GVars.translations["font"], int(fontSize/1.5)).render(labels[i], True, (255, 255, 255))
            position = ((windowWidth - label.get_width()) / 2), (hrPosition[1] + horizontalRule.get_height() + (windowWidth * 0.03 * (i+1)))

            self.screen.blit(label, position)

        #! renders user text
        # divide the CurrentInput into lines
        lines = []
        # every 25 characters, add a new line
        lines.append(self.CurInput[0:mindiv])
        for i in range(mindiv, len(self.CurInput), mindiv):
            lines.append(self.CurInput[i:i + mindiv])


        for i in range(len(lines)):
            InputText = pygame.font.Font(
                GVars.translations["font"], fontSize).render(lines[i], True, (255, 255, 175))
            # i can't believe i wrote this - cabiste
            position = (((windowWidth - InputText.get_width()) / 2),
                        (hrPosition[1] - horizontalRule.get_height() - (windowWidth * 0.04 * (len(lines) - i))))
            self.screen.blit(InputText, position)

    def DrawPopupBox(self):

        size = 1.25
        windowWidth = self.screen.get_width()
        windowHeight = self.screen.get_height()
        fntdiv: int = 32
        fontSize = int(windowWidth / fntdiv)

        #! draw the background box
        background = pygame.Surface((windowWidth / size, windowWidth / (size * 2)))
        background.fill((255, 255, 255))
        background.set_alpha(175)
        position = ((windowWidth - background.get_width()) / 2), ((windowHeight - background.get_height()) / 2)
        self.screen.blit(background, position)

        backgroundWidth = background.get_width()
        backgroundHeight = background.get_height()
        backgroundX = (windowWidth - backgroundWidth) / 2
        backgroundY = (windowHeight - backgroundHeight) / 2

        #! draw the title
        title = pygame.font.Font(GVars.translations["font"], fontSize).render(self.PopupBox.Title, True,
                                                                                    (255, 255, 0))
        titleWidth = title.get_width()
        titleHeight = title.get_height()
        titleX = backgroundX + ((backgroundWidth - titleWidth) / 2)
        titleY = backgroundY + (titleHeight / 2)
        self.screen.blit(title, (titleX, titleY))

        #! draw the body text
        texts = self.PopupBox.Body.split("\n")
        for i in range(len(texts)):
            text = pygame.font.Font(
                GVars.translations["font"], int(fontSize / 1.5)).render(texts[i], True, (0, 0, 0))
            textWidth = text.get_width()
            textHeight = text.get_height()
            textX = backgroundX + ((backgroundWidth - textWidth) / 2)
            textY = backgroundY + (titleHeight * 2) + (textHeight * i)
            self.screen.blit(text, (textX, textY))

        #! draw the buttons
        buttonNumbers = len(self.PopupBox.Buttons)
        buttonIndex = 0
        for button in self.PopupBox.Buttons:
            buttonSurface = pygame.surface.Surface(
                ((backgroundWidth / buttonNumbers) / 1.2, (backgroundHeight / 5)))

            if (button == self.PopupBox.Buttons[self.SelectedPopupButtonIndex]):
                buttonSurface.fill(button.ActiveColor)
            else:
                buttonSurface.fill(button.InactiveColor)

            buttonSurfaceWidth = buttonSurface.get_width()
            buttonSurfaceHeight = buttonSurface.get_height()
            buttonSurfaceX = backgroundX + (backgroundWidth / buttonNumbers) * buttonIndex + (((backgroundWidth / buttonNumbers) - buttonSurfaceWidth) / 2)

            buttonSurfaceY = backgroundY + backgroundHeight - (backgroundHeight / 4)
            button.X = buttonSurfaceX
            button.Y = buttonSurfaceY
            button.Width = buttonSurfaceWidth
            button.Height = buttonSurfaceHeight
            self.screen.blit(buttonSurface, (buttonSurfaceX, buttonSurfaceY))

            text = pygame.font.Font(GVars.translations["font"], int(
                fontSize / 1.5)).render(button.Text, True, (255, 255, 255))
            textWidth = text.get_width()
            textHeight = text.get_height()
            textX = backgroundX + (backgroundWidth / buttonNumbers) * buttonIndex + (((backgroundWidth / buttonNumbers) - textWidth) / 2)
            textY = backgroundY + backgroundHeight - (backgroundHeight / 5) + (textHeight / 2)
            self.screen.blit(text, (textX, textY))
            buttonIndex += 1

    def DrawToasts(self):
        windowWidth = self.screen.get_width()
        windowHeight = self.screen.get_height()

        index = 0
        for toast in self.ToastList:
            index += 1
            toastText = pygame.font.Font(GVars.translations["font"], int((windowWidth / 60) + (windowHeight / 85))).render(toast[0], True, toast[2])
            position = (windowWidth / 30, ((toastText.get_height() * (len(self.ToastList)-index)) * -1) + (windowHeight / 1.05))
            self.screen.blit(toastText, position)

            # every 1 second go through each error and remove it if it's been there for more than 1 second
            if (time.time() - self.SecAgo) > 1:
                if (toast[1] < 0):
                    self.ToastList.remove(toast)
                toast[1] -= 1
                self.SecAgo = time.time()

    def UpdateUi(self) -> bool:
        W = self.screen.get_width()
        H = self.screen.get_height()

        self.screen.fill((0, 0, 0))
        self.gradientRect(self.screen, (0, 2, 10), (2, 2, 10), pygame.Rect(
            0, 0, self.screen.get_width(), self.screen.get_height()))

        shouldUpdate = False

        # Displaying button icons for keyboard inputs or Steam Deck controller inputs
        if (not self.LookingForInput):
            if GVars.iosd:
                sdButtons = pygame.image.load("GUI/images/sdButtons.png").convert_alpha()
                sdButtons = pygame.transform.scale(sdButtons, (W / 10, W / 10))
                self.screen.blit(
                    sdButtons, ((W / 1.03) - sdButtons.get_width(), H / 1.22))
            else:
                # Puts assets/images/keys.png on the bottom right corner of the screen
                keys = pygame.image.load("GUI/images/keys.png").convert_alpha()
                keys = pygame.transform.scale(keys, (W / 10, W / 10))
                self.screen.blit(
                    keys, ((W / 1.03) - keys.get_width(), H / 1.22))

        # For showing the button to press to get up the on-screen keyboard on Steam Deck
        if (self.LookingForInput and GVars.iosd):
            keyboardButton = pygame.image.load("GUI/images/sdKeyboard.png").convert_alpha()
            keyboardButton = pygame.transform.scale(keyboardButton, (W / 10, W / 10))
            self.screen.blit(keyboardButton, ((W / 1.01) - keyboardButton.get_width(), H / 1.22))
            pasteButton = pygame.image.load("GUI/images/sdClipboard.png").convert_alpha()
            pasteButton = pygame.transform.scale(pasteButton, (W / 12, W / 17))
            self.screen.blit(pasteButton, ((W / 1.11) - pasteButton.get_width(), H / 1.15))

        if self.LookingForInput:
            self.DrawInputBox()
            return

        if self.PopupBox is not None:
            self.DrawPopupBox()
            return

        if len(self.CurrentViewLabels) > 0:
            self.DrawLabels()

        if len(self.CurrentViewButtons) > 0:
            shouldUpdate = self.DrawButtons()

        if len(self.ToastList) > 0:
            self.DrawToasts()

        if type(self.SelectedButton) is ConfigButton:
            self.SelectedButton.Hovered(self)

        return shouldUpdate

    def Main(self) -> None:
        # make the screen a gradient

        lastBackspace = 0
        lastWindowWidth = 0
        lastWindowHeight = 0
        lastToast = False

        while self.Running:
            mouse = pygame.mouse.get_pos()
            mouseX = mouse[0]
            mouseY = mouse[1]

            self.Clock.tick(self.FPS)

            if self.ShouldUpdateUi:
                self.ShouldUpdateUi = self.UpdateUi()
                pygame.display.update()

            if self.CoolDown > 0:
                self.CoolDown -= 1

            if lastToast:
                self.ShouldUpdateUi = True
            lastToast = len(self.ToastList) > 0 # fixes UI not updating when toasts are removed

            if (lastWindowWidth != self.screen.get_width()) or (lastWindowHeight != self.screen.get_height()):
                lastWindowWidth = self.screen.get_width()
                lastWindowHeight = self.screen.get_height()
                self.ShouldUpdateUi = True

            # so you can hold backspace to delete
            if self.LookingForInput:
                BACKSPACE_HELD = pygame.key.get_pressed()[pygame.K_BACKSPACE]
                if BACKSPACE_HELD:
                    lastBackspace += 0.25
                # if its been a second since the last backspace, delete the last character
                if (lastBackspace >= 1):
                    if (len(self.CurInput) > 0):
                        self.CurInput = self.CurInput[:-1]
                        self.ShouldUpdateUi = True
                    lastBackspace = 0

            for event in pygame.event.get():
                if event.type == QUIT:
                    self.Running = False

                if self.LookingForInput:
                    CTRL_HELD = pygame.key.get_mods() & pygame.KMOD_CTRL
                    SHIFT_HELD = pygame.key.get_mods() & pygame.KMOD_SHIFT

                    if event.type == pygame.KEYDOWN:
                        self.ShouldUpdateUi = True

                        if event.key == pygame.locals.K_SPACE:
                            self.CurInput += " "
                        # In order to delete characters for input prompts on Steam Deck
                        elif (event.key == 8) and GVars.iosd:
                            if (len(self.CurInput) > 0):
                                self.CurInput = self.CurInput[:-1]
                        elif event.key in [pygame.locals.K_RETURN, pygame.locals.K_KP_ENTER]:
                            self.LookingForInput = False
                            self.AfterInputFunction(self.CurInput)
                        elif event.key == pygame.locals.K_ESCAPE:
                            self.LookingForInput = False
                        elif event.key == pygame.locals.K_TAB:
                            self.CurInput += "    "
                        # Pasting for systems, first part is for pasting on Steam Deck using the right arrow button on the on-screen keyboard, second part is for keyboards
                        elif ((event.key == 4 or 1073741903) and GVars.iosd) or ((CTRL_HELD and event.key == pygame.locals.K_v) and not GVars.iosd):
                            try:
                                pastedString = BF.ClipboardOperation(copy=False)
                                if pastedString == False:
                                    self.CurInput += GVars.translations["xclip_needed_paste_msg"] if GVars.linuxSessionType == "x11" else GVars.translations["wl-clipboard_needed_paste_msg"]
                                    Log("Linux systems clipboard shell commands were not detected!")
                                    Log("xclip for X11 and wl-clipboard for Wayland!")
                                else:
                                    self.CurInput += pastedString
                                    Log(f"Pasted: {pastedString}")
                            except Exception as e:
                                self.CurInput += "Error pasting, check log..."
                                Log(str(e))
                                pass
                        name = pygame.key.name(event.key)
                        if len(name) == 1 and not CTRL_HELD:
                            if SHIFT_HELD:
                                # if the name doesn't contain a letter
                                if not name.isalpha():
                                    name = name.replace("1", "!").replace("2", "@").replace("3", "#").replace("4",
                                                                                                              "$").replace(
                                        "5", "%").replace("6", "^").replace("7", "&").replace("8", "*").replace("9",
                                                                                                                "(").replace(
                                        "0", ")").replace("`", "~").replace("-", "_").replace("=", "+").replace("[",
                                                                                                                "{").replace(
                                        "]", "}").replace("\\", "|").replace(";", ":").replace("'", "\"").replace(",",
                                                                                                                  "<").replace(
                                        ".", ">").replace("/", "?")
                                # convert lowercase to uppercase
                                else:
                                    name = name.upper()
                                self.CurInput += name
                            else:
                                self.CurInput += name
                        # support for numpad
                        elif len(name) == 3:
                            self.CurInput += name[1]
                    continue

                #* POPUP BOX navigation
                if self.PopupBox is not None:
                    buttonLength = len(self.PopupBox.Buttons)

                    # change selected button on hover or execute on click
                    for i, button in enumerate(self.PopupBox.Buttons):
                        if ((button.X <= mouseX <= button.X + button.Width) and (button.Y <= mouseY <= button.Y + button.Height)):

                            if i != self.SelectedPopupButtonIndex:
                                self.SelectedPopupButtonIndex = i
                                self.PlaySound(button.HoverSound)
                                self.ShouldUpdateUi = True

                            if event.type == MOUSEBUTTONDOWN:
                                if button.function is not None:
                                    button.function()
                                self.PopupBox = None
                                self.ShouldUpdateUi = True

                    if event.type == KEYDOWN:
                        if event.key == K_RIGHT:
                            self.SelectedPopupButtonIndex = (self.SelectedPopupButtonIndex +1) % buttonLength
                            self.ShouldUpdateUi = True

                        elif event.key == K_LEFT:
                            self.SelectedPopupButtonIndex = (self.SelectedPopupButtonIndex -1) % buttonLength
                            self.ShouldUpdateUi = True

                        elif event.key == K_SPACE or event.key == K_RETURN:
                            self.PopupBox.Buttons[self.SelectedPopupButtonIndex].function()
                            self.PopupBox = None
                            self.ShouldUpdateUi = True

                        if event.key == K_ESCAPE:
                            self.PopupBox = None
                            self.ShouldUpdateUi = True
                    continue

                # NORMAL INPUT
                if (not self.LookingForInput):
                    # Leaving this here for testing inputs when not in a input prompt
                    # Too many log messages to have for a Developer Mode thing
                    # print(f"event: {event}")
                    # print(f"event.type: {event.type}")
                    # print(f"event.dict: {event.dict}")
                    if event.type == KEYDOWN:
                        self.ShouldUpdateUi = True
                        # print(f"event.key: {event.key}")
                        if event.key in [K_ESCAPE, K_BACKSPACE]:
                            self.BackMenu()
                        elif event.key in [K_DOWN, K_s]:
                            if self.CurrentButtonsIndex < len(self.CurrentViewButtons) - 1:
                                self.CurrentButtonsIndex += 1
                                self.SelectedButton = self.CurrentViewButtons[self.CurrentButtonsIndex]
                                self.PlaySound(self.SelectedButton.HoverSound)
                            else:
                                self.CurrentButtonsIndex = 0
                                self.SelectedButton = self.CurrentViewButtons[self.CurrentButtonsIndex]
                                self.PlaySound(self.SelectedButton.HoverSound)
                        elif event.key in [K_UP, K_w]:
                            if self.CurrentButtonsIndex > 0:
                                self.CurrentButtonsIndex -= 1
                                self.SelectedButton = self.CurrentViewButtons[self.CurrentButtonsIndex]
                                self.PlaySound(self.SelectedButton.HoverSound)
                            else:
                                self.CurrentButtonsIndex = len(
                                    self.CurrentViewButtons) - 1
                                self.SelectedButton = self.CurrentViewButtons[self.CurrentButtonsIndex]
                                self.PlaySound(self.SelectedButton.HoverSound)
                        # On Steam Deck, for some reason the Y button also acts as a enter key,
                        # but for logic sake the A button is going to also be used
                        elif event.key in [K_SPACE] or event.key == 13:
                            if self.SelectedButton.function:
                                if self.SelectedButton.isAsync:
                                    threading.Thread(
                                        target=self.SelectedButton.function).start()
                                else:
                                    self.SelectedButton.function()
                            self.SelectAnimation(
                                self.SelectedButton, self.SelectedButton.ClickAnimation)
                            self.PlaySound(self.SelectedButton.ClickSound)

                # changes the `SelectedButton` and the `CurrentButtonsIndex` to the button the mouse is on
                if event.type == pygame.MOUSEMOTION:
                    for button in self.CurrentViewButtons:
                        if (mouseX > button.X and mouseX < button.X + button.Width) and (mouseY > button.Y and mouseY < button.Y + button.Height):
                            if button != self.SelectedButton:
                                self.SelectedButton = button
                                self.CurrentButtonsIndex = self.CurrentViewButtons.index(
                                    button)
                                self.PlaySound(self.HoverSound)
                            self.ShouldUpdateUi = True

                # LMB
                # executes the button's function on left mouse click IF the mouse is above the button
                if event.type == pygame.MOUSEBUTTONDOWN:
                    if event.button == 1:
                        button = self.SelectedButton
                        if (mouseX > button.X and mouseX < button.X + button.Width) and (mouseY > button.Y and mouseY < button.Y + button.Height):
                            self.ShouldUpdateUi = True
                            if self.SelectedButton.function:
                                if self.SelectedButton.isAsync:
                                    threading.Thread(
                                        target=self.SelectedButton.function).start()
                                else:
                                    self.SelectedButton.function()

                            self.SelectAnimation(
                                self.SelectedButton, self.SelectedButton.ClickAnimation)

                            self.PlaySound(self.SelectedButton.ClickSound)


        PreExit()

        pygame.quit()
        os._exit(0)


    def ClientUpdateBox(self, update: str):
        YesButton = Button(
        GVars.translations["yes_toast"], lambda: UpdateModClient(update), (75, 200, 75))
        NoButton = Button(
            GVars.translations["no_toast"], activeColor=(255, 75, 75))

        self.CreatePopupBox(GVars.translations["update_available"],
                GVars.translations["update_client_text"], [YesButton, NoButton])

    def NewClientNotifyPopup(self) -> None:
        OkButton = Button(
            GVars.translations["ok_toast"], activeColor=(75, 200, 75))

        self.CreatePopupBox(GVars.translations["update_available"], GVars.translations["update_available_description"], [OkButton])

    def ModFilesUpdateBox(self) -> None:
        YesButton = Button(
            GVars.translations["yes_toast"], UpdateModFiles, (75, 200, 75))
        NoButton = Button(
            GVars.translations["no_toast"], activeColor=(255, 75, 75))

        self.CreatePopupBox(GVars.translations["update_available"],
                    GVars.translations["update_modFiles_text"], [YesButton, NoButton])

    def ConfigResetNotice(self):
        OkButton = Button(
            GVars.translations["ok_toast"], activeColor=(75, 255, 75))
        self.CreatePopupBox(GVars.translations["launcher_config_reset"],
                    GVars.translations["launcher_had_to_reset"], [OkButton])

    def LinuxClipboardCommandsCheck(self):
        if BF.CheckForClipboardCommandsLinux() == False:
            Log("Linux systems clipboard shell commands were not detected!")
            Log("xclip for X11 and wl-clipboard for Wayland!")

            OkButton = Button(
                GVars.translations["ok_toast"], activeColor=(75, 255, 75))
            
            self.CreatePopupBox(
                GVars.translations["xclip_wl-clipboard_not_found_title"],
                GVars.translations["xclip_not_found_description"] if GVars.linuxSessionType == "x11"
                else GVars.translations["wl-clipboard_not_found_description"], [OkButton])

    def DownloadModFilesPopup(self):
        def YesInput():
            Log("User agreed to download the ModFiles! Fetching mod...")
            if not UP.HasInternet():
                self.CreateToast(
                    GVars.translations["no_internet_toast"], 5, (255, 75, 75))
                return False
            UpdateModFiles()

        def NoInput():
            Log("User cancelled downloading the ModFiles...")
            self.CreateToast(GVars.translations["game_launch_cancel"], 5)
            return False

        YesButton = Button(
            GVars.translations["yes_toast"], YesInput, (75, 200, 75))

        NoButton = Button(
            GVars.translations["no_toast"], NoInput, (255, 0, 0))

        self.CreatePopupBox(GVars.translations["modfiles_ask_download"],
                    GVars.translations["modfiles_not_found"], [YesButton, NoButton])
# !######################################################
# !                       Logic
# !######################################################


def PreExit() -> None:
    Log("Shutting down the P2MM launcher...")
    Log("Shutting down Portal 2...")
    # Windows
    if (GVars.iow):
        # for hiding the cmd window on windows
        si = subprocess.STARTUPINFO()
        si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        subprocess.call("cmd /c taskkill /f /im portal2.exe", startupinfo=si)

    # Linux and Steam Deck/Steam OS 3.0
    if (GVars.iol) or (GVars.iosd):
        os.system("killall -9 portal2_linux")

    # This waits to make sure the Portal 2 thread is dead
    # 1 second should be enough for it to die
    time.sleep(1)
    Log("Portal 2 has been shutdown...")

    # Make sure the P2MM ModFiles are unmounted from Portal 2
    if (GVars.configData["Auto-Unmount"]["value"]):
        Log("Unmounting P2MM's ModFiles from Portal 2...")
        UnmountScript(False)
        Ui.CreateToast(GVars.translations["unmounted_toast"], 5, (125, 0, 125))
        Log("Unmounted P2MM's ModFiles from Portal 2...")

    Log("The P2MM launcher has been shutdown...")


def GetGamePath() -> None:
    tempPath = BF.TryFindPortal2Path()

    if tempPath:
        CFG.EditConfig("Portal2-Path", tempPath.strip())
        Log("Saved '" + tempPath.strip() + "' as the game path!")
        Ui.CreateToast(
            GVars.translations["game_path_found_toast"], 5, (255, 255, 75))
        VerifyGamePath(False)
        return

    def AfterInputGP(inp) -> None:
        CFG.EditConfig("Portal2-Path", inp.strip())
        Log("Saved '" + inp.strip() + "' as the game path!")
        Ui.CreateToast(
            GVars.translations["game_path_saved_toast"], 5, (75, 200, 75))
        VerifyGamePath(False)

    Ui.GetUserInput(AfterInputGP, GVars.translations["game_path_enter_path"])


def VerifyGamePath(shouldGetPath: bool = True) -> bool:
    Log("Verifying game path...")
    gamePath = GVars.configData["Portal2-Path"]["value"]

    if not os.path.exists(gamePath):
        Ui.CreateToast(GVars.translations["game_path-is-invalid"])

        if shouldGetPath:
            Ui.CreateToast(
                GVars.translations["game_path-attempt-to-fetch"], 5, (255, 255, 75))
            GetGamePath()

        return False
    Log("Game path is valid...")
    return True


def VerifyModFiles() -> bool:
    Log("Searching for ModFiles in: " + GVars.modFilesPath)

    localIDPath = f"{GVars.modPath}{os.sep}ModFiles{os.sep}Portal 2{os.sep}install_dlc{os.sep}"
    if GVars.configData["Dev-Mode"]["value"]:
        print("localIDPath and which identifier file exists?")
        print(localIDPath)
        print(localIDPath + "p2mm.identifier: " + str(os.path.exists(localIDPath + "p2mm.identifier")))

    if (os.path.exists(GVars.modFilesPath)) and (os.path.exists(localIDPath + "p2mm.identifier")):
        Log("ModFiles found!")
        return True

    Log("ModFiles not found!")
    return False


def MountModOnly() -> bool:
    CFG.ValidatePlayerKeys()

    if Ui.IsUpdating:
        Ui.CreateToast(
            GVars.translations["update_inProgress_toast"], 5, (255, 75, 75))
        return False

    if not VerifyGamePath(False):
        Ui.CreateToast(GVars.translations["game_path_undefined_fetch"], 5)
        GetGamePath()
    
    if RG.Portal2Running():
        Log("Can't mount because game is currently running!")
        Ui.CreateToast(GVars.translations["mount_gamerunning_toast"], 5)
        return

    Ui.CreateToast(GVars.translations["mounting_mod"], 5, (75, 255, 75))

    # Remove current console.log
    path = BF.NormalizePath(GVars.configData['Portal2-Path']['value'] + "/portal2/console.log")
    if os.path.exists(path) and os.path.isfile(path):
        BF.DeleteFile(path)

    # Need to make sure the game path is in fact defined, if not P2MM will not be run/mounted
    gamePath = GVars.configData["Portal2-Path"]["value"]
    if ("undefined" in gamePath):
        Ui.CreateToast(
            GVars.translations["mount_nopath_toast"], 5, (255, 21, 0))
        return False

    # Check if both of Portal 2's DLC folders exist
    if not RG.CheckForRequiredDLC(gamePath):
        Ui.CreateToast(
            GVars.translations["mount_nodlc_toast"], 5, (255, 21, 0))
        return False

    if VerifyModFiles():
        RG.MountMod(gamePath)
        Ui.CreateToast(GVars.translations["mounted"], 5, (75, 255, 75))
        return True

    # If the they are not a developer and the ModFiles don't exist ask them to download the files from the repo
    if (os.path.exists(GVars.modPath + os.sep + "ModFiles")):
        BF.DeleteFolder(GVars.modPath + os.sep + "ModFiles")

    Ui.DownloadModFilesPopup()


def LoadTranslations() -> None:

    langPath = f"Languages/{GVars.configData['Active-Language']['value']}.json"

    if not os.path.exists(langPath):
        langPath = GVars.modPath + os.sep + \
            f"Languages/{GVars.configData['Active-Language']['value']}.json"

    if not os.path.exists(langPath):
        CFG.EditConfig("Active-Language",
                       CFG.DefaultConfig["Active-Language"]["value"])
        langPath = f"Languages/{GVars.configData['Active-Language']['value']}.json"

    GVars.translations = json.load(
        open(langPath, "r", encoding="utf8"))


def UpdateModFiles() -> None:
    PreExit()
    Ui.CreateToast(GVars.translations["update_fetching"], 5000, (255, 150, 75))

    def UpdateThread() -> None:
        Log("Updating...")
        Ui.IsUpdating = True
        UP.DownloadNewFiles()
        Ui.CreateToast(
            GVars.translations["update_complete_toast"], 5, (75, 255, 75))
        Ui.IsUpdating = False
        for thing in Ui.ToastList:
            if thing[0] == GVars.translations["update_fetching"]:
                Ui.ToastList.remove(thing)

    threading.Thread(target=UpdateThread).start()


def UpdateModClient(data: dict) -> None:
    PreExit()
    Ui.CreateToast(
        GVars.translations["updating_client_toast"], 5000, (255, 150, 75))

    def UpdateThread() -> None:
        Log("Updating client...")
        Ui.IsUpdating = True

        if not UP.DownloadClient(data["newRepo"]):
            Ui.CreateToast(
                GVars.translations["update_failed_toast"])
            return

        Ui.Running = False
        Log("Ui.Running set to false!")

    threading.Thread(target=UpdateThread).start()


def RunGameScript() -> None:
    MMO = MountModOnly()
    if MMO:
        gamePath = GVars.configData["Portal2-Path"]["value"]
        args = RG.AssembleArgs()
        if not args:
            Ui.CreateToast(GVars.translations["args-error"], 5)
            RG.LaunchGame(gamePath, "-novid -allowspectators -nosixense -conclearlog -condebug -usercon")
        else:
            RG.LaunchGame(gamePath, args)
            Ui.CreateToast(GVars.translations["game_launched"], 5, (75, 255, 75))
    elif MMO == False:
        Ui.CreateToast(GVars.translations["game_path_undefined_fetch"], 5)
        GetGamePath()
    else:
        Ui.CreateToast(GVars.translations["game_already_launched"], 5)


def UnmountScript(shouldGetPath: bool = True) -> bool:
    if RG.Portal2Running():
        Log("Can't unmount because game is currently running!")
        Ui.CreateToast(GVars.translations["mount_gamerunning_toast"], 5)
        return False
    
    Log("___Unmounting Mod___")
    VerifyGamePath(shouldGetPath)
    gamePath = GVars.configData["Portal2-Path"]["value"]
    RG.DeleteP2MMDLC(gamePath)
    Log("____DONE UNMOUNTING____")
    return True


def RestartClient(path: str = sys.executable) -> None:
    if (GVars.iol) or (GVars.iosd):
        os.system("chmod +x " + path)

    subprocess.Popen(path, shell=True)
    Log("Restarting client!")
    Ui.Running = False


# checks if the client was downloaded by a previous version of itself
def IsNew() -> None:
    # Two arguments are passed when the client updates
    # 1- the word "updated"
    # 2- the path of the previous version
    # argument 0 is always the command to start the app so it is not needed

    if len(sys.argv) != 3:
        return

    if (sys.argv[1] != "updated") or (not os.path.exists(sys.argv[2])):
        return

    Log("This is first launch after a successful update...")

    Log("Deleting old client...")
    os.remove(sys.argv[2])

    # this will rename the new client to the old client's name
    Log("Renaming new client...")
    os.rename(GVars.executable, sys.argv[2])
    RestartClient("\"" + sys.argv[2] + "\"")


def ClientUpdateBox(update: dict) -> None:
    Ui.ClientUpdateBox(update)


def NewClientNotifyPopup() -> None:
    Ui.NewClientNotifyPopup()


def ModFilesUpdateBox() -> None:
    Ui.ModFilesUpdateBox()


def CheckForUpdates() -> bool:
    Log("Checking for updates...")
    clientUpdate = UP.CheckForNewClient()

    if clientUpdate["status"]:
        if clientUpdate["newRepo"] and (GVars.iol or GVars.iosd):
            NewClientNotifyPopup()
        else:
            ClientUpdateBox(clientUpdate)
        return True

    if UP.CheckForNewFiles():
        ModFilesUpdateBox()
        return True

    return False


def Initialize() -> None:
    # Load the global variables
    GVars.init()
    # do the fancy log thing
    StartLog()
    # load the config file into memory
    GVars.LoadConfig()
    # load the client's GVars.translations
    LoadTranslations()

    # remove old download temp files
    if (os.path.exists(GVars.modPath + os.sep + ".temp")):
        BF.DeleteFolder(GVars.modPath + os.sep + ".temp")

    # checks if this is a dev or release build
    if sys.argv[0].endswith(".py"):
        Log("Running through Python! Not checking for updates!")
        return

    IsNew()  # Check for first time setup after update


def PostInitialize() -> None:
    # only check for updates if the user is not running from source
    if not sys.argv[0].endswith(".py"):
        CheckForUpdates()

    if VerifyGamePath():
        if RG.Portal2Running():
            Log("Can't unmount because game is currently running!")
        else:
            RG.DeleteP2MMDLC(GVars.configData["Portal2-Path"]["value"])

    def NewAfterFunction() -> None:
        Ui.CreateToast(GVars.translations["game_exited"], 5, (125, 0, 125))
        if (GVars.configData["Auto-Unmount"]["value"]):
            UnmountScript()
            Ui.CreateToast(
                GVars.translations["unmounted_toast"], 5, (125, 0, 125))
        PCon.WriteConsoleToLog()

    GVars.AfterFunction = NewAfterFunction

    if (GVars.HadToResetConfig):
        Log("Config has been reset to default settings!")
        Ui.ConfigResetNotice()

    # If on a Linux system, check if xcopy (X11) or wl-clipboard (Wayland) are available
    if (GVars.iol or GVars.iosd):
        Ui.LinuxClipboardCommandsCheck()


if __name__ == '__main__':
    Initialize()
    Ui = Gui(GVars.configData["Dev-Mode"]["value"])
    PostInitialize()
    Ui.Main()