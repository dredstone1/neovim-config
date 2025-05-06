return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			vim.o.termguicolors = true
			require("catppuccin").setup({
				flavour = "auto",
				transparent_background = false,
				show_end_of_buffer = true,
				term_colors = true,
				dim_inactive = {
					enabled = true,
				},
				default_integrations = true,
				integrations = {
					cmp = true,
					treesitter = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = true,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				inverse = true,
				contrast = "",
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = false,
			})
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyVirtualTextColor = true
			vim.cmd("colorscheme moonfly")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		config = function()
			require("nightfox").setup({
				options = {
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled",
					transparent = true,
					dim_inactive = true,
					module_default = true,
					styles = {
						comments = "NONE",
						conditionals = "NONE",
						constants = "NONE",
						functions = "NONE",
						keywords = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
					inverse = {
						match_paren = false,
						visual = false,
						search = false,
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})
		end,
	},
}
