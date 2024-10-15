return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        local lualine = require("smart-splits")

        -- recommended mappings
        -- resizing splits
        -- these keymaps will also accept a range,
        -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
        vim.keymap.set('n', '<A-h>', lualine.resize_left)
        vim.keymap.set('n', '<A-j>', lualine.resize_down)
        vim.keymap.set('n', '<A-k>', lualine.resize_up)
        vim.keymap.set('n', '<A-l>', lualine.resize_right)
        -- moving between splits
        vim.keymap.set('n', '<C-h>', lualine.move_cursor_left)
        vim.keymap.set('n', '<C-j>', lualine.move_cursor_down)
        vim.keymap.set('n', '<C-k>', lualine.move_cursor_up)
        vim.keymap.set('n', '<C-l>', lualine.move_cursor_right)
        vim.keymap.set('n', '<C-\\>', lualine.move_cursor_previous)
        -- swapping buffers between windows
        vim.keymap.set('n', '<leader><leader>h', lualine.swap_buf_left)
        vim.keymap.set('n', '<leader><leader>j', lualine.swap_buf_down)
        vim.keymap.set('n', '<leader><leader>k', lualine.swap_buf_up)
        vim.keymap.set('n', '<leader><leader>l', lualine.swap_buf_right)
    end,
}
