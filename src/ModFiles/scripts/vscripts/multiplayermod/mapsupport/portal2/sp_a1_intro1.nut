//  ██████╗██████╗             █████╗   ███╗             ██╗███╗  ██╗████████╗██████╗  █████╗   ███╗  
// ██╔════╝██╔══██╗           ██╔══██╗ ████║             ██║████╗ ██║╚══██╔══╝██╔══██╗██╔══██╗ ████║  
// ╚█████╗ ██████╔╝           ███████║██╔██║             ██║██╔██╗██║   ██║   ██████╔╝██║  ██║██╔██║  
//  ╚═══██╗██╔═══╝            ██╔══██║╚═╝██║             ██║██║╚████║   ██║   ██╔══██╗██║  ██║╚═╝██║  
// ██████╔╝██║     ██████████╗██║  ██║███████╗██████████╗██║██║ ╚███║   ██║   ██║  ██║╚█████╔╝███████╗
// ╚═════╝ ╚═╝     ╚═════════╝╚═╝  ╚═╝╚══════╝╚═════════╝╚═╝╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ ╚══════╝

HasSleptInContainer1 <- false
function p2mmDestroyedSequence() {
    printlP2MM(0, true, "p2mmDestroyedSequence() has ran!")
    HasSleptInContainer1 = true
}

CurrentTeleportOffset <- 0
DisableJumpmsp <- false

