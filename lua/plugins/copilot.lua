return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    config = function()
    require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = true },
    })
end,
}
