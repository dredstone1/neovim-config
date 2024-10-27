return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "ColorScheme",
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            theme = 'rose-pine',
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                refresh = {
                    statusline = 1000,
                }
            },

            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'filename',
                    'diagnostics',
                    'diff',
                },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
            },
        })
    end,
}
