return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>gd", ":DiffviewOpen<CR>" },
	},
	cmd = {
		"DiffviewOpen",
	},
    lazy = true,
	config = function()
		require("diffview").setup()
	end,
}
