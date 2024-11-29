return {
	"mhartington/formatter.nvim",
	lazy = false,
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			filetype = {
				cpp = {
					function()
						return {
							exe = "clang-format",
							args = {
								"-style=file",
								util.escape_path(util.get_current_buffer_file_path()),
								"-i",
								'--style="{BasedOnStyle: llvm, IndentWidth: 4}"',
							},
						}
					end,
				},
				c = {
					function()
						return {
							exe = "clang-format",
							args = {
								"-style=file",
								util.escape_path(util.get_current_buffer_file_path()),
								"-i",
								'--style="{BasedOnStyle: llvm, IndentWidth: 4}"',
							},
						}
					end,
				},
				lua = {
					function()
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
					require("formatter.filetypes.any").substitute_trailing_whitespace,
				},
			},
		})
	end,
}

