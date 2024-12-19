// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             █████╗ ██████╗ ███████╗██████╗ ██╗████████╗ ██████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ██║  ╚═╝██████╔╝█████╗  ██║  ██║██║   ██║   ╚█████╗
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝            ██║  ██╗██╔══██╗██╔══╝  ██║  ██║██║   ██║    ╚═══██╗
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗╚█████╔╝██║  ██║███████╗██████╔╝██║   ██║   ██████╔╝
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝ ╚════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚═════╝

// Set credits animations
// P-body animations
AnimationsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "noGun_airwalk", "noGun_airwalk", "portalgun_drowning", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

// Atlas animations
AnimationsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "portalgun_jump_spring", "portalgun_thrash_fall", "noGun_crouch_idle", "noGun_airwalk", "noGun_airwalk"]

// P-body animations out of tube
NOTubeAnimsPB <- ["taunt_laugh", "taunt_teamhug_idle", "noGun_crouch_idle", "taunt_face_palm", "taunt_selfspin", "taunt_pretzelwave", "layer_taunt_noGun_small_wave", "taunt_highFive_idle"]

// Atlas animations out of tube
NOTubeAnimsAL <- ["taunt_laugh", "taunt_laugh", "taunt_teamhug_initiate", "taunt_teamhug_noShow", "ballbot_taunt_rps_shake", "taunt_basketball2", "taunt_headspin", "taunt_facepalm", "taunt_shrug", "layer_taunt_trickfire_handstand", "noGun_crouch_idle"]

// Credit run counter
MPMCredits <- -1

// Script scope for the entity that runs the credits_coop.nut script in mp_coop_credits
// Allows us to directly add in our credits, that way the last 40ish Valve credits don't get cut off
creditScriptEntScope <- Entities.FindByName(null, "script_credits").GetScriptScope()

MPMCoopCreditNames <- [
    "",
    "",
    "--------------------------------",
    "[___________ Credits __________]",
    "[_ Portal 2: Multiplayer Mod: _]",
    "--------------------------------",
    "",
    "",
    "",
    "",
    "",
    "--------------------------------",
    "[____ P2:MM Head Creators: ____]",
    "--------------------------------",
    "VScript, Launcher, Community Manager, Plugin Support | Nanoman2525",
    "VScript, Launcher, Cooperative Support | kyleraykbs",
    "Script Theory | Bumpy",
    "Reverse Engineering, Plugin Support | Vista/NULLderef",
    "Singleplayer Support | Wolfe Strider Shooter",
    "Launcher | cabiste",
    "",
    "---------------------------------",
    "[_____ P2:MM Team Members: _____]",
    "---------------------------------",
    "Code Cleanup      |  Jeffrey",
    "Plugin Support    | wanderer",
    "Launcher, VScript |   Orsell",
    "",
    "---------------------------------",
    "[_____ P2:MM Contributors: _____]",
    "---------------------------------",
    "Playtesting | tnp/thewoodster75/\\n",
    "Speedrun Mode Ideas, Playtesting, French Translation | sear",
    "French Translation | Meb",
    "Mod Promotion | PieCreeper",
    "Italian Translation | thatwardrobeguy",
    "",
    "--------------------------------",
    "[_____ Special Thanks To: _____]",
    "--------------------------------",
    "Speedrun Mode Ideas | Dreadnox",
    "Python Ideas | Enator18",
    "Code Commenting | Blub/Vecc",
    "Alpha Stage Jumpstarter Code | Darnias",
    "Keys for P2:CE if we ever port the mod. | Mystical Ace",
    "",
    "-------------------------------",
    "[____ Honorable Mentions: ____]",
    "-------------------------------",
    "Panter | SuperSpeed",
    "Brawler | ThePineapple",
    "SuperSpeed | ANotSoSpookySkeleton",
    "",
    "",
    "",
    "---------------------------------",
    "  Thank you for playing our mod! ",
    "      We hope you enjoyed it!    ",
    "       working on for P2:MM!     ",
    "    see more cool stuff we are   ",
    "  Head on over to our Discord to ",
    "               :D                ",
    "---------------------------------",
    "",
    "",
    "",
    "",
    "",
    "--------------------------------",
    "[_______ Valve: Credits _______]",
    "--------------------------------",
]

