//  ██████╗██████╗             █████╗ ██████╗            ██╗      █████╗  ██████╗███████╗██████╗            ██████╗ ███████╗██╗      █████╗ ██╗   ██╗ ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗           ██╔══██╗██╔════╝██║     ██╔══██╗╚██╗ ██╔╝██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██║     ███████║╚█████╗ █████╗  ██████╔╝           ██████╔╝█████╗  ██║     ███████║ ╚████╔╝ ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██║     ██╔══██║ ╚═══██╗██╔══╝  ██╔══██╗           ██╔══██╗██╔══╝  ██║     ██╔══██║  ╚██╔╝   ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗███████╗██║  ██║██████╔╝███████╗██║  ██║██████████╗██║  ██║███████╗███████╗██║  ██║   ██║   ██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═════╝


function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoCountEnd <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Kill the beginning door close trigger
        Entities.FindByClassnameNearest("trigger_once", Vector(1224, -704, 32), 1024).Destroy()
        // Kill the panels' relays
        Entities.FindByName(null, "animset01_kill_rl").Destroy()
        Entities.FindByName(null, "animset02_kill_rl").Destroy()
        Entities.FindByName(null, "animset03_kill_rl").Destroy()
        Entities.FindByName(null, "animset04_kill_rl").Destroy()
        Entities.FindByName(null, "animset05_kill_rl").Destroy()
        Entities.FindByName(null, "animset06_kill_rl").Destroy()
        Entities.FindByName(null, "animset07_kill_rl").Destroy()
        Entities.FindByName(null, "animset08_kill_rl").Destroy()
        Entities.FindByName(null, "lift_kill_rl").Destroy()
        // Kill the end door close trigger even though it probably isn't linked to the door relay
        Entities.FindByClassnameNearest("trigger_once", Vector(-320, -1376, 40), 1024).Destroy()

        // teleport everyone to the elevator when someone reaches it
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(-468, -704, -63), 10), "AddOutput", "OnStartTouch !self:RunScriptCode:tpall()", 0, null, null)

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_turret_blocker:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
        // Fix Valve's stupid bug
        Entities.FindByClassnameNearest("trigger_once", Vector(-450.29, -703, 61.5), 24).__KeyValueFromString("targetname", "temptrigger")
        EntFire("temptrigger", "AddOutput", "OnStartTouch player_on_top_branch:SetValue:1:0.7", 2, null)
    }

    if (MSOnPlayerJoin) {
        // Find all players
        for (local p = null; p = Entities.FindByClassname(p, "player");) {
            EntFireByHandle(p2mm_clientcommand, "Command", "r_flashlightbrightness 1", 0, p, p)
            EntFireByHandle(p, "setfogcontroller", "@environment_mines_fog", 0, null, null)
        }
    }
}

function tpall() { // teleport everyone to the elevator
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        p.SetOrigin(Vector(-449, -704, -55))
        p.SetAngles(0, 0, 0)
        p.SetVelocity(Vector(0, 0, 0))
    }
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(-256, -189, 28))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, -90, 0)
}
