return {
    'echasnovski/mini.move',
    version = '*',
    config = function()
        require('mini.move').setup({
            mappings = {
                -- Move visual selection in Visual mode Shift + Ctrl + h/j/k/l
                left = '<C-A-h>',
                right = '<C-A-l>',
                down = '<C-A-j>',
                up = '<C-A-k>',

                -- Move current line in Normal mode
                line_left = '<C-A-h>',
                line_right = '<C-A-l>',
                line_down = '<C-A-j>',
                line_up = '<C-A-k>',
            },

            -- Options which control moving behavior
            options = {
                -- Automatically reindent selection during linewise vertical move
                reindent_linewise = true,
            },
        })
    end,
}
