return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	priority = 900,
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			theme = "moonfly",
			options = {
				icons_enabled = true,
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"filename",
					"diagnostics",
					"diff",
				},
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
		})
	end,
}
