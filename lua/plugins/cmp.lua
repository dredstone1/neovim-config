return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'zbirenbaum/copilot-cmp',
        'hrsh7th/cmp-path',
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
        "L3MON4D3/LuaSnip",
        'neovim/nvim-lspconfig',
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
                { name = 'copilot' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
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
