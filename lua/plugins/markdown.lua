return {
    "MeanderingProgrammer/render-markdown.nvim",
    Lazy = true,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function()
        vim.keymap.set("n", "<leader>md", "<cmd>lua require('render-markdown').toggle()<CR>")
    end,
}
