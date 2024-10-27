return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    lazy = true,
    cmd = {
        "Telescope",
    },
    keys = {
        { '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
        { '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
        { '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
        { '<leader>fn', '<cmd>lua require("telescope.builtin").help_tags()<cr>' },
        { '<leader>fq', '<cmd>Telescope persisted<cr>'},
    },
    config = function()
        require('telescope').setup({
            extensions = {
                "persisted",
            },
        })
    end,
}
