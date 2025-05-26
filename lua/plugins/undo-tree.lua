return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	lazy = true,
	keys = {
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	},
	config = function()
		require("undotree").setup()
	end,
}