function p2mmSecondDrop() {
    local ContainerLightPropCollision = Entities.FindByName(null, "ContainerLightPropCollision")
    local ContainerWheatleyPropCollision = Entities.FindByName(null, "ContainerWheatleyPropCollision")
    local ContainerCeilingPropCollision = Entities.FindByName(null, "ContainerCeilingPropCollision")
    local dropamount = 45
    local ceiltime = 2.6

    // ContainerLightPropCollision
    ContainerLightPropCollision.SetOrigin(Vector(ContainerLightPropCollision.GetOrigin().x, ContainerLightPropCollision.GetOrigin().y, ContainerLightPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerLightPropCollision", "disablecollision")
    // EntFire("ContainerLightPropCollision", "enablecollision", "", ceiltime)

    // ContainerWheatleyPropCollision
    ContainerWheatleyPropCollision.SetOrigin(Vector(ContainerWheatleyPropCollision.GetOrigin().x, ContainerWheatleyPropCollision.GetOrigin().y, ContainerWheatleyPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerWheatleyPropCollision", "disablecollision")
    // EntFire("ContainerWheatleyPropCollision", "enablecollision", "", ceiltime)

    // ContainerCeilingPropCollision
    ContainerCeilingPropCollision.SetOrigin(Vector(ContainerCeilingPropCollision.GetOrigin().x, ContainerCeilingPropCollision.GetOrigin().y, ContainerCeilingPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerCeilingPropCollision", "disablecollision")
    // EntFire("ContainerCeilingPropCollision", "enablecollision", "", ceiltime)
}

function p2mmDropCollision() {
    printlP2MM(0, true, "Dropping container collision via p2mmDropCollision().")

    local dropamount = 45
    local ceiltime = 2.6

    CanJump(false)
    EntFire("p2mm_servercommand", "command", "script CanJump(true)", 3)

    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        p.SetVelocity(Vector(p.GetVelocity().x, p.GetVelocity().y, 0))
    }

    // Props //

    local ContainerBedPropCollision = Entities.FindByName(null, "ContainerBedPropCollision")
    local ContainerFloorPropCollision = Entities.FindByName(null, "ContainerFloorPropCollision")
    local ContainerRightWallPropCollision = Entities.FindByName(null, "ContainerRightWallPropCollision")
    local ContainerLeftWallPropCollision = Entities.FindByName(null, "ContainerLeftWallPropCollision")
    local ContainerFrontWallPropCollision = Entities.FindByName(null, "ContainerFrontWallPropCollision")
    local ContainerNightstandsPropCollision = Entities.FindByName(null, "ContainerNightstandsPropCollision")
    local ContainerDeskPropCollision = Entities.FindByName(null, "ContainerDeskPropCollision")
    local ContainerPlantPropCollision = Entities.FindByName(null, "ContainerPlantPropCollision")
    local ContainerChairPropCollision = Entities.FindByName(null, "ContainerChairPropCollision")

    // ContainerBedPropCollision
    ContainerBedPropCollision.SetOrigin(Vector(ContainerBedPropCollision.GetOrigin().x, ContainerBedPropCollision.GetOrigin().y, ContainerBedPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerBedPropCollision", "disablecollision")
    // EntFire("ContainerBedPropCollision", "enablecollision", "", ceiltime)

    // ContainerFloorPropCollision
    ContainerFloorPropCollision.SetOrigin(Vector(ContainerFloorPropCollision.GetOrigin().x, ContainerFloorPropCollision.GetOrigin().y, ContainerFloorPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerFloorPropCollision", "disablecollision")
    // EntFire("ContainerFloorPropCollision", "enablecollision", "", ceiltime)

    EntFire("p2mm_servercommand", "command", "script p2mmSecondDrop()", 2.8)

    // ContainerRightWallPropCollision
    ContainerRightWallPropCollision.SetOrigin(Vector(ContainerRightWallPropCollision.GetOrigin().x, ContainerRightWallPropCollision.GetOrigin().y, ContainerRightWallPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerRightWallPropCollision", "disablecollision")
    // EntFire("ContainerRightWallPropCollision", "enablecollision", "", ceiltime)

    // ContainerLeftWallPropCollision
    ContainerLeftWallPropCollision.SetOrigin(Vector(ContainerLeftWallPropCollision.GetOrigin().x, ContainerLeftWallPropCollision.GetOrigin().y, ContainerLeftWallPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerLeftWallPropCollision", "disablecollision")
    // EntFire("ContainerLeftWallPropCollision", "enablecollision", "", ceiltime)

    // ContainerFrontWallPropCollision
    ContainerFrontWallPropCollision.SetOrigin(Vector(ContainerFrontWallPropCollision.GetOrigin().x, ContainerFrontWallPropCollision.GetOrigin().y, ContainerFrontWallPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerFrontWallPropCollision", "disablecollision")
    // EntFire("ContainerFrontWallPropCollision", "enablecollision", "", ceiltime)

    // ContainerNightstandsPropCollision
    ContainerNightstandsPropCollision.SetOrigin(Vector(ContainerNightstandsPropCollision.GetOrigin().x, ContainerNightstandsPropCollision.GetOrigin().y, ContainerNightstandsPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerNightstandsPropCollision", "disablecollision")
    // EntFire("ContainerNightstandsPropCollision", "enablecollision", "", ceiltime)

    // ContainerDeskPropCollision
    ContainerDeskPropCollision.SetOrigin(Vector(ContainerDeskPropCollision.GetOrigin().x, ContainerDeskPropCollision.GetOrigin().y, ContainerDeskPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerDeskPropCollision", "disablecollision")
    // EntFire("ContainerDeskPropCollision", "enablecollision", "", ceiltime)

    // ContainerPlantPropCollision
    ContainerPlantPropCollision.SetOrigin(Vector(ContainerPlantPropCollision.GetOrigin().x, ContainerPlantPropCollision.GetOrigin().y, ContainerPlantPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerPlantPropCollision", "disablecollision")
    // EntFire("ContainerPlantPropCollision", "enablecollision", "", ceiltime)

    // ContainerChairPropCollision
    ContainerChairPropCollision.SetOrigin(Vector(ContainerChairPropCollision.GetOrigin().x, ContainerChairPropCollision.GetOrigin().y, ContainerChairPropCollision.GetOrigin().z - dropamount))
    // EntFire("ContainerChairPropCollision", "disablecollision")
    // EntFire("ContainerChairPropCollision", "enablecollision", "", ceiltime)

    // Brushes //

    // local ContainerBedBrush = Entities.FindByName(null, "ContainerBedBrush")
    // local ContainerFloorBrush = Entities.FindByName(null, "ContainerFloorBrush")
    // local ContainerCeilingBrush = Entities.FindByName(null, "ContainerCeilingBrush")
    // local ContainerRightWallBrush = Entities.FindByName(null, "ContainerRightWallBrush")
    // local ContainerLeftWallBrush = Entities.FindByName(null, "ContainerLeftWallBrush")
    // local ContainerFrontWallBrush = Entities.FindByName(null, "ContainerFrontWallBrush")
    // local ContainerBackDoorBrush = Entities.FindByName(null, "ContainerBackDoorBrush")
    // local ContainerBathroomBrush = Entities.FindByName(null, "ContainerBathroomBrush")
    // local ContainerClosetBrush = Entities.FindByName(null, "ContainerClosetBrush")
    // local ContainerNightstandsBrush = Entities.FindByName(null, "ContainerNightstandsBrush")
    // local ContainerLightBrush = Entities.FindByName(null, "ContainerLightBrush")
    // local ContainerWheatleyBrush = Entities.FindByName(null, "ContainerWheatleyBrush")
    // local ContainerDeskBrush = Entities.FindByName(null, "ContainerDeskBrush")
    // local ContainerPlantBrush = Entities.FindByName(null, "ContainerPlantBrush")
    // local ContainerChairBrush = Entities.FindByName(null, "ContainerChairBrush")

    // ContainerBedBrush
    // ContainerBedBrush.SetOrigin(Vector(ContainerBedBrush.GetOrigin().x, ContainerBedBrush.GetOrigin().y, ContainerBedBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerBedBrush", "disable")
    // EntFire("ContainerBedBrush", "Disable", "", ceiltime)

    // ContainerFloorBrush
    // ContainerFloorBrush.SetOrigin(Vector(ContainerFloorBrush.GetOrigin().x, ContainerFloorBrush.GetOrigin().y, ContainerFloorBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerFloorBrush", "disable")
    // EntFire("ContainerFloorBrush", "Disable", "", ceiltime)

    // ContainerCeilingBrush
    // ContainerCeilingBrush.SetOrigin(Vector(ContainerCeilingBrush.GetOrigin().x, ContainerCeilingBrush.GetOrigin().y, ContainerCeilingBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerCeilingBrush", "disable")
    // EntFire("ContainerCeilingBrush", "Disable", "", ceiltime)

    // ContainerRightWallBrush
    // ContainerRightWallBrush.SetOrigin(Vector(ContainerRightWallBrush.GetOrigin().x, ContainerRightWallBrush.GetOrigin().y, ContainerRightWallBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerRightWallBrush", "disable")
    // EntFire("ContainerRightWallBrush", "Disable", "", ceiltime)

    // ContainerLeftWallBrush
    // ContainerLeftWallBrush.SetOrigin(Vector(ContainerLeftWallBrush.GetOrigin().x, ContainerLeftWallBrush.GetOrigin().y, ContainerLeftWallBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerLeftWallBrush", "disable")
    // EntFire("ContainerLeftWallBrush", "Disable", "", ceiltime)

    // ContainerFrontWallBrush
    // ContainerFrontWallBrush.SetOrigin(Vector(ContainerFrontWallBrush.GetOrigin().x, ContainerFrontWallBrush.GetOrigin().y, ContainerFrontWallBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerFrontWallBrush", "disable")
    // EntFire("ContainerFrontWallBrush", "Disable", "", ceiltime)

    // ContainerBackDoorBrush
    // ContainerBackDoorBrush.SetOrigin(Vector(ContainerBackDoorBrush.GetOrigin().x, ContainerBackDoorBrush.GetOrigin().y, ContainerBackDoorBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerBackDoorBrush", "disable")
    // EntFire("ContainerBackDoorBrush", "Disable", "", ceiltime)

    // ContainerBathroomBrush
    // ContainerBathroomBrush.SetOrigin(Vector(ContainerBathroomBrush.GetOrigin().x, ContainerBathroomBrush.GetOrigin().y, ContainerBathroomBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerBathroomBrush", "disable")
    // EntFire("ContainerBathroomBrush", "Disable", "", ceiltime)

    // ContainerClosetBrush
    // ContainerClosetBrush.SetOrigin(Vector(ContainerClosetBrush.GetOrigin().x, ContainerClosetBrush.GetOrigin().y, ContainerClosetBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerClosetBrush", "disable")
    // EntFire("ContainerClosetBrush", "Disable", "", ceiltime)

    // ContainerNightstandsBrush
    // ContainerNightstandsBrush.SetOrigin(Vector(ContainerNightstandsBrush.GetOrigin().x, ContainerNightstandsBrush.GetOrigin().y, ContainerNightstandsBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerNightstandsBrush", "disable")
    // EntFire("ContainerNightstandsBrush", "Disable", "", ceiltime)

    // // ContainerLightBrush
    // ContainerLightBrush.SetOrigin(Vector(ContainerLightBrush.GetOrigin().x, ContainerLightBrush.GetOrigin().y, ContainerLightBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerLightBrush", "disable")
    // EntFire("ContainerLightBrush", "Disable", "", ceiltime)

    // // ContainerWheatleyBrush
    // ContainerWheatleyBrush.SetOrigin(Vector(ContainerWheatleyBrush.GetOrigin().x, ContainerWheatleyBrush.GetOrigin().y, ContainerWheatleyBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerWheatleyBrush", "disable")
    // EntFire("ContainerWheatleyBrush", "Disable", "", ceiltime)

    // ContainerDeskBrush
    // ContainerDeskBrush.SetOrigin(Vector(ContainerDeskBrush.GetOrigin().x, ContainerDeskBrush.GetOrigin().y, ContainerDeskBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerDeskBrush", "disable")
    // EntFire("ContainerDeskBrush", "Disable", "", ceiltime)

    // ContainerPlantBrush
    // ContainerPlantBrush.SetOrigin(Vector(ContainerPlantBrush.GetOrigin().x, ContainerPlantBrush.GetOrigin().y, ContainerPlantBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerPlantBrush", "disable")
    // EntFire("ContainerPlantBrush", "Disable", "", ceiltime)

    // ContainerChairBrush
    // ContainerChairBrush.SetOrigin(Vector(ContainerChairBrush.GetOrigin().x, ContainerChairBrush.GetOrigin().y, ContainerChairBrush.GetOrigin().z - dropamount))
    // EntFire("ContainerChairBrush", "disable")
    // EntFire("ContainerChairBrush", "Disable", "", ceiltime)

    //DebugDrawBox(ContainerBedBrush.GetOrigin(), ContainerBedBrush.GetBoundingMins(), ContainerBedBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerFloorBrush.GetOrigin(), ContainerFloorBrush.GetBoundingMins(), ContainerFloorBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerCeilingBrush.GetOrigin(), ContainerCeilingBrush.GetBoundingMins(), ContainerCeilingBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerRightWallBrush.GetOrigin(), ContainerRightWallBrush.GetBoundingMins(), ContainerRightWallBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerLeftWallBrush.GetOrigin(), ContainerLeftWallBrush.GetBoundingMins(), ContainerLeftWallBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerFrontWallBrush.GetOrigin(), ContainerFrontWallBrush.GetBoundingMins(), ContainerFrontWallBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerBackDoorBrush.GetOrigin(), ContainerBackDoorBrush.GetBoundingMins(), ContainerBackDoorBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerBathroomBrush.GetOrigin(), ContainerBathroomBrush.GetBoundingMins(), ContainerBathroomBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerClosetBrush.GetOrigin(), ContainerClosetBrush.GetBoundingMins(), ContainerClosetBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerNightstandsBrush.GetOrigin(), ContainerNightstandsBrush.GetBoundingMins(), ContainerNightstandsBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerLightBrush.GetOrigin(), ContainerLightBrush.GetBoundingMins(), ContainerLightBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerWheatleyBrush.GetOrigin(), ContainerWheatleyBrush.GetBoundingMins(), ContainerWheatleyBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerDeskBrush.GetOrigin(), ContainerDeskBrush.GetBoundingMins(), ContainerDeskBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerPlantBrush.GetOrigin(), ContainerPlantBrush.GetBoundingMins(), ContainerPlantBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
    //DebugDrawBox(ContainerChairBrush.GetOrigin(), ContainerChairBrush.GetBoundingMins(), ContainerChairBrush.GetBoundingMaxs(), 255, 155, 0, 15, 9999999)
}

ContainerStick <- false
function p2mmParentAndStartMath() {
        // Start container ride
        EntFire("Actor_container_master", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_01", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_03", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_03_door", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_05", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_07", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_09", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_11", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_12", "SetAnimation", "anim2", 0)
        EntFire("Actor_container_13", "SetAnimation", "anim2", 0)

        EntFire("Actor_container_01", "AddOutput", "OnAnimationDone !self:Kill")
        EntFire("Actor_container_03", "AddOutput", "OnAnimationDone !self:Kill")
        EntFire("Actor_container_05", "AddOutput", "OnAnimationDone !self:Kill")
        EntFire("Actor_container_07", "AddOutput", "OnAnimationDone !self:Kill")
        EntFire("Actor_container_09", "AddOutput", "OnAnimationDone !self:Kill")
        EntFire("Actor_container_11", "AddOutput", "OnAnimationDone !self:Kill")

        EntFire("Actor_container_master", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_01", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_03", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_03_door", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_05", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_07", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_09", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_11", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_12", "SetDefaultAnimation", "halt2", 0)
        EntFire("Actor_container_13", "SetDefaultAnimation", "halt2", 0)

        EntFire("container_tiny_impact_shake", "StartShake", "", 0)
        EntFire("light_track_04", "TurnOn", "", 78)

	    EntFire("@container_stacks_1", "SetAnimation", "anim1", 0 )
	    EntFire("@container_stacks_2", "SetAnimation", "anim1", 0 )

        // Props //

        local raiseamount = 45

        local ContainerBedPropCollision = Entities.FindByName(null, "ContainerBedPropCollision")
        local ContainerFloorPropCollision = Entities.FindByName(null, "ContainerFloorPropCollision")
        local ContainerCeilingPropCollision = Entities.FindByName(null, "ContainerCeilingPropCollision")
        local ContainerRightWallPropCollision = Entities.FindByName(null, "ContainerRightWallPropCollision")
        local ContainerLeftWallPropCollision = Entities.FindByName(null, "ContainerLeftWallPropCollision")
        local ContainerFrontWallPropCollision = Entities.FindByName(null, "ContainerFrontWallPropCollision")
        local ContainerNightstandsPropCollision = Entities.FindByName(null, "ContainerNightstandsPropCollision")
        local ContainerLightPropCollision = Entities.FindByName(null, "ContainerLightPropCollision")
        local ContainerWheatleyPropCollision = Entities.FindByName(null, "ContainerWheatleyPropCollision")
        local ContainerDeskPropCollision = Entities.FindByName(null, "ContainerDeskPropCollision")
        local ContainerPlantPropCollision = Entities.FindByName(null, "ContainerPlantPropCollision")
        local ContainerChairPropCollision = Entities.FindByName(null, "ContainerChairPropCollision")

        // ContainerBedPropCollision
        ContainerBedPropCollision.SetOrigin(Vector(ContainerBedPropCollision.GetOrigin().x, ContainerBedPropCollision.GetOrigin().y, ContainerBedPropCollision.GetOrigin().z + raiseamount))

        // ContainerFloorPropCollision
        ContainerFloorPropCollision.SetOrigin(Vector(ContainerFloorPropCollision.GetOrigin().x, ContainerFloorPropCollision.GetOrigin().y, ContainerFloorPropCollision.GetOrigin().z + raiseamount))

        // ContainerCeilingPropCollision
        ContainerCeilingPropCollision.SetOrigin(Vector(ContainerCeilingPropCollision.GetOrigin().x, ContainerCeilingPropCollision.GetOrigin().y, ContainerCeilingPropCollision.GetOrigin().z + raiseamount))

        // ContainerRightWallPropCollision
        ContainerRightWallPropCollision.SetOrigin(Vector(ContainerRightWallPropCollision.GetOrigin().x, ContainerRightWallPropCollision.GetOrigin().y, ContainerRightWallPropCollision.GetOrigin().z + raiseamount))

        // ContainerLeftWallPropCollision
        ContainerLeftWallPropCollision.SetOrigin(Vector(ContainerLeftWallPropCollision.GetOrigin().x, ContainerLeftWallPropCollision.GetOrigin().y, ContainerLeftWallPropCollision.GetOrigin().z + raiseamount))

        // ContainerFrontWallPropCollision
        ContainerFrontWallPropCollision.SetOrigin(Vector(ContainerFrontWallPropCollision.GetOrigin().x, ContainerFrontWallPropCollision.GetOrigin().y, ContainerFrontWallPropCollision.GetOrigin().z + raiseamount))

        // ContainerNightstandsPropCollision
        ContainerNightstandsPropCollision.SetOrigin(Vector(ContainerNightstandsPropCollision.GetOrigin().x, ContainerNightstandsPropCollision.GetOrigin().y, ContainerNightstandsPropCollision.GetOrigin().z + raiseamount))

        // ContainerLightPropCollision
        ContainerLightPropCollision.SetOrigin(Vector(ContainerLightPropCollision.GetOrigin().x, ContainerLightPropCollision.GetOrigin().y, ContainerLightPropCollision.GetOrigin().z + raiseamount))

        // ContainerWheatleyPropCollision
        ContainerWheatleyPropCollision.SetOrigin(Vector(ContainerWheatleyPropCollision.GetOrigin().x, ContainerWheatleyPropCollision.GetOrigin().y, ContainerWheatleyPropCollision.GetOrigin().z + raiseamount))

        // ContainerDeskPropCollision
        ContainerDeskPropCollision.SetOrigin(Vector(ContainerDeskPropCollision.GetOrigin().x, ContainerDeskPropCollision.GetOrigin().y, ContainerDeskPropCollision.GetOrigin().z + raiseamount))

        // ContainerPlantPropCollision
        ContainerPlantPropCollision.SetOrigin(Vector(ContainerPlantPropCollision.GetOrigin().x, ContainerPlantPropCollision.GetOrigin().y, ContainerPlantPropCollision.GetOrigin().z + raiseamount))

        // ContainerChairPropCollision
        ContainerChairPropCollision.SetOrigin(Vector(ContainerChairPropCollision.GetOrigin().x, ContainerChairPropCollision.GetOrigin().y, ContainerChairPropCollision.GetOrigin().z + raiseamount))

        EntFire("ContainerBedPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerBedPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerFloorPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerFloorPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerCeilingPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerCeilingPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerRightWallPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerRightWallPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerLeftWallPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerLeftWallPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerFrontWallPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerFrontWallPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerNightstandsPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerNightstandsPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerLightPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerLightPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerWheatleyPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerWheatleyPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerDeskPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerDeskPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerPlantPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerPlantPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        EntFire("ContainerChairPropCollision", "SetParent", "Actor_container_master", 0)
        EntFire("ContainerChairPropCollision", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)

        EntFireByHandle(Entities.FindByName(null, "ContainerBedPropCollision"), "disablecollision", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerFloorPropCollision"), "disablecollision", "", 0, null, null)

        EntFireByHandle(Entities.FindByName(null, "ContainerNightstandsPropCollision"), "kill", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerLightPropCollision"), "kill", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerDeskPropCollision"), "kill", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerPlantPropCollision"), "kill", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerChairPropCollision"), "kill", "", 0, null, null)

        // Brushes //

    //DisableJumpmsp = true
        // BED
        // ContainerBedBrush.__KeyValueFromInt("Solid", 0)
        // FLOOR
        // ContainerFloorBrush.__KeyValueFromInt("Solid", 0)
        // CEILING
        // ContainerCeilingBrush.__KeyValueFromInt("Solid", 0)
        // DESK
        // ContainerDeskBrush.__KeyValueFromInt("Solid", 0)
        // PLANT
        // ContainerPlantBrush.__KeyValueFromInt("Solid", 0)
        // CHAIR
        // ContainerChairBrush.__KeyValueFromInt("Solid", 0)

        // EntFire("ContainerBedBrush", "disable", "", 0)
        // EntFire("ContainerFloorBrush", "disable", "", 0)
        // EntFire("ContainerCeilingBrush", "disable", "", 0)
        // EntFire("ContainerNightstandsBrush", "disable", "", 0)
        // EntFire("ContainerLightBrush", "disable", "", 0)
        // EntFire("ContainerWheatleyBrush", "disable", "", 0)
        // EntFire("ContainerDeskBrush", "disable", "", 0)
        // EntFire("ContainerPlantBrush", "disable", "", 0)
        // EntFire("ContainerChairBrush", "disable", "", 0)

        // EntFire("ContainerBedBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBedBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerFloorBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerFloorBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerCeilingBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerCeilingBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerRightWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerRightWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerLeftWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerLeftWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerFrontWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerFrontWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerBackDoorBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBackDoorBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerBathroomBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBathroomBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerClosetBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerClosetBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerNightstandsBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerNightstandsBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerLightBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerLightBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerWheatleyBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerWheatleyBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerDeskBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerDeskBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerPlantBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerPlantBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerChairBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerChairBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)

        // disable all the brushes
        // EntFire("ContainerBedBrush", "disable", "", 0)
        // EntFire("ContainerFloorBrush", "disable", "", 0)
        // EntFire("ContainerCeilingBrush", "disable", "", 0)
        // EntFire("ContainerRightWallBrush", "disable", "", 0)
        // EntFire("ContainerLeftWallBrush", "disable", "", 0)
        // EntFire("ContainerFrontWallBrush", "disable", "", 0)
        // EntFire("ContainerBackDoorBrush", "disable", "", 0)
        // EntFire("ContainerBathroomBrush", "disable", "", 0)
        // EntFire("ContainerClosetBrush", "disable", "", 0)
        // EntFire("ContainerNightstandsBrush", "disable", "", 0)
        // EntFire("ContainerLightBrush", "disable", "", 0)
        // EntFire("ContainerWheatleyBrush", "disable", "", 0)
        // EntFire("ContainerDeskBrush", "disable", "", 0)
        // EntFire("ContainerPlantBrush", "disable", "", 0)
        // EntFire("ContainerChairBrush", "disable", "", 0)

    ContainerStick = true
}

SecondToLastTP <- false
function StopStickAndTeleport() {
        EntFireByHandle(Entities.FindByName(null, "ContainerRightWallPropCollision"), "disablecollision", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerLeftWallPropCollision"), "disablecollision", "", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "ContainerFrontWallPropCollision"), "disablecollision", "", 0, null, null)

    // EntFire("ContainerBedBrush", "disable", "", 0)
    // EntFire("ContainerFloorBrush", "disable", "", 0)
    // EntFire("ContainerCeilingBrush", "disable", "", 0)
    // EntFire("ContainerRightWallBrush", "disable", "", 0)
    // EntFire("ContainerLeftWallBrush", "disable", "", 0)
    // EntFire("ContainerFrontWallBrush", "disable", "", 0)
    // EntFire("ContainerBackDoorBrush", "disable", "", 0)
    // EntFire("ContainerBathroomBrush", "disable", "", 0)
    // EntFire("ContainerClosetBrush", "disable", "", 0)
    // EntFire("ContainerNightstandsBrush", "disable", "", 0)
    // EntFire("ContainerLightBrush", "disable", "", 0)
    // EntFire("ContainerWheatleyBrush", "disable", "", 0)
    // EntFire("ContainerDeskBrush", "disable", "", 0)
    // EntFire("ContainerPlantBrush", "disable", "", 0)
    // EntFire("ContainerChairBrush", "disable", "", 0)

    // EntFire("ContainerBedBrush", "kill", "", 0)
    // EntFire("ContainerFloorBrush", "kill", "", 0)
    // EntFire("ContainerCeilingBrush", "kill", "", 0)
    // EntFire("ContainerRightWallBrush", "kill", "", 0)
    // EntFire("ContainerLeftWallBrush", "kill", "", 0)
    // EntFire("ContainerFrontWallBrush", "kill", "", 0)
    // EntFire("ContainerBackDoorBrush", "kill", "", 0)
    // EntFire("ContainerBathroomBrush", "kill", "", 0)
    // EntFire("ContainerClosetBrush", "kill", "", 0)
    // EntFire("ContainerNightstandsBrush", "kill", "", 0)
    // EntFire("ContainerLightBrush", "kill", "", 0)
    // EntFire("ContainerWheatleyBrush", "kill", "", 0)
    // EntFire("ContainerDeskBrush", "kill", "", 0)
    // EntFire("ContainerPlantBrush", "kill", "", 0)
    // EntFire("ContainerChairBrush", "kill", "", 0)
    
    Entities.FindByName(null, "Actor_wall_destruction_01").__KeyValueFromString("targetname", "p2mmactorwalldestructionoverride")
    Entities.FindByName(null, "endwall_collision").__KeyValueFromString("rendermode", "10")

    EntFire("container_collision", "enabledraw", "", 0)
    EntFire("container_collision", "EnableCollision", "", 0)
    EntFire("endwall_collision", "enabledraw", "", 0)

    Entities.FindByName(null, "kill_container_rl").Destroy()
    ContainerStick = false
    SecondToLastTP = true
    DisableJumpmsp = false
    for (local p = null; p = Entities.FindByClassname(p, "player");) {
        EntFireByHandle(p, "AddOutput", "MoveType 2", 0, null, null)
        p.SetOrigin(Vector(-1710, 4380, 3100))
        p.SetVelocity(Vector(80, 0, 0))
    }
}

HasStartedSp_A1_Intro1 <- false
OnlyOnceSp_A1_Intro1 <- true

function MapSupport(MSInstantRun, MSLoop, MSPostPlayerSpawn, MSPostMapSpawn, MSOnPlayerJoin, MSOnDeath, MSOnRespawn) {
    if (MSInstantRun) {
        // Make changing levels work
        EntFire("transition_trigger", "AddOutput", "OnStartTouch p2mm_servercommand:Command:changelevel sp_a1_intro2:0.3", 0, null)

        ContainerFloorBrush <- false
        currentCartCache <- false
        stoprenable <- false
        dummyent <- Entities.CreateByClassname("prop_dynamic")

        // Remove Portal Gun
        UTIL_Team.Spawn_PortalGun(false)

        // Disable pinging and taunting
        UTIL_Team.Pinging(false)
        UTIL_Team.Taunting(false)  

        Entities.FindByName(null, "Actor_container_master").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_01").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_03").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_05").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_07").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_09").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_11").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_12").__KeyValueFromString("HoldAnimation", "1")
        Entities.FindByName(null, "Actor_container_13").__KeyValueFromString("HoldAnimation", "1")

        Entities.FindByName(null, "Actor_trap_door_1").__KeyValueFromString("HoldAnimation", "1")

        Entities.FindByName(null, "@music_awake").__KeyValueFromString("targetname", "p2mmmusicawake")
        Entities.FindByName(null, "container_collision").__KeyValueFromString("rendermode", "10")
        Entities.FindByName(null, "open_portal_relay").__KeyValueFromString("targetname", "p2mmportalrelay")
        Entities.FindByName(null, "mmc_clock_flash_relay").__KeyValueFromString("targetname", "p2mmclockflashrelay")
        Entities.FindByName(null, "portal_red_0_deactivate_rl").Destroy()
        Entities.FindByName(null, "portal_blue_0_deactivate_rl").Destroy()

        EntFire("container_collision", "DisableCollision", "", 0)

        EntFire("return_to_bed_button", "AddOutput", "OnPressed p2mm_servercommand:command:script p2mmDestroyedSequence():5")
        EntFire("@rl_container_ride", "AddOutput", "OnTrigger p2mm_servercommand:command:script p2mmDropCollision()")
        EntFire("crane_second_startup_relay", "AddOutput", "OnTrigger p2mm_servercommand:command:script p2mmParentAndStartMath():1")
        EntFire("@debug_start_perf_test", "AddOutput", "OnTrigger p2mm_servercommand:command:script p2mmParentAndStartMath():10")
        EntFire("@rl_container_ride_third_section", "AddOutput", "OnTrigger p2mm_servercommand:command:script StopStickAndTeleport()")
        EntFire("enter_chamber_trigger", "AddOutput", "OnTrigger p2mmportalrelay:Trigger::34")

        //@rl_container_ride
        EntFire("relay_start_map", "AddOutput", "OnTrigger p2mmclockflashrelay:Trigger")
        EntFire("p2mmclockflashrelay", "AddOutput", "OnTrigger p2mmclockflashrelay:Trigger::1")
        Entities.FindByName(null, "@rl_container_pause_motion").Destroy()
        Entities.FindByName(null, "@rl_container_resume_motion").Destroy()
        Entities.FindByName(null, "@rl_container_ride_second_section").Destroy()
        Entities.FindByName(null, "@knockout_teleport_1").Destroy()
        bumpout <- true
        
        //door_hud_hint_trigger
        Entities.FindByName(null, "door_hud_hint_trigger").SetOrigin(Vector(Entities.FindByName(null, "door_hud_hint_trigger").GetOrigin().x, Entities.FindByName(null, "door_hud_hint_trigger").GetOrigin().y + 512, Entities.FindByName(null, "door_hud_hint_trigger").GetOrigin().z))
        Entities.FindByName(null, "door_open_trigger").SetOrigin(Vector(Entities.FindByName(null, "door_open_trigger").GetOrigin().x, Entities.FindByName(null, "door_open_trigger").GetOrigin().y + 512, Entities.FindByName(null, "door_open_trigger").GetOrigin().z))
        Entities.FindByName(null, "sphere_is_inside_room_trigger").SetOrigin(Vector(Entities.FindByName(null, "sphere_is_inside_room_trigger").GetOrigin().x, Entities.FindByName(null, "sphere_is_inside_room_trigger").GetOrigin().y + 512, Entities.FindByName(null, "sphere_is_inside_room_trigger").GetOrigin().z))
        //Entities.FindByName(null, "container_entry_door").SetOrigin(Vector(Entities.FindByName(null, "container_entry_door").GetOrigin().x, Entities.FindByName(null, "container_entry_door").GetOrigin().y + 512, Entities.FindByName(null, "container_entry_door").GetOrigin().z))
        //Entities.FindByName(null, "container_entry_door_push").SetOrigin(Vector(Entities.FindByName(null, "container_entry_door_push").GetOrigin().x, Entities.FindByName(null, "container_entry_door_push").GetOrigin().y + 512, Entities.FindByName(null, "container_entry_door_push").GetOrigin().z))
        Entities.FindByName(null, "door_1-door_close_relay").Destroy()
        Entities.FindByClassnameNearest("logic_auto", Vector(-5675, 1459, 305), 16).Destroy()

        //Reenable emoting and pinging
        Entities.FindByClassnameNearest("trigger_once", Vector(-1440, 4384, 3089), 5).__KeyValueFromString("targetname", "survivedcontainer")
        EntFire("survivedcontainer", "AddOutput", "OnTrigger p2mm_servercommand:command:script UTIL_Team.Pinging(true)")
        EntFire("survivedcontainer", "AddOutput", "OnTrigger p2mm_servercommand:command:script UTIL_Team.Taunting(true)")
    }

    if (MSPostPlayerSpawn) {
        HasStartedSp_A1_Intro1 <- true
        EntFire("relay_start_cryo_sequence", "Trigger", "", 0)
        EntFire("relay_intro_camera", "Trigger", "", 0)
        EntFire("p2mmmusicawake", "PlaySound", "", 0.4)
        EntFire("announcer_ding_on_wav", "PlaySound", "", 1.5)
        EntFire("good_morning_vcd", "Start", "", 3)

        Sp_A1_Intro1Viewcontrol <- Entities.CreateByClassname("point_viewcontrol_multiplayer")
        Sp_A1_Intro1Viewcontrol.__KeyValueFromString("targetname", "Sp_A1_Intro1Viewcontrol")
        Sp_A1_Intro1Viewcontrol.__KeyValueFromString("target_team", "-1")
        Sp_A1_Intro1Viewcontrol.SetOrigin(Entities.FindByName(null, "camera_intro").GetOrigin())
        Sp_A1_Intro1Viewcontrol.SetAngles(0, 0, 0)
        EntFire("Sp_A1_Intro1Viewcontrol", "setparent", "camera_intro", 0, null)
        EntFire("Sp_A1_Intro1Viewcontrol", "setparentattachment", "camera_intro", 0, null)
        EntFire("Sp_A1_Intro1Viewcontrol", "Enable", "", 0, null)
        EntFire("Sp_A1_Intro1ViewcontrolTele", "disable", "", 12, null)
        EntFire("Sp_A1_Intro1Viewcontrol", "AddOutput", "targetname Sp_A1_Intro1ViewcontrolTele", 0.25, null)
        EntFire("Sp_A1_Intro1ViewcontrolTele", "AddOutput", "targetname Sp_A1_Intro1ViewcontrolDone", 12, null)

        // kill people block exit elevator
        Entities.FindByName(null, "departure_elevator-elevator_1").__KeyValueFromString("dmg", "100")

        // Create container collisson brushes with an offset of (-19, 510, -3)
        // ContainerBedBrush
        // ContainerBedBrush <- Entities.CreateByClassname("func_brush")
        // ContainerBedBrush.SetOrigin(Vector(-5723, 1332, 221))
        // ContainerBedBrush.SetOrigin(Vector(-5742, 1842, 218))
        // ContainerBedBrush.SetSize(Vector(0, 0 ,0), Vector(80, 76, 26))
        // ContainerBedBrush.__KeyValueFromInt("Solid", 3)
        // ContainerBedBrush.__KeyValueFromString("targetname", "ContainerBedBrush")
        // DebugDrawBox(ContainerBedBrush.GetOrigin(), ContainerBedBrush.GetBoundingMins(), ContainerBedBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerFloorBrush
        // ContainerFloorBrush <- Entities.CreateByClassname("func_brush")
        // ContainerFloorBrush.SetOrigin(Vector(-5963, 1288, 205))
        // ContainerFloorBrush.SetOrigin(Vector(-5982, 1798, 202))
        // ContainerFloorBrush.SetSize(Vector(0, 0 ,0), Vector(464, 224, 16))
        // ContainerFloorBrush.__KeyValueFromInt("Solid", 3)
        // ContainerFloorBrush.__KeyValueFromString("targetname", "ContainerFloorBrush")
        // DebugDrawBox(ContainerFloorBrush.GetOrigin(), ContainerFloorBrush.GetBoundingMins(), ContainerFloorBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerCeilingBrush
        // ContainerCeilingBrush <- Entities.CreateByClassname("func_brush")
        // ContainerCeilingBrush.SetOrigin(Vector(-5963, 1288, 349))
        // ContainerCeilingBrush.SetOrigin(Vector(-5982, 1798, 346))
        // ContainerCeilingBrush.SetSize(Vector(0, 0 ,0), Vector(464, 224, 16))
        // ContainerCeilingBrush.__KeyValueFromInt("Solid", 3)
        // ContainerCeilingBrush.__KeyValueFromString("targetname", "ContainerCeilingBrush")
        // DebugDrawBox(ContainerCeilingBrush.GetOrigin(), ContainerCeilingBrush.GetBoundingMins(), ContainerCeilingBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerRightWallBrush
        // ContainerRightWallBrush <- Entities.CreateByClassname("func_brush")
        // ContainerRightWallBrush.SetOrigin(Vector(-5959, 1288, 221))
        // ContainerRightWallBrush.SetOrigin(Vector(-5978, 1798, 218))
        // ContainerRightWallBrush.SetSize(Vector(0, 0 ,0), Vector(456, 18, 128))
        // ContainerRightWallBrush.__KeyValueFromInt("Solid", 3)
        // ContainerRightWallBrush.__KeyValueFromString("targetname", "ContainerRightWallBrush")
        // DebugDrawBox(ContainerRightWallBrush.GetOrigin(), ContainerRightWallBrush.GetBoundingMins(), ContainerRightWallBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerLeftWallBrush
        // ContainerLeftWallBrush <- Entities.CreateByClassname("func_brush")
        // ContainerLeftWallBrush.SetOrigin(Vector(-5959, 1494, 221))
        // ContainerLeftWallBrush.SetOrigin(Vector(-5978, 2004, 218))
        // ContainerLeftWallBrush.SetSize(Vector(0, 0 ,0), Vector(456, 18, 128))
        // ContainerLeftWallBrush.__KeyValueFromInt("Solid", 3)
        // ContainerLeftWallBrush.__KeyValueFromString("targetname", "ContainerLeftWallBrush")
        // ContainerLeftWallBrush <- Entities.FindByName(null, "ContainerLeftWallBrush")
        // DebugDrawBox(ContainerLeftWallBrush.GetOrigin(), ContainerLeftWallBrush.GetBoundingMins(), ContainerLeftWallBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerFrontWallBrush
        // ContainerFrontWallBrush <- Entities.CreateByClassname("func_brush")
        // ContainerFrontWallBrush.SetOrigin(Vector(-5505, 1288, 221))
        // ContainerFrontWallBrush.SetOrigin(Vector(-5524, 1798, 218))
        // ContainerFrontWallBrush.SetSize(Vector(0, 0 ,0), Vector(6, 224, 128))
        // ContainerFrontWallBrush.__KeyValueFromInt("Solid", 3)
        // ContainerFrontWallBrush.__KeyValueFromString("targetname", "ContainerFrontWallBrush")
        // DebugDrawBox(ContainerFrontWallBrush.GetOrigin(), ContainerFrontWallBrush.GetBoundingMins(), ContainerFrontWallBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerBackDoorBrush
        // ContainerBackDoorBrush <- Entities.CreateByClassname("func_brush")
        // ContainerBackDoorBrush.SetOrigin(Vector(-5963, 1288, 221))
        // ContainerBackDoorBrush.SetOrigin(Vector(-5982, 1798, 218))
        // ContainerBackDoorBrush.SetSize(Vector(0, 0 ,0), Vector(6, 224, 128))
        // ContainerBackDoorBrush.__KeyValueFromInt("Solid", 3)
        // ContainerBackDoorBrush.__KeyValueFromString("targetname", "ContainerBackDoorBrush")
        // DebugDrawBox(ContainerBackDoorBrush.GetOrigin(), ContainerBackDoorBrush.GetBoundingMins(), ContainerBackDoorBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerBathroomBrush
        // ContainerBathroomBrush <- Entities.CreateByClassname("func_brush")
        // ContainerBathroomBrush.SetOrigin(Vector(-5959, 1304, 221))
        // ContainerBathroomBrush.SetOrigin(Vector(-5978, 1814, 218))
        // ContainerBathroomBrush.SetSize(Vector(0, 0 ,0), Vector(140, 120, 128))
        // ContainerBathroomBrush.__KeyValueFromInt("Solid", 3)
        // ContainerBathroomBrush.__KeyValueFromString("targetname", "ContainerBathroomBrush")
        // DebugDrawBox(ContainerBathroomBrush.GetOrigin(), ContainerBathroomBrush.GetBoundingMins(), ContainerBathroomBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerClosetBrush
        // ContainerClosetBrush <- Entities.CreateByClassname("func_brush")
        // ContainerClosetBrush.SetOrigin(Vector(-5819, 1304, 221))
        // ContainerClosetBrush.SetOrigin(Vector(-5838, 1814, 218))
        // ContainerClosetBrush.SetSize(Vector(0, 0 ,0), Vector(32, 76, 128))
        // ContainerClosetBrush.__KeyValueFromInt("Solid", 3)
        // ContainerClosetBrush.__KeyValueFromString("targetname", "ContainerClosetBrush")
        // DebugDrawBox(ContainerClosetBrush.GetOrigin(), ContainerClosetBrush.GetBoundingMins(), ContainerClosetBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerNightstandsBrush
        // ContainerNightstandsBrush <- Entities.CreateByClassname("func_brush")
        // ContainerNightstandsBrush.SetOrigin(Vector(-5737, 1304, 221))
        // ContainerNightstandsBrush.SetOrigin(Vector(-5756, 1814, 218))
        // ContainerNightstandsBrush.SetSize(Vector(0, 0 ,0), Vector(122, 28, 26))
        // ContainerNightstandsBrush.__KeyValueFromInt("Solid", 3)
        // ContainerNightstandsBrush.__KeyValueFromString("targetname", "ContainerNightstandsBrush")
        // DebugDrawBox(ContainerNightstandsBrush.GetOrigin(), ContainerNightstandsBrush.GetBoundingMins(), ContainerNightstandsBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerLightBrush
        // ContainerLightBrush <- Entities.CreateByClassname("func_brush")
        // ContainerLightBrush.SetOrigin(Vector(-5643, 1384, 315))
        // ContainerLightBrush.SetOrigin(Vector(-5662, 1894, 312))
        // ContainerLightBrush.SetSize(Vector(0, 0 ,0), Vector(24, 24, 34))
        // ContainerLightBrush.__KeyValueFromInt("Solid", 3)
        // ContainerLightBrush.__KeyValueFromString("targetname", "ContainerLightBrush")
        // DebugDrawBox(ContainerLightBrush.GetOrigin(), ContainerLightBrush.GetBoundingMins(), ContainerLightBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerWheatleyBrush
        // ContainerWheatleyBrush <- Entities.CreateByClassname("func_brush")
        // ContainerWheatleyBrush.SetOrigin(Vector(-5676.5, 1360, 323))
        // ContainerWheatleyBrush.SetOrigin(Vector(-5695.5, 1870, 320))
        // ContainerWheatleyBrush.SetSize(Vector(0, 0 ,0), Vector(25, 24, 26))
        // ContainerWheatleyBrush.__KeyValueFromInt("Solid", 3)
        // ContainerWheatleyBrush.__KeyValueFromString("targetname", "ContainerWheatleyBrush")
        // DebugDrawBox(ContainerWheatleyBrush.GetOrigin(), ContainerWheatleyBrush.GetBoundingMins(), ContainerWheatleyBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerDeskBrush
        // ContainerDeskBrush <- Entities.CreateByClassname("func_brush")
        // ContainerDeskBrush.SetOrigin(Vector(-5775, 1456, 221))
        // ContainerDeskBrush.SetOrigin(Vector(-5794, 1966, 218))
        // ContainerDeskBrush.SetSize(Vector(0, 0 ,0), Vector(120, 40, 48))
        // ContainerDeskBrush.__KeyValueFromInt("Solid", 3)
        // ContainerDeskBrush.__KeyValueFromString("targetname", "ContainerDeskBrush")
        // DebugDrawBox(ContainerDeskBrush.GetOrigin(), ContainerDeskBrush.GetBoundingMins(), ContainerDeskBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerPlantBrush
        // ContainerPlantBrush <- Entities.CreateByClassname("func_brush")
        // ContainerPlantBrush.SetOrigin(Vector(-5551, 1442, 221))
        // ContainerPlantBrush.SetOrigin(Vector(-5570, 1952, 218))
        // ContainerPlantBrush.SetSize(Vector(0, 0 ,0), Vector(46, 52, 76))
        // ContainerPlantBrush.__KeyValueFromInt("Solid", 3)
        // ContainerPlantBrush.__KeyValueFromString("targetname", "ContainerPlantBrush")
        // DebugDrawBox(ContainerPlantBrush.GetOrigin(), ContainerPlantBrush.GetBoundingMins(), ContainerPlantBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)

        // ContainerChairBrush
        // ContainerChairBrush <- Entities.CreateByClassname("func_brush")
        // ContainerChairBrush.SetOrigin(Vector(-5551, 1306, 221))
        // ContainerChairBrush.SetOrigin(Vector(-5570, 1816, 218))
        // ContainerChairBrush.SetSize(Vector(0, 0 ,0), Vector(46, 46, 76))
        // ContainerChairBrush.__KeyValueFromInt("Solid", 3)
        // ContainerChairBrush.__KeyValueFromString("targetname", "ContainerChairBrush")
        // DebugDrawBox(ContainerChairBrush.GetOrigin(), ContainerChairBrush.GetBoundingMins(), ContainerChairBrush.GetBoundingMaxs(), 0, 255, 0, 1, 9999999)


        // BED
        // ContainerBedBrush.__KeyValueFromInt("Solid", 0)
        // FLOOR
        // ContainerFloorBrush.__KeyValueFromInt("Solid", 0)
        // CEILING
        // ContainerCeilingBrush.__KeyValueFromInt("Solid", 0)
        // DESK
        // ContainerDeskBrush.__KeyValueFromInt("Solid", 0)
        // PLANT
        // ContainerPlantBrush.__KeyValueFromInt("Solid", 0)
        // CHAIR
        // ContainerChairBrush.__KeyValueFromInt("Solid", 0)


        // EntFire("ContainerBedBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBedBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerFloorBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerFloorBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerCeilingBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerCeilingBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerRightWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerRightWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerLeftWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerLeftWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerFrontWallBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerFrontWallBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerBackDoorBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBackDoorBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerBathroomBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerBathroomBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerClosetBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerClosetBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerNightstandsBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerNightstandsBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerLightBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerLightBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerWheatleyBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerWheatleyBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerDeskBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerDeskBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerPlantBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerPlantBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
        // EntFire("ContainerChairBrush", "SetParent", "Actor_container_master", 0)
        // EntFire("ContainerChairBrush", "SetParentAttachmentMaintainOffset", "vstAttachment", 0)
    }

    if (MSOnPlayerJoin) {
        if (stoprenable) {
            printlP2MM(0, true, "Player joined (Resetting viewcontrol)")
            EntFire("Sp_A1_Intro1Viewcontrol", "disable", "", 0.5, null)
            EntFire("Sp_A1_Intro1Viewcontrol", "Enable", "", 0.6, null)
        }
    }

    if (MSLoop) {
        local p = Entities.FindByClassnameWithin(null, "player", Vector(-672, -1872, 51), 16)
        try {
            if (p.GetOrigin().z >= 45) {
                p.SetOrigin(Vector(-8674, 1773, 36))
                p.SetAngles(0, 0, 0)
            }
        } catch(exception) {}

        if (!HasStartedSp_A1_Intro1) {
            EntFireByHandle(Entities.FindByName(null, "cryo_fade_in_from_white"), "fade", "", 0, null, null)
        }

        if (Entities.FindByName(null, "Sp_A1_Intro1ViewcontrolTele")) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                p.SetOrigin(Vector(-8864, 1688, 36))
                p.SetVelocity(Vector(0, 0, 0))
            }
        }

        if (OnlyOnceSp_A1_Intro1) {
            if (Entities.FindByName(null, "Sp_A1_Intro1ViewcontrolDone")) {
                for (local p = null; p = Entities.FindByClassname(p, "player");) {
                    p.SetOrigin(Vector(-8709.201172, 1690.068359, 36))
                    p.SetAngles(-4.158184, 64.797371, 0)
                }
                stoprenable <- true
                //Entities.FindByName(null, "knockout-viewcontroller-prop").Destroy()
                //Entities.FindByName(null, "knockout-portalgun").Destroy()
                OnlyOnceSp_A1_Intro1 <- false
            }
        }

        try {
            local ClosestPlayerMain = Entities.FindByClassnameNearest("player", Entities.FindByName(null, "bottom_swivel_1").GetOrigin(), 10000)
            EntFireByHandle(Entities.FindByName(null, "bottom_swivel_1"), "SetTargetEntity", ClosestPlayerMain.GetName(), 0, null, null)
        } catch(exception) { }

        if (DisableJumpmsp) {
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                if (p.GetVelocity().z > 0) {
                    p.SetVelocity(Vector(p.GetVelocity().x, p.GetVelocity().y, -1))
                }
            }
        }

        if (HasSleptInContainer1 && !ContainerStick && !SecondToLastTP) {
            // Find everyone within 400 units of the container ( -8656.179688 1768.031250 104.196503 )
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-8656, 1768, 104), 400);) {
                //p.SetOrigin(Vector(-5700, 1931, 284))
                // -8622 1768 92
                // -2956 -163 -180
                p.SetOrigin(Vector(-5757.985352, 1937.990723, 217.8))
                p.SetAngles(0, 9.997572, 0)
            }
            //  -5559.827637 1843.053467 282.763519;
            if (bumpout) {
                // Bump plant
                for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-5556.693848, 1838.821411, 280.240265), 35);) {
                    p.SetOrigin(Vector(-5556.693848, 1838.821411, 270))
                }
                // // Bump desk
                // for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-5811.007813 1989.968750 282.031250), 35);) {
                //     p.SetOrigin(Vector(-5825.083008, 1979.134399, 270))
                // }

                //-5811.007813 1989.968750 282.031250;
                bumpout <- false
            }
        }

        if (SecondToLastTP) {
            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-8656, 1768, 104), 400);) {
                //p.SetOrigin(Vector(-5700, 1931, 284))
                // -8622 1768 92
                // -2956 -163 -180
                p.SetOrigin(Vector(-1649, 4376, 3167))
            }
        }

        if (ContainerStick) {
            if (!currentCartCache) {
                currentCartCache <- Entities.FindByName(null, "Actor_container_master").GetAttachmentOrigin(1)
            }
            currentCartPos <- Entities.FindByName(null, "Actor_container_master").GetAttachmentOrigin(1)
            currentCartRot <- Entities.FindByName(null, "Actor_container_master").GetAttachmentAngles(1)

            for (local p = null; p = Entities.FindByClassnameWithin(p, "player", Vector(-8656, 1768, 104), 400);) {
                //p.SetOrigin(Vector(-5700, 1931, 284))
                // -8622 1768 92
                // -2956 -163 -180
                p.SetOrigin(Vector(currentCartPos.x, currentCartPos.y, currentCartPos.z + 75))
            }

            // // If someone is outside the container, move them back in
            // local playersinside = []
            // local p = null
            // for (local ent = null; ent = Entities.FindByClassnameWithin(p, "player", Vector(currentCartPos.x, currentCartPos.y + 150, currentCartPos.z + 75), 300)) {
            //     playersinside.push(p)
            // }

            // // If someone is stuck in the closet wakka wakka
            // // script p.SetOrigin(Vector(currentCartPos.x - 180, currentCartPos.y + 80, currentCartPos.z + 30))
            // local p = null
            // for (local ent = null; ent = Entities.FindByClassnameWithin(p, "player", Vector(currentCartPos.x - 180, currentCartPos.y + 80, currentCartPos.z + 30), 82)) {
            //     p.SetOrigin(Vector(currentCartPos.x, currentCartPos.y + 200, currentCartPos.z + 75))
            // }
            // local p = null
            // for (local ent = null; ent = Entities.FindByClassnameWithin(p, "player", Vector(currentCartPos.x - 172, currentCartPos.y + 80, currentCartPos.z + 30), 90)) {
            //     p.SetOrigin(Vector(currentCartPos.x, currentCartPos.y + 200, currentCartPos.z + 75))
            // }

            // local p = null
            // for (local ent = null; ent = Entities.FindByClassname(p, "player")) {
            //     local isplayerinindex = false
            //     foreach (player in playersinside) {
            //         if (p == player) {
            //             isplayerinindex = true
            //         }
            //     }
            //     if (!isplayerinindex) {
            //         p.SetOrigin(Vector(currentCartPos.x, currentCartPos.y + 200, currentCartPos.z + 75))
            //     }
            // }


            offsettick <- currentCartPos - currentCartCache
            cartrotoffset <- 100
            rotval <- 2
            cartrotoffset1 <- 100
            rotval1 <- 2
            for (local p = null; p = Entities.FindByClassname(p, "player");) {
                EntFireByHandle(p, "AddOutput", "MoveType 4", 0, null, null)

                planepitch <- currentCartRot.x * rotval 
                planeroll <- currentCartRot.z * rotval1
                p.SetOrigin(p.GetOrigin() + Vector(offsettick.x, offsettick.y, offsettick.z))

                playermiddle <- p.GetOrigin() - currentCartPos
                playermiddle <- Vector(((playermiddle.x / -1)/cartrotoffset)*planepitch, ((playermiddle.y)/cartrotoffset1)*planeroll, playermiddle.z)
                p.SetOrigin(Vector(p.GetOrigin().x, p.GetOrigin().y, currentCartPos.z + ((playermiddle.x + playermiddle.y) + 14)))
                p.SetVelocity(Vector(p.GetVelocity().x/1.1, p.GetVelocity().y/1.1, 0))
            }
            if (GetDeveloperLevelP2MM()) {
                DebugDrawBox(currentCartPos, Vector(-5, -5, -5), Vector(5, 5, 5), 255, 100, 0, 100, 0)
            }
            currentCartCache <- currentCartPos

            dummyent.SetAngles(currentCartRot.x, currentCartRot.y, currentCartRot.z)

            local forwardvec = dummyent.GetForwardVector()
            local rightvec = dummyent.GetLeftVector()
            local upvec = dummyent.GetUpVector()
            local backvec = MultiplyVector(forwardvec, -1)
            local leftvec = MultiplyVector(rightvec, -1)
            local downvec = MultiplyVector(upvec, -1)
            local zoffset = -25 //currentCartPos.z - (Entities.FindByName(null, "blue").GetOrigin().z + 73)
            local z2offset = 135

            // BOTTOM POINTS
            local frontleft = MoveVectorCheck(currentCartPos, forwardvec, 200, leftvec, 90, upvec, zoffset)
            local frontright = MoveVectorCheck(currentCartPos, forwardvec, 200, rightvec, 90, upvec, zoffset)
            local backleft = MoveVectorCheck(currentCartPos, backvec, 250, leftvec, 90, upvec, zoffset)
            local backleftcloset = MoveVectorCheck(currentCartPos, backvec, 250, leftvec, 25, upvec, zoffset)
            local frontleftcloset = MoveVectorCheck(currentCartPos, backvec, 110, leftvec, 28, upvec, zoffset)
            local frontrightcloset = MoveVectorCheck(currentCartPos, backvec, 110, rightvec, 90, upvec, zoffset)
            local dressingclosetfrontleft = MoveVectorCheck(currentCartPos, backvec, 80, rightvec, 20, upvec, zoffset)
            local dressingclosetfrontright = MoveVectorCheck(currentCartPos, backvec, 80, rightvec, 90, upvec, zoffset)
            local dressingclosetbackleft = MoveVectorCheck(currentCartPos, backvec, 110, rightvec, 20, upvec, zoffset)
            // TOP POINTS (same points just with z2offset)
            local frontlefttop = 0
            frontlefttop = MoveVectorCheck(currentCartPos, forwardvec, 200, leftvec, 90, upvec, z2offset)
            local frontrighttop = MoveVectorCheck(currentCartPos, forwardvec, 200, rightvec, 90, upvec, z2offset)
            local backlefttop = MoveVectorCheck(currentCartPos, backvec, 250, leftvec, 90, upvec, z2offset)
            local backleftclosettop = MoveVectorCheck(currentCartPos, backvec, 250, leftvec, 25, upvec, z2offset)
            local frontleftclosettop = MoveVectorCheck(currentCartPos, backvec, 110, leftvec, 28, upvec, z2offset)
            local frontrightclosettop = MoveVectorCheck(currentCartPos, backvec, 110, rightvec, 90, upvec, z2offset)
            local dressingclosetfrontlefttop = MoveVectorCheck(currentCartPos, backvec, 80, rightvec, 20, upvec, z2offset)
            local dressingclosetfrontrighttop = MoveVectorCheck(currentCartPos, backvec, 80, rightvec, 90, upvec, z2offset)
            local dressingclosetbacklefttop = MoveVectorCheck(currentCartPos, backvec, 110, rightvec, 20, upvec, z2offset)

            //                                                                                                    _ _ _ _
            // WALL CONSISTS OF (ONE INT X or Y) AND (TWO LINES (LISTS)) (LEFT AND TOP (FORMING A RIGHT ANGLE))  |
            //                                                                                                   |
            //                                                                                                   |
            // [Int FACING(0=x or 1=y), List LINE1[Vector POINT1, Vector POINT2, Bool IsVertical]      ,     List LINE2 LINE1[Vector POINT1, Vector POINT2, Bool IsVertical]]

            // make the lines //////////////////////////////////////////////////////////////////////////
            local frontwall = [0, [frontleft, frontlefttop, true], [frontlefttop, frontrighttop, false]]
            local leftwall = [1, [backleft, backlefttop, true], [backlefttop, frontlefttop, false]]
            local backdoor = [0, [backleft, backlefttop, true], [backlefttop, backleftclosettop, false]]
            local bathroomwall = [1, [frontleftcloset, frontleftclosettop, true], [frontleftclosettop, backleftclosettop, false]]
            local closetwall = [0, [frontleftcloset, frontleftclosettop, true], [frontleftclosettop, frontrightclosettop, false]]
            local rightwall = [1, [frontright, frontrighttop, true], [frontrighttop, frontrightclosettop, false]]
            local frontclosetwall = [0, [dressingclosetfrontleft, dressingclosetfrontlefttop, true], [dressingclosetfrontlefttop, dressingclosetfrontrighttop, false]]
            local leftclosetwall = [1, [dressingclosetfrontleft, dressingclosetfrontlefttop, true], [dressingclosetfrontlefttop, dressingclosetbacklefttop, false]]
            ////////////////////////////////////////////////////////////////////////////////////////////

            for (local ply = null; ply = Entities.FindByClassname(ply, "player");) {
                // Get The Origin
                local player = ply
                local playerpoint = player.GetOrigin() + Vector(0, 0, 73)

                // Get The Points ////////////////////////////////////////////
                
                local ittr = 2
                while (ittr > 0) {
                    if (ittr == 1) {
                        playerpoint = player.GetOrigin() // switch to feet after doing head
                    }
                    ittr = ittr - 1

                    WallPush(frontwall, playerpoint, player, Vector(-1, 0, 0), 35)

                    WallPush(leftwall, playerpoint, player, Vector(0, -1, 0), 35)

                    WallPush(backdoor, playerpoint, player, Vector(1, 0, 0), 35)

                    WallPush(bathroomwall, playerpoint, player, Vector(0, 1, 0), 35, true, frontleftcloset, frontleftclosettop, 0)

                    WallPush(closetwall, playerpoint, player, Vector(1, 0, 0), 35, true, frontleftcloset, frontleftclosettop, 1)

                    WallPush(rightwall, playerpoint, player, Vector(0, 1, 0), 35)

                    WallPush(frontclosetwall, playerpoint, player, Vector(1, 0, 0), 35, true, dressingclosetfrontleft, dressingclosetfrontlefttop, 1)
                    
                    WallPush(leftclosetwall, playerpoint, player, Vector(0, 1, 0), 35, true, dressingclosetfrontleft, dressingclosetfrontlefttop, 0)

                }

                //////////////////////////////////////////////////////////////

                


                // Debug The Lines  ////////////////////////////////////////////////////
                if (GetDeveloperLevelP2MM()) {
                    DebugDrawLine(frontwall[1][0], frontwall[1][1], 255, 255, 0, true, 0) // front wall
                    DebugDrawLine(frontwall[2][0], frontwall[2][1], 255, 255, 0, true, 0) // front wall
                    DebugDrawLine(leftwall[1][0], leftwall[1][1], 255, 255, 0, true, 0)   // left wall
                    DebugDrawLine(leftwall[2][0], leftwall[2][1], 255, 255, 0, true, 0)   // left wall
                    DebugDrawLine(backdoor[1][0], backdoor[1][1], 255, 255, 0, true, 0)   // back door
                    DebugDrawLine(backdoor[2][0], backdoor[2][1], 255, 255, 0, true, 0)   // back door
                    DebugDrawLine(bathroomwall[1][0], bathroomwall[1][1], 255, 255, 0, true, 0)   // bathroom wall
                    DebugDrawLine(bathroomwall[2][0], bathroomwall[2][1], 255, 255, 0, true, 0)   // bathroom wall
                    DebugDrawLine(closetwall[1][0], closetwall[1][1], 255, 255, 0, true, 0)   // closet wall
                    DebugDrawLine(closetwall[2][0], closetwall[2][1], 255, 255, 0, true, 0)   // closet wall
                    DebugDrawLine(rightwall[1][0], rightwall[1][1], 255, 255, 0, true, 0)   // right wall
                    DebugDrawLine(rightwall[2][0], rightwall[2][1], 255, 255, 0, true, 0)   // right wall
                    DebugDrawLine(frontclosetwall[1][0], frontclosetwall[1][1], 255, 255, 0, true, 0)   // front closet wall
                    DebugDrawLine(frontclosetwall[2][0], frontclosetwall[2][1], 255, 255, 0, true, 0)   // front closet wall
                    DebugDrawLine(leftclosetwall[1][0], leftclosetwall[1][1], 255, 255, 0, true, 0)   // left closet wall
                    DebugDrawLine(leftclosetwall[2][0], leftclosetwall[2][1], 255, 255, 0, true, 0)   // left closet wall
                }
                ////////////////////////////////////////////////////////////////////////
                // Debug The Points ////////////////////////////////////////////////////
                local minsize = Vector(-2, -2, -2)
                local maxsize = Vector(2, 2, 2)
                local r = 255
                local g = 0
                local b = 0
                local alpha = 100
                local time = 0
                // draw the boxes
                if (GetDeveloperLevelP2MM()) {
                    DebugDrawBox(frontleft, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontright, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(backleft, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(backleftcloset, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontleftcloset, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontrightcloset, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetfrontleft, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetfrontright, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetbackleft, minsize, maxsize, r, g, b, alpha, time)
                    //top
                    DebugDrawBox(frontlefttop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontrighttop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(backlefttop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(backleftclosettop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontleftclosettop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(frontrightclosettop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetfrontlefttop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetfrontrighttop, minsize, maxsize, r, g, b, alpha, time)
                    DebugDrawBox(dressingclosetbacklefttop, minsize, maxsize, r, g, b, alpha, time)
                }
                ////////////////////////////////////////////////////////////////////////

                // // draw a line from intersect1 to finalpoint
                // DebugDrawLine(intersect1, finalpoint, 255, 120, 255, true, 0)
                // // draw a line from intersect2 to finalpoint
                // DebugDrawLine(intersect2, finalpoint, 255, 120, 255, true, 0)
                // DebugDrawBox(finalpoint, Vector(-4, -4, -4), Vector(4, 4, 4), 75, 75, 255, 255, 0)

                //////////////////////////
            }
        }
    }
}

function WallPush(wall, playerpoint, player, pushvec, distance, outofbounds = false, cull1 = Vector(0, 0, 0), cull2 = Vector(0, 0, 0), axiscull = 0) {
    local point = TranslatePlayerToWall(wall, playerpoint)

    local dir = wall[0]
    local cullpoint = 0
    local inter = Vector(0, 0, 0)
    if (outofbounds) {
        local playerforward = Vector(0, 0, 0)
        if (dir == 0) {
            playerforward = Vector(5, 0, 0)
        } else {
            playerforward = Vector(0, 5, 0)
        }
        inter = LineIntersect2DZTranslation(cull1, cull2, playerpoint, playerpoint + playerforward, dir)
        if (GetDeveloperLevelP2MM()) {
            DebugDrawBox(inter, Vector(-2, -2, -2), Vector(2, 2, 2), 75, 75, 75, 255, 0)
        }
    }

    if (outofbounds) {
        if (axiscull == 0 && point.x > inter.x) {
            point = inter
        } else {
            if (axiscull == 1 && point.y > inter.y) {
                point = inter
            } else {
                
            }
        }
    }

    local distancescore = GetDistanceScore(point, playerpoint)


    // axiscull +x = 0, +y = 1, -x = 2, -y = 3

    
    
    if (distancescore < distance) {
        
        player.SetOrigin(player.GetOrigin() + pushvec)
        player.SetVelocity(player.GetVelocity() + (pushvec * 10))
        
        if (GetDeveloperLevelP2MM()) {
            DebugDrawBox(point, Vector(-2, -2, -2), Vector(2, 2, 2), 75, 255, 75, 255, 0)
        }

    } else {
        if (GetDeveloperLevelP2MM()) {
            DebugDrawBox(point, Vector(-2, -2, -2), Vector(2, 2, 2), 255, 75, 255, 255, 0) 
        }
    }
}

function MoveVectorCheck(objectmiddle, vector1, mult1, vector2, mult2, vector3, mult3) {
    local cur = AddVectors(MultiplyVector(vector1, mult1), MultiplyVector(vector2, mult2)) // set the vectors offset relitive to the middle
    cur = AddVectors(cur, MultiplyVector(vector3, mult3)) // set the vectors offset relitive to the middle


    cur = AddVectors(objectmiddle, cur) // change the vector from local space to world space
    return cur
}
