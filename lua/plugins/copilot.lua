return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = true },
        })
    end,
}
