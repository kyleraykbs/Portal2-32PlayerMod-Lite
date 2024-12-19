// █▀▄▀█ ▄▀█ █▀█   █▀ █░█ █▀█ █▀█ █▀█ █▀█ ▀█▀   █▀█ █▀█ █▀█ ▀█▀//
// █░▀░█ █▀█ █▀▀   ▄█ █▄█ █▀▀ █▀▀ █▄█ █▀▄ ░█░   █▀▄ █▄█ █▄█ ░█░//
//      put all randomly called map support functions here     //

//## Start Elevator Room On Player Spawn ##//
function NewApertureStartElevatorFixes() {
    // Elevator light_spot
    try {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_fill"), "TurnOn", "", 0, null, null)
    } catch(exception) {}

    // Elevator env_projectedtexture
    try {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-light_elevator_dynamic"), "TurnOn", "", 0, null, null)
    } catch(exception) {}

    // Open elevator tube
    try {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_tube_opener"), "setanimation", "Open", 0, null, null)
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_tube_opener"), "setdefaultanimation", "open_idle", 0.10, null, null)
    } catch(exception) {}

    // Open elevator door
    try {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-elevator_1_body"), "setanimation", "dooropen", 0, null, null)
    } catch(exception) {}

    // kill people block exit elevator
    try {
        Entities.FindByName(null, "departure_elevator-elevator_1").__KeyValueFromString("dmg", "100")
    } catch(exception) {}

    // Reposition and resize fan soundscape
    try {
        local vec = Entities.FindByName(null, "arrival_elevator-elevator_1").GetOrigin()
        local RelX = 0
        local RelY = -192
        local RelZ = 120

        //local MiddleVector = Entities.FindByName(null, "arrival_elevator-elevator_tube_opener").GetOrigin()
        local MiddleVector = Entities.FindByNameNearest("arrival_elevator-elevator_tube_opener", Entities.FindByName(null, "blue").GetOrigin(), 1000).GetOrigin()
        local OutsideVector = Entities.FindByName(null, "arrival_elevator-open").GetOrigin()

        local ComputedVector = Vector(MiddleVector.x.tointeger()-OutsideVector.x.tointeger(), MiddleVector.y.tointeger()-OutsideVector.y.tointeger(), 0)

        //Number Sorter
        local CurrentHighest = 0
        local AmountOfItterations = 0
        foreach (Component in ComputedVector) {

            AmountOfItterations = AmountOfItterations + 1

            if (Component <= 0) {
                Component = Component * -1
            }

            if (Component >= CurrentHighest) {
                CurrentHighest = AmountOfItterations
            }
        }

        if (CurrentHighest==1) {
            CurrentHighest="x"
        } else {
            CurrentHighest="y"
        }

        if (CurrentHighest=="x" && ComputedVector.x <= 0) {
            CurrentHighest="-x"
        }

        if (CurrentHighest=="y" && ComputedVector.y <= 0) {
            CurrentHighest="-y"
        }

        local FinalVector = Vector(0, 0, 0)

        if (CurrentHighest=="-y") {
            FinalVector = Vector(MiddleVector.x+(RelY), MiddleVector.y+RelX, MiddleVector.z+RelZ)
        }
        if (CurrentHighest=="y") {
            FinalVector = Vector(MiddleVector.x+(RelY*-1), MiddleVector.y+RelX, MiddleVector.z+RelZ)
        }
        if (CurrentHighest=="-x") {
            FinalVector = Vector(MiddleVector.x+RelX, MiddleVector.y+(RelY), MiddleVector.z+RelZ)
        }
        if (CurrentHighest=="x") {
            FinalVector = Vector(MiddleVector.x+RelX, MiddleVector.y+(RelY*-1), MiddleVector.z+RelZ)
        }

        local ClosestCoords = Vector(0, 0, 0)
        local ClosestEnt = null
        local BestScore = 80000
        for (local ent = null; ent = Entities.FindByClassname(ent, "env_soundscape");) {
            local xent = UnNegative(ent.GetOrigin().x) - UnNegative(FinalVector.x)
            local yent = UnNegative(ent.GetOrigin().y) - UnNegative(FinalVector.y)
            local zent = UnNegative(ent.GetOrigin().z) - UnNegative(FinalVector.z)
            local Score = xent + yent + zent
            local Score2 = UnNegative(Score)
            // if (Score >= 0) {
            //     Score2 = Score * -1
            // }
            if (Score2 <= BestScore) {
                BestScore = Score2
                ClosestCoords = ent.GetOrigin()
                ClosestEnt = ent
            }
        }

        ClosestEnt.__KeyValueFromString("radius", "300")
        ClosestEnt.SetOrigin(Vector(vec.x, vec.y, vec.z + 200))

        // Entities.FindByName(null, "@arrival_elevator_soundscape").__KeyValueFromString("radius", "300")
        // Entities.FindByName(null, "@arrival_elevator_soundscape").SetOrigin(Vector(vec.x, vec.y, vec.z + 200))
    } catch(exception) {
        printlP2MM(1, true, "Exception occured in NewApertureStartElevatorFixes()!")
    }
    // Enable vgui displays
    try {
        EntFireByHandle(Entities.FindByName(null, "arrival_elevator-signs_on"), "Trigger", "", 0, null, null)
        Entities.FindByName(null, "arrival_elevator-signs_off").Destroy()
    } catch(exception) {}
}

//## Disable Wheatley Pickup ##//
function disablewheatleyplayerpickup() {
    try {
        EntFire("@sphere", "disablepickup")
        EntFire("@sphereDummy", "enablepickup")
    } catch(exception) {}
}

//## Enable Wheatley Pickup ##//
function enablewheatleyplayerpickup() {
    try {
        EntFire("@sphere", "enablepickup")
        EntFire("@sphereDummy", "enablepickup")
    } catch(exception) {}
}