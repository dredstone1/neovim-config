return {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
        {[[<c-\>]], '<cmd>ToggleTerm<cr>'}, 
    },
    config = function()
        require('toggleterm').setup {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],

            hide_numbers = true,   -- hide the number column in toggleterm buffers
            autochdir = false,     -- when neovim changes it current directory the terminal will change it's own when next it's opened
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
    end,
}

