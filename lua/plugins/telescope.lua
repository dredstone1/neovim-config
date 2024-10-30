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
        { '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>' },
        { '<leader>fq', '<cmd>Telescope persisted<cr>' },
    },
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<c-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["<c-d>"] = actions.delete_buffer,
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },
        })
    end,
}
