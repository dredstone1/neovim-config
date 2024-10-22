return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    lazy = true,
    config = function()
        require("dap-python").setup("python")
    end
}
