//  ██████╗██████╗             █████╗   ██╗██╗                ██╗██╗   ██╗███╗   ███╗██████╗            ██████╗  █████╗ ██╗      █████╗ ██████╗ ██╗████████╗██╗   ██╗
// ██╔════╝██╔══██╗           ██╔══██╗ ██╔╝██║                ██║██║   ██║████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
// ╚█████╗ ██████╔╝           ███████║██╔╝ ██║                ██║██║   ██║██╔████╔██║██████╔╝           ██████╔╝██║  ██║██║     ███████║██████╔╝██║   ██║    ╚████╔╝ 
//  ╚═══██╗██╔═══╝            ██╔══██║███████║           ██╗  ██║██║   ██║██║╚██╔╝██║██╔═══╝            ██╔═══╝ ██║  ██║██║     ██╔══██║██╔══██╗██║   ██║     ╚██╔╝  
// ██████╔╝██║     ██████████╗██║  ██║╚════██║██████████╗╚█████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ██████████╗██║     ╚█████╔╝███████╗██║  ██║██║  ██║██║   ██║      ██║   
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝     ╚═╝╚═════════╝ ╚════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═════════╝╚═╝      ╚════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        PermaPotato = true
        Entities.FindByName(null, "antechamber_exit").__KeyValueFromString("targetname", "moja1")
        Entities.FindByName(null, "antechamber_areaportal").__KeyValueFromString("targetname", "moja2")
        Entities.FindByName(null, "antechamber_door_sound").__KeyValueFromString("targetname", "moja3")
        // Make elevator start moving on level load
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "StartForward", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "moja1"), "SetAnimation", "idleclose", 1, null, null)
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(2336, -64, 192), 20), "AddOutput", "OnStartTouch moja1:SetAnimation:Open", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "@entry_door-close_door_rl").Destroy()
        Entities.FindByName(null, "fall_fade").Destroy()
        Entities.FindByName(null, "antechamber-proxy").Destroy()
        // Teleport here, what should we do with players still in the test chamber?
        Entities.FindByClassnameNearest("trigger_once", Vector(928.01, 2328, 448), 20).Destroy()

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a4_finale1:0.3", 0, null)
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}