// ███╗   ███╗██████╗             █████╗  █████╗  █████╗ ██████╗             ██╗       ██╗ █████╗ ██╗     ██╗                ███████╗
// ████╗ ████║██╔══██╗           ██╔══██╗██╔══██╗██╔══██╗██╔══██╗            ██║  ██╗  ██║██╔══██╗██║     ██║                ██╔════╝
// ██╔████╔██║██████╔╝           ██║  ╚═╝██║  ██║██║  ██║██████╔╝            ╚██╗████╗██╔╝███████║██║     ██║                ██████╗
// ██║╚██╔╝██║██╔═══╝            ██║  ██╗██║  ██║██║  ██║██╔═══╝              ████╔═████║ ██╔══██║██║     ██║                ╚════██╗
// ██║ ╚═╝ ██║██║     ██████████╗╚█████╔╝╚█████╔╝╚█████╔╝██║     ██████████╗  ╚██╔╝ ╚██╔╝ ██║  ██║███████╗███████╗██████████╗██████╔╝
// ╚═╝     ╚═╝╚═╝     ╚═════════╝ ╚════╝  ╚════╝  ╚════╝ ╚═╝     ╚═════════╝   ╚═╝   ╚═╝  ╚═╝  ╚═╝╚══════╝╚══════╝╚═════════╝╚═════╝

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Keep areaportal open by not allowing it to be adressed by map logic
        Entities.FindByName(null, "portal_close_second_puzzle").__KeyValueFromString("targetname", "moja")

        EntFire("disk_loaded_relay", "AddOutput", "OnTrigger p2mm_servercommand:command:changelevel mp_coop_lobby_3:22.5")
    }

    if (MSLoop) {
        TeleportPlayerWithinDistance(Vector(1224, -1984, 565), 100, Vector(1208, -1989, 315))
    }
}