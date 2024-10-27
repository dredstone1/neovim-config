return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'zbirenbaum/copilot-cmp',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-emoji',
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        'neovim/nvim-lspconfig',
        'saadparwaiz1/cmp_luasnip',
    },
    cmd = "CmpStatus",
    lazy = true,
    event = "InsertEnter",
    config = function()
        require("lspconfig")
        require('copilot')
        require("copilot_cmp").setup()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = 'luasnip', option = { show_autosnippets = true } },
                { name = 'copilot' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'emoji' },
            },
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
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
