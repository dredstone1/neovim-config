return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    lazy = true,
    opts = {
        automatic_installation = false,
        handlers = nil,
        ensure_installed = {
            "debugpy",
        },
    },
}
