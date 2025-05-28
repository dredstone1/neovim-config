return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = true,
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({
			auto_close = true,
			warn_no_results = false,
			focus = true,
		})
	end,
}
