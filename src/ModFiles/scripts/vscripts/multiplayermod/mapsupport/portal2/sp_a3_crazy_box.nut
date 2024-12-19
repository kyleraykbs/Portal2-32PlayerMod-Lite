//  ██████╗██████╗             █████╗ ██████╗             █████╗ ██████╗  █████╗ ███████╗██╗   ██╗           ██████╗  █████╗ ██╗  ██╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗██╔══██╗╚════██║╚██╗ ██╔╝           ██╔══██╗██╔══██╗╚██╗██╔╝
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██║  ╚═╝██████╔╝███████║  ███╔═╝ ╚████╔╝            ██████╦╝██║  ██║ ╚███╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██║  ██╗██╔══██╗██╔══██║██╔══╝    ╚██╔╝             ██╔══██╗██║  ██║ ██╔██╗
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝██║  ██║██║  ██║███████╗   ██║   ██████████╗██████╦╝╚█████╔╝██╔╝╚██╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════════╝╚═════╝  ╚════╝ ╚═╝  ╚═╝

WaitDontFizzleTime <- 0
WaitDontFizzle <- false
isopen <- false
rollang <- 0
movecube <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // 2231.027100 187.758835 -386.163635;
         GlobalSpawnClass.m_bUseAutoSpawn <- true
        // GlobalSpawnClass.m_bUseSetSpawn <- true
        // GlobalSpawnClass.m_cSetSpawn.position <- Vector(2231.027100, 187.758835, -386.163635)
        // GlobalSpawnClass.m_cSetSpawn.radius <- 200

        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "InstanceAuto17-entrance_lift_train"), "StartForward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "fade_to_death").Destroy()
        Entities.FindByName(null, "AutoInstance1-door_close").Destroy()
        Entities.FindByName(null, "AutoInstance1-door_pushers").Destroy()
        Entities.FindByName(null, "AutoInstance1-door_pushers").Destroy()
        // We need to add a trigger to the crazy box test that plays ambient_sp_a3_crazy_box_b2 (Moja)
        Entities.FindByClassnameNearest("trigger_once", Vector(144, -1280, 1600), 20).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(200, -1272, 1600), 20).Destroy()
        Entities.FindByClassnameNearest("prop_weighted_cube", Vector(576, -1024, 1644), 20).__KeyValueFromString("targetname", "tubecap")
        Entities.FindByName(null, "@test_dome_lift_entry_teleport").__KeyValueFromString("targetname", "tubecapdome")

       
        Entities.FindByName(null, "AutoInstance1-door_prop").__KeyValueFromString("targetname", "DisableDoorMpMod")
        EntFire("DisableDoorMpMod", "setanimation", "Open", 1, null)
        //EntFire("room_1_door_open_trigger", "AddOutput", "OnTrigger room_1_door_open_trigger:disable", 1, null)
    }

    if (MSLoop) {
        // Goo Damage Code
        try {
            if (GooHurtTimerPred) { printl() }
        } catch (exception) {
            GooHurtTimerPred <- 0
        }

        if (GooHurtTimerPred<=Time()) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetOrigin().z <= -374) {
                    EntFireByHandle(p, "sethealth", "-20", 0, null, null)
                }
            }
            GooHurtTimerPred = Time() + 1
        }

        // if nu moved tube cap
        if (movecube) {
            if (Entities.FindByName(null, "tubecap")) {
                local jeff = Entities.FindByName(null, "tubecap")
                jeff.SetOrigin(Vector(875, -1112, 2720))
                //OVERRIDE CUBE FIZZLE
                WaitDontFizzle <- true
                WaitDontFizzleTime <- Time()+1
                movecube <- false
            }
        }

        // if no tube cap kill
        if (!Entities.FindByName(null, "tubecap")) {
            if (Entities.FindByClassname(null, "prop_weighted_cube")) {
                local jerry = Entities.FindByClassname(null, "prop_weighted_cube")
                jerry.__KeyValueFromString("targetname", "tubecap")
                movecube <- true
            } else {
                EntFire("p2mm_servercommand", "command", "sv_cheats 1; ent_create_portal_weighted_antique; sv_cheats 0")
                //OVERRIDE CUBE FIZZLE
                WaitDontFizzle <- true
                WaitDontFizzleTime <- Time()+1
            }
        }

        // if two coob go brr delete oder coobe
        local cubeamount = 0
        for (local ent = null; ent = Entities.FindByClassname(ent, "prop_weighted_cube");) {
            cubeamount = cubeamount + 1
            if (cubeamount>=2) {
                ent.Destroy()
            }
        }

        // Open / Close cube dropper
        local stayopen = false
        foreach (p in CreateTrigger(null, 934.03686523438, -1169.5228271484, 2253.265625, 817.01788330078, -1055.9055175781, 2150.1036376953)) {
            if (p.GetClassname()=="prop_weighted_cube") {
                if (!isopen) {
                    isopen = true
                    printlP2MM(0, true, "cube dropper, OPENED")
                    EntFire("genericcustomprop_maindropper", "setanimation", "Open", 0.4, null)
                }
                stayopen = true
            }
        }

        if (!stayopen && isopen) {
            printlP2MM(0, true, "cube dropper, CLOSED")
            EntFire("genericcustomprop_maindropper", "setanimation", "close", 2.5, null)
            isopen = false
        }

        // Cube Fizzle Override
        local DontFizzle = false
        if (WaitDontFizzle) {
            if (Time()>=WaitDontFizzleTime) {
                WaitDontFizzle <- false
            } else {
                DontFizzle = true
            }
        }

        // Fizzle the cube
        foreach (p in CreateTrigger(null, 75, -1746.5970458984, 1500.7188720703, 1450.1014404297, -509.52490234375, 2840.5529785156)) {
            if (p.GetClassname()=="prop_weighted_cube") {
                DontFizzle = true
            }
        }
        if (!DontFizzle) {
            EntFire("tubecap", "dissolve")
        }

        foreach (p in CreateTrigger(null, 968.68884277344, -1023.1279296875, 2889.7351074219, 801.07244873047, -1206.5419921875, 2030)) {
            if (p.GetClassname()=="prop_weighted_cube") {
                if (rollang >= 160) {
                    rollang <- -160
                } else {
                    if (rollang <= -160) {
                        rollang <- 160
                    } else {
                        rollang <- p.GetAngles().y + 25
                    }
                }

                p.SetOrigin(Vector(875, -1112, p.GetOrigin().z - 7))
                p.SetAngles(rollang, p.GetAngles().y+RandomInt(3, 8), p.GetAngles().z+RandomInt(3, 8))
            }
        }

        // Elevator changelevel
        for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(640, 174, 2740), 100);) {
            EntFire("exit_fade", "fade")
            EntFire("p2mm_servercommand", "command", "changelevel sp_a3_transition01", 2)
        }
    }
}