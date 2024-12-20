//  ██████╗██████╗             █████╗ ██████╗            ██████╗  █████╗ ███╗   ███╗██████╗ 
// ██╔════╝██╔══██╗           ██╔══██╗╚════██╗           ██╔══██╗██╔══██╗████╗ ████║██╔══██╗
// ╚█████╗ ██████╔╝           ███████║  ███╔═╝           ██████╔╝███████║██╔████╔██║██████╔╝
//  ╚═══██╗██╔═══╝            ██╔══██║██╔══╝             ██╔══██╗██╔══██║██║╚██╔╝██║██╔═══╝
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║  ██║██║  ██║██║ ╚═╝ ██║██║
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Offset coop repsawn nodes for elevators (left and right side)
        GlobalSpawnClass.m_bUseAutoSpawn <- true
        UTIL_Team.Spawn_PortalGun(true)

        // Enable pinging and disable taunting
        UTIL_Team.Pinging(true)
        UTIL_Team.Taunting(false)

        // delete box spawn
        Entities.FindByClassnameNearest("info_player_start", Vector(-2384, -176, 596), 64).Destroy()
    
        EntFire("elevator-entrance_lift_train", "StartForward", null, 0)

        // prevent doors from closing
        Entities.FindByName(null, "elevator_door-door_close").Destroy()
        Entities.FindByName(null, "part_2_door_2-door_close").Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-1156, -1660, 480), 64).Destroy()
        Entities.FindByClassnameNearest("trigger_once", Vector(-1144, -1656, 720), 64).Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(256, 512, -462), 64).Destroy()
        Entities.FindByName(null, "elevator-start_trigger").Destroy()

        // checkpoints
        EntFireByHandle(Entities.FindByClassnameNearest("trigger_once", Vector(728, -1664, 0), 128), "AddOutput", "OnStartTouch !self:RunScriptCode:Checkpoint()", 0, null, null)

        // Make changing levels work
        EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart end_fade:Fade::2", 0, null)
        if (GetMapName().find("sp_") != null) {
            EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel sp_a2_firestorm:3.5", 0, null)
        } else EntFire("exit_elevator-exit_lift_train", "AddOutput", "OnStart p2mm_servercommand:Command:changelevel st_a2_firestorm:3.5", 0, null)

    }

}
function Checkpoint() {
    GlobalSpawnClass.m_bUseAutoSpawn <- false
    Entities.FindByClassname(null, "info_player_start").SetOrigin(Vector(640, -1632, -91))
    Entities.FindByClassname(null, "info_player_start").SetAngles(0, 180, 0)
}
