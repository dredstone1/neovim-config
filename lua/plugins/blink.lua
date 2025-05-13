return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	lazy = true,
	event = "BufRead",
	config = function()
		local blink = require("blink.cmp")
		blink.setup({
			keymap = {
				preset = "default",

				["<A-q>"] = { "accept" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<C-space>"] = { "show", "fallback" },
				["<A-n>"] = { "select_next" },
				["<A-p>"] = { "select_prev" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				documentation = { auto_show = true },
			},
			signature = { enabled = true },
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		})
	end,
	opts_extend = { "sources.default" },
}
