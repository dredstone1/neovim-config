return {
    'williamboman/mason.nvim',
    lazy = true,
    cmd = 'Mason',
    event = "BufRead",
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup({})

        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ruff",
                "html",
                "cssls",
                "jsonls",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })
    end
}
