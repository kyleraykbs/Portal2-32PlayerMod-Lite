CommandList.push(
    class {
        name = "ban"
        level = 5

        // !ban
        function CC(p, args) { RemovePlayerUI(p.entindex(), true) }
    }
)