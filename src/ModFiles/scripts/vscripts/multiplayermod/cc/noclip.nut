CommandList.push(
    class {
        name = "noclip"
        level = 3

        // !noclip
        function CC(p, args) {
            local pclass = FindPlayerClass(p)
            if (pclass.noclip) {
                EnableNoclip(false, p)
            } else {
                EnableNoclip(true, p)
            }
        }
    }
)