return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            vim.o.termguicolors = true
            require("catppuccin").setup({
                flavour = "auto",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = true,
                dim_inactive = {
                    enabled = true,
                },
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                },
            })
            vim.cmd("colorscheme catppuccin")
        end,
    }
}
