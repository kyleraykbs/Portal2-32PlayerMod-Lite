// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██████╗███████╗██████╗  █████╗ ██████╗  █████╗ ████████╗██╗ █████╗ ███╗  ██╗             ███╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗           ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗ ██║            ████║
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝           ╚█████╗ █████╗  ██████╔╝███████║██████╔╝███████║   ██║   ██║██║  ██║██╔██╗██║           ██╔██║
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝             ╚═══██╗██╔══╝  ██╔═══╝ ██╔══██║██╔══██╗██╔══██║   ██║   ██║██║  ██║██║╚████║           ╚═╝██║
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗██████╔╝███████╗██║     ██║  ██║██║  ██║██║  ██║   ██║   ██║╚█████╔╝██║ ╚███║██████████╗███████╗
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═════════╝╚══════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        EntFireByHandle(Entities.FindByName(null, "left_1st_room_spawn-initial_blue_spawn"), "SetAsActiveSpawn", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "right_1st_room_spawn-initial_orange_spawn"), "SetAsActiveSpawn", "", 0, null, null)
        Entities.FindByName(null, "split_counter").Destroy()
        Entities.FindByName(null, "split_exit_fake_collision").Destroy()
    }

    if (MSPostPlayerSpawn) {
        EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopMapStart()", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(1)", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "@glados"), "runscriptcode", "GladosCoopElevatorEntrance(2)", 0, null, null)

        for (local ent = null; ent = Entities.FindByName(ent, "split_exit_arms");) {
            EntFireByHandle(ent, "setanimation", "90up", 0, null, null)
        }
        for (local ent = null; ent = Entities.FindByName(ent, "split_entrance_arms");) {
            EntFireByHandle(ent, "setanimation", "90down", 0, null, null)
        }
        for (local ent = null; ent = Entities.FindByClassnameWithin(ent, "func_areaportalwindow", OldPlayerPos, 5000);) {
            EntFireByHandle(ent, "SetFadeEndDistance", "10000", 0, null, null)
        }
    }
}