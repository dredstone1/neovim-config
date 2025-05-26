return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	lazy = true,
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics togglecr>",
			desc = "Diagnostics (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({})
	end,
}
