return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    event = "BufReadPre",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = function()
        require("todo-comments").setup()
    end,
}
