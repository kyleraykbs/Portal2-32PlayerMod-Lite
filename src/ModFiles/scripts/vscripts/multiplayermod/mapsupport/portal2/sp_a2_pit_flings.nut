//  ██████╗██████╗             █████╗ ██████╗            ██████╗ ██╗████████╗           ███████╗██╗     ██╗███╗  ██╗ ██████╗  ██████╗
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██║╚══██╔══╝           ██╔════╝██║     ██║████╗ ██║██╔════╝ ██╔════╝
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝██║   ██║              █████╗  ██║     ██║██╔██╗██║██║  ██╗ ╚█████╗
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔═══╝ ██║   ██║              ██╔══╝  ██║     ██║██║╚████║██║  ╚██╗ ╚═══██╗
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║     ██║   ██║   ██████████╗██║     ███████╗██║██║ ╚███║╚██████╔╝██████╔╝
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝     ╚═╝   ╚═╝   ╚═════════╝╚═╝     ╚══════╝╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═════╝

bPortalNearTop <- false
bPortalNearExit <- false
bCubeOutOfPit <- false
bPlayerOutOfPit <- false

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1"), "startforward", "", 0, null, null)
        // Destroy objects
        Entities.FindByName(null, "door_0-close_door_rl").Destroy()
        Entities.FindByName(null, "walltunnel_1_Cover_clip").Destroy()
        Entities.FindByName(null, "exit_door_lock_counter").Destroy()
        Entities.FindByName(null, "spawn_new_cube_listener").Destroy()
        Entities.FindByName(null, "cube_elevator_clip").Destroy()
        Entities.FindByName(null, "lift3_rm5").__KeyValueFromString("dmg", "100")

        local detector = Entities.FindByClassname(null, "func_portal_detector")
        detector.__KeyValueFromString("CheckAllIDs", "1")
        EntFireByHandle(detector, "AddOutput", "OnStartTouchPortal !self:RunScriptCode:bPortalNearExit=1", 0, null, null)
        EntFireByHandle(detector, "AddOutput", "OnEndTouchPortal !self:RunScriptCode:bPortalNearExit=0", 0, null, null)
        
        local detector2 = Entities.FindByClassname(detector, "func_portal_detector")
        detector2.__KeyValueFromString("CheckAllIDs", "1")
        EntFireByHandle(detector2, "AddOutput", "OnStartTouchPortal !self:RunScriptCode:bPortalNearTop=1", 0, null, null)
        EntFireByHandle(detector2, "AddOutput", "OnEndTouchPortal !self:RunScriptCode:bPortalNearTop=0", 0, null, null)

        EntFire("box_out_of_pit_trigger", "AddOutput", "OnStartTouch !self:RunScriptCode:bCubeOutOfPit=true")
        EntFire("box_out_of_pit_trigger", "AddOutput", "OnEndTouch !self:RunScriptCode:bCubeOutOfPit=false")
        EntFire("smuggled_cube_fizzle_trigger", "AddOutput", "OnStartTouch @glados:RunScriptCode:sp_laser_lift_pit_flings_cube_lost()")

        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a2_fizzler_intro:0.3", 0, null)
    }
    
    if (MSLoop) {
        if (CreateTrigger("player", -704, 256, -256, 704, -672, 128).len() != 0) {
            bPlayerOutOfPit = true
        } else {
            bPlayerOutOfPit = false
        }
        if (bCubeOutOfPit && !bPortalNearTop && !bPortalNearExit && !bPlayerOutOfPit) {
            EntFire("@glados", "RunScriptCode", "sp_laser_lift_pit_flings_cube_lost()")
            bCubeOutOfPit = false
        }
    }

    if (MSPostPlayerSpawn) {
        NewApertureStartElevatorFixes()
    }
}