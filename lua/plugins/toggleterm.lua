return {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = true,
    keys = {
        { [[<c-\>]], '<cmd>ToggleTerm<cr>' },
    },
    config = function()
        require('toggleterm').setup {
            highlights = require("rose-pine.plugins.toggleterm"),
            size = 20,
            open_mapping = [[<C-\>]],
            hide_numbers = false,
            autochdir = true,
            start_in_insert = true,
            persist_mode = true,
            shell = vim.o.shell,
            close_on_exit = false,
            auto_scroll = true,
            persist_size = true,
            direction = 'horizontal',
        }
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    end,
}
