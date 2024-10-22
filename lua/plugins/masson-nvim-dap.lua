return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    lazy = true,
    opts = {
        automatic_installation = true,

        handlers = {},

        ensure_installed = {
            "debugpy",
        },
    },
}
