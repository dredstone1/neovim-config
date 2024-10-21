return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'zbirenbaum/copilot-cmp',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'neovim/nvim-lspconfig',
    },

    cmd = "CmpStatus",
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local lsp = require("lspconfig")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
            }),
            sources = {
                { name = "copilot" },
                { name = "luasnip" },
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
        require('copilot')
        require("copilot_cmp").setup()
        lsp.clangd.setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities()
        }
    end,
}
