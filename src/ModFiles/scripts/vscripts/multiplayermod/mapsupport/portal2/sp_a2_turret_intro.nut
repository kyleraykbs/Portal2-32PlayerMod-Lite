//  ██████╗██████╗             █████╗ ██████╗            ████████╗██╗   ██╗██████╗ ██████╗ ███████╗████████╗           ██╗███╗  ██╗████████╗██████╗  █████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝           ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝              ██║   ██║   ██║██████╔╝██████╔╝█████╗     ██║              ██║██╔██╗██║   ██║   ██████╔╝██║  ██║
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝                ██║   ██║   ██║██╔══██╗██╔══██╗██╔══╝     ██║              ██║██║╚████║   ██║   ██╔══██╗██║  ██║
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗   ██║   ╚██████╔╝██║  ██║██║  ██║███████╗   ██║   ██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ 

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true

        Entities.FindByClassnameNearest("trigger_multiple", Vector(-176, 392, -160), 32).Destroy()
        hCountdownEnableTrigger = Entities.FindByName(null, "transition_trigger")
        EntFireByHandle(hCountdownEnableTrigger, "Disable", "", 0, null, null)

        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        // Set the door logic
        Entities.FindByName(null, "@exit_door-proxy").__KeyValueFromString("targetname", "MpModDoorProxyOverride")
        EntFire("exit_door_relay_open", "AddOutput", "OnTrigger MpModDoorProxyOverride:OnProxyRelay2", 0, null)
        EntFire("exit_door_relay_close", "AddOutput", "OnTrigger MpModDoorProxyOverride:OnProxyRelay1", 0, null)
                    
        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_laser_relays:0.45", 0, null)
    }

    if (MSLoop) {
        // Trigger for starting/reaching the end of the map countdown
        foreach (player in CreateTrigger("player", -160, 488, -256, -256, 296, -64)) {
            StartCountTransition(player)
        }
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}