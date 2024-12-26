CommandList.push(
    class {
        name = "kick"
        level = 5

        // !kick
        function CC(p, args) { RemovePlayerUI(p.entindex(), false) }
    }
)