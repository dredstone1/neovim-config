return {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = { "ConformInfo", "Format" },
	keys = {
		{
			"<f3>",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				cpp = { "clang-format" },
				c = { "clang-format" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = false,
			formatters = {
				prettier = {
					prepend_args = {
						"--use-tabs",
						"--tab-width",
						"4",
					},
				},
				prettierd = {
					prepend_args = {
						"--use-tabs",
						"--tab-width",
						"4",
					},
				},
				stylua = {
					prepend_args = {
						"--indent-type",
						"Tabs",
						"--indent-width",
						"4",
					},
				},
				rustfmt = {
					prepend_args = {
						"--config",
						"hard_tabs=true,tab_spaces=4",
					},
				},
				["clang-format"] = {
					prepend_args = {
						"-style={UseTab: ForIndentation,IndentWidth: 4,TabWidth: 4,ColumnLimit: 0}",
					},
				},
			},
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true })
	end,
}
