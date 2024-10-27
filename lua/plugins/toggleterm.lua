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
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],

            hide_numbers = false,  -- hide the number column in toggleterm buffers
            autochdir = true,      -- when neovim changes it current directory the terminal will change it's own when next it's opened
            start_in_insert = true,
            persist_mode = true,   -- when the term is closed it will not lose its state
            shell = vim.o.shell,   -- change the default shell
            close_on_exit = false, -- close the terminal window when the process exits

            auto_scroll = true,    -- auto scroll when new output is generated

            shade_terminals = true,

            persist_size = true,
            direction = 'horizontal',
            float_opts = {
                border = 'single',
                width = 150,
                height = 40,
                winblend = 3,
            },

            winbar = {
                enabled = true,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            }
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

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
