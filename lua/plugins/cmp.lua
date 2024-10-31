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
        "L3MON4D3/LuaSnip",
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
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'luasnip' },
                { name = 'copilot' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            },
            mapping = cmp.mapping.preset.insert({
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
