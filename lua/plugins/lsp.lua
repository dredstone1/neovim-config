return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        'williamboman/mason.nvim',
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip',
        'jay-babu/mason-nvim-dap.nvim',
    },

    config = function()
        vim.opt.signcolumn = 'yes'
        -- this is a
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })


        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        require('copilot').setup({
            cmd = "copilot",
            event = "InsertEnter",
            suggestion = { enabled = true },
            panel = { enabled = true },
        })

        require("copilot_cmp").setup()
        require('mason').setup({})
        require("mason-nvim-dap").setup({
            ensure_installed = {
                'debugpy',

            },
            handlers = {
                function(language, adapter)
                    require('dap').adapters[language] = adapter
                end,
            }
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ruff",
            },
            automatic_installation = false,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                    })
                end,
            }
        })

        local lsp_zero = require('lsp-zero')

        local cmp = require('cmp')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            sources = {
                { name = 'copilot' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                ['<CR>'] = cmp.mapping.confirm({ select = false }),
            }),

            formatting = lsp_zero.cmp_format({ details = true }),
        })
    end
}
