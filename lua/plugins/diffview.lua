return {
    'sindrets/diffview.nvim',
    keys = {
        { "<leader>gd", ":DiffviewOpen<CR>" },
    },
    cmd = {
        "DiffviewOpen",
    },
    config = function()
        require("diffview.actions")
        require("diffview").setup({
        })
    end,
}
