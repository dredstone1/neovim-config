return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    lazy = true,
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },

    config = function()
        require("trouble").setup {
            auto_preview = true,
            auto_refresh = true,
            focus = true,
            modes = {
                symbols = {
                    desc = "document symbols",
                    mode = "lsp_document_symbols",
                    focus = true,
                    win = { position = "right" },
                    filter = {
                        any = {
                            ft = { "help", "markdown" },
                            kind = {
                                "Class",
                                "Constructor",
                                "Enum",
                                "Field",
                                "Function",
                                "Interface",
                                "Method",
                                "Module",
                                "Namespace",
                                "Package",

                                "Property",
                                "Struct",
                                "Trait",
                            },
                        },
                    },
                },
            },
        }
    end,
}