// Set the amount of P-body animations
CRAnimationTypesPB <- -1
// foreach (value in AnimationsPB) {
//     CRAnimationTypesPB <- CRAnimationTypesPB + 1
// }

// Set the amount of Atlas animations
CRAnimationTypesAL <- -1
// foreach (value in AnimationsAL) {
//     CRAnimationTypesAL <- CRAnimationTypesAL + 1
// }

// Set the amount of credits
MPModCreditNumber <- -1
// foreach (value in MPMCoopCreditNames) {
//     MPModCreditNumber <- MPModCreditNumber + 1
// }

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Remove selected pods
        function CreditsRemovePod() {
            for (local ent = null; ent = Entities.FindByNameNearest("chamber*", Vector(-64, 217, 72), 180);) {
                ent.Destroy()
            }

            for (local ent = null; ent = Entities.FindByNameNearest("bubbles*", Vector(-64, 217, 72), 180);) {
                ent.Destroy()
            }
        }

        // Fix void camera glitch
        function FixCreditsCameras() {
            // Disable and destroy useless cameras
            EntFireByHandle(Entities.FindByName(null, "camera_SP"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera_O"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera_SP"), "kill", "", 0.1, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera_O"), "kill", "", 0.1, null, null)

            // Reload main camera with new params
            Entities.FindByName(null, "camera").__KeyValueFromString("target_team", "-1")
            EntFireByHandle(Entities.FindByName(null, "camera"), "disable", "", 0, null, null)
            EntFireByHandle(Entities.FindByName(null, "camera"), "enable", "", 0, null, null)
        }

        // Replace females with P-Bodys
        function CreditsSetModelPB(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            local tmpname = MPMCoopCreditNames[MPMCredits]
            printlP2MM(0, true, MPMCredits + " " + tmpname)

            if (tmpname.find("|") == null) {
                CreditsRemovePod()
                printlP2MM(0, true, "NO POD/ROBOT!!!!!! \"" + tmpname + "\"")
                EntFireByHandle(Entities.FindByNameNearest("female*", Vector(-64, 217, 72), 300), "disabledraw", "", 0, null, null) //! Somehow Valve broke this
                EntFire("stock_scanner_model", "AddOutput", "targetname disabled_stock_scanner_model", 0.5)
            } else {
                EntFire("disabled_stock_scanner_model", "AddOutput", "targetname stock_scanner_model")
            }
            
            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesPB)

            // Remove pod if needed
            HasRemovedPod <- false
            foreach (anim in NOTubeAnimsPB) {
                // This operation works only once hence the added break
                // For more optimizations the variable 'HasRemovedPod' is removed since it's not doing anything
                if (AnimationsPB[RandomAnimation] == anim && !HasRemovedPod) {
                    HasRemovedPod <- true
                    CreditsRemovePod()
                    break
                }
            }

            // Set model
            ent.SetModel("models/player/eggbot/eggbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(0, 0, 7.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsPB[RandomAnimation], 0, null, null)
        }

        // Replace males with Atlases
        function CreditsSetModelAL(ent) {
            FixCreditsCameras()

            // Count how many credits come on screen to change to humans
            MPMCredits <- MPMCredits + 1

            local tmpname = MPMCoopCreditNames[MPMCredits]
            printlP2MM(0, true, MPMCredits + " " + tmpname)

            if (tmpname.find("|") == null) {
                CreditsRemovePod()
                printlP2MM(0, true, "NO POD/ROBOT!!!!!! \"" + tmpname + "\"")
                EntFireByHandle(Entities.FindByNameNearest("male*", Vector(-64, 217, 72), 300), "disabledraw", "", 0, null, null) //! Somehow Valve broke this
                EntFire("stock_scanner_model", "AddOutput", "targetname disabled_stock_scanner_model", 0.5)
            } else {
                EntFire("disabled_stock_scanner_model", "AddOutput", "targetname stock_scanner_model")
            }

            // Preset animation
            local RandomAnimation = RandomInt(0, CRAnimationTypesAL)

            // Set model
            ent.SetModel("models/player/ballbot/ballbot.mdl")

            // Set color
            EntFireByHandle(ent, "Color", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)), 0, null, null)

            // Set position
            ent.SetOrigin(Vector(-10, 0, 25.5))

            // Set animation
            EntFireByHandle(ent, "setanimation", AnimationsAL[RandomAnimation], 0, null, null)

            // Remove pod if needed
            HasRemovedPod <- false
            foreach (anim in NOTubeAnimsAL) {
                // This operation works only once hence the added break
                // For more optimizations the variable 'HasRemovedPod' is removed since it's not doing anything
                if (AnimationsAL[RandomAnimation] == anim && !HasRemovedPod) {
                    HasRemovedPod <- true
                    CreditsRemovePod()
                    ent.SetOrigin(Vector(0, 0, 7.5))
                    break
                }
            }
        }

        // Set the amount of P-body animations
        foreach (value in AnimationsPB) {
            CRAnimationTypesPB <- CRAnimationTypesPB + 1
        }

        // Set the amount of Atlas animations
        foreach (value in AnimationsAL) {
            CRAnimationTypesAL <- CRAnimationTypesAL + 1
        }

        // Set the amount of credits
        foreach (value in MPMCoopCreditNames) {
            MPModCreditNumber <- MPModCreditNumber + 1
        }
        
        // Thanks to Hugo/hugobdesigner for helping figuring out how to get variables in different scopes
        // Directly add our credit list MPMCoopCreditNames to Valve's CreditsList
        // Doing this prevents the last 40ish entries of the Valve credits from getting cut off, because
        // the script that controls the credits counts the list of credits to determine when to end before
        // the P2:MM credits are added. Thus it ends before going through the whole list of credits.
        for (local i = MPMCoopCreditNames.len() - 1; i >= 0; i--) {
            local p2mmCredit = MPMCoopCreditNames[i];
            creditScriptEntScope.CreditsList.insert(0, p2mmCredit);
        }

        // Print out the whole updated credits list and other info
        foreach (name in creditScriptEntScope.CreditsList) {
            printlP2MM(0, true, name.tostring())
        }
        printlP2MM(0, true, "creditScriptEntScope.CreditsList.len(): " + creditScriptEntScope.CreditsList.len())
        printlP2MM(0, true, "creditScriptEntScope.m_nTotalNameCount: " + creditScriptEntScope.m_nTotalNameCount)
        printlP2MM(0, true, "creditScriptEntScope.MPModCreditNumber:" + creditScriptEntScope.MPModCreditNumber)
    }

    if (MSLoop) {
        // If mod credits aren't finished change humans to robots
        if (MPMCredits <= MPModCreditNumber) {
            // Change males to Atlases
            
            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male.mdl");) {
                CreditsSetModelAL(ent)
            }

            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male01.mdl");) {
                CreditsSetModelAL(ent)
            }

            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_male_02.mdl");) {
                CreditsSetModelAL(ent)
            }

            // Change females to P-bodys
            
            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_01.mdl");) {
                CreditsSetModelPB(ent)
            }

            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_02.mdl");) {
                CreditsSetModelPB(ent)
            }

            for (local ent = null; ent = Entities.FindByModel(ent, "models/props_underground/stasis_chamber_female_03.mdl");) {
                CreditsSetModelPB(ent)
            }
        } else {
            EntFire("disabled_stock_scanner_model", "AddOutput", "targetname stock_scanner_model")
        }

        // RAINBOW P-BODY!!!
        Entities.FindByName(null, "prop_orange_peek").__KeyValueFromString("rendercolor", (RandomInt(0, 255) + " " + RandomInt(0, 255) + " " + RandomInt(0, 255)))
    }
}