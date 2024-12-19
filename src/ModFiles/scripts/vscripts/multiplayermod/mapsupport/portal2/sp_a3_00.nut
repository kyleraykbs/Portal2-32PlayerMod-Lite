//  ██████╗██████╗             █████╗ ██████╗             █████╗  █████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║ █████╔╝           ██║  ██║██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║ ╚═══██╗           ██║  ██║██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║██████╔╝██████████╗╚█████╔╝╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚═════╝ ╚═════════╝ ╚════╝  ╚════╝

// should fix fog sometime

StartFadeDone <- false

EndingTriggered <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        p2mm_startfade <- Entities.CreateByClassname("env_fade")
        p2mm_startfade.__KeyValueFromString("targetname", "p2mm_startfade")
        p2mm_startfade.__KeyValueFromString("duration", "0")
        p2mm_startfade.__KeyValueFromString("rendercolor", "0 0 0")
        p2mm_startfade.__KeyValueFromString("renderamt", "255")
        p2mm_startfade.__KeyValueFromString("spawnflags", "8")

        // Disable nametags this load
        g_bAllowNametags = false

        // Disable color indicator this load
        g_bAllowColorIndicator = false

        // Shake the camera when you fall through the wood
        Entities.FindByName(null, "crash_landing_shake").__KeyValueFromString("spawnflags", "29")

        UTIL_Team.Pinging(false)
        UTIL_Team.Taunting(false)
        UTIL_Team.Spawn_PortalGun(false)

        printlP2MM(0, true, "" + Entities.FindByName(null, "@environment_mines_fog").__KeyValueFromString("fogmaxdensity", "1"))
        Entities.FindByName(null, "@environment_mines_fog").__KeyValueFromString("fogend", "1")
        Entities.FindByName(null, "@environment_bottomless_pit_falling_fog").__KeyValueFromString("farz", "0")
        // Entities.FindByName(null, "potatos_prop").__KeyValueFromString("solid", "0")
        EntFire("potatos_end_relay", "AddOutput", "OnTrigger p2mm_servercommand:Command:script EndingTriggered <- true:0")
        Entities.FindByName(null, "@display_chapter_title").__KeyValueFromString("startdisabled", "1")

        // Destroy objects
        Entities.FindByClassnameNearest("logic_auto", Vector(144, -4048, 64), 20).Destroy()
        for (local ent = null; ent = Entities.FindByClassname(ent, "trigger_push");) {
            ent.Destroy()
        }

        // Changing levels works without modifying anything
        // EntFire(Entities.FindByClassnameNearest("trigger_once", Vector(-2048, -4608, 64), 5), "AddOutput", "OnTrigger p2mm_servercommand:Command:changelevel sp_a3_01", 0, null)
    }

    if (MSPostPlayerSpawn) {
        StartFadeDone <- true
        EntFire("fade_from_black", "Fade", "", 0, null)

        EntFire("@display_chapter_title", "Enable")
        EntFire("@display_chapter_title", "Trigger")

        EntFireByHandle(Entities.FindByName(null, "player_looktarget"), "SetParent", "!player", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "potatos_tank"), "SetTargetEntity", "player_looktarget", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "shaft_section_0"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "shaft_section_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "lift_mover"), "Open", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ambient_sp_a3_01_b1"), "PlaySound", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "falling_whoosh"), "stopsound", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "falling_whoosh"), "PlaySound", "", 0.1, null, null)
        EntFireByHandle(Entities.FindByName(null, "potatos_relay"), "Trigger", "", 3, null, null)
        EntFireByHandle(Entities.FindByName(null, "potatos_train"), "StartForward", "", 4, null, null)

        UTIL_Team.Pinging(true, "all", 70)
        UTIL_Team.Taunting(true, "all", 70)
    }

    if (MSOnPlayerJoin) {
        EntFire("global_ents-environment_bottomless_pit_falling", "Trigger")
        for (local p; p = Entities.FindByClassname(p, "player");) {
            EntFireByHandle(p, "SetFogController", "@environment_bottomless_pit_falling_fog", 0, p, p)
        }
    }

    if (MSLoop) {
        if (!StartFadeDone) {
            EntFire("p2mm_startfade", "Fade", "", 0, null)
        }
        // Make players invisible and not able to move
        for (local p; p = Entities.FindByClassname(p, "player");) {
            p.SetVelocity(Vector(p.GetVelocity().x/2, p.GetVelocity().y/2, 0))
            p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, 8))
            p.__KeyValueFromString("rendermode", "10")
            if (!EndingTriggered) {
                EntFireByHandle(Entities.FindByName(null, "speedmod"), "ModifySpeed", "0", 0, p, p)
            } else {
                EntFireByHandle(Entities.FindByName(null, "speedmod"), "ModifySpeed", "1", 0, p, p)
            }
        }
        // Make POTATOS tank point at nearest player
        try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "potatos_tank").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "potatos_tank"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        } catch(exception) {}
    }
}