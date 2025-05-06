function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<C-m>", function()
	vim.cmd("normal %")
end, { noremap = true, silent = true })

-- better backwords shortcut
Map("n", "<leader>e", function()
	if vim.bo.filetype == "netrw" then
		vim.cmd("normal u")
	else
		vim.cmd("silent Explore " .. vim.fn.expand("%:p:h"))
	end
end)

-- Git command using the Map function
Map("n", "<leader>gs", vim.cmd.Git)

-- Window management
Map("n", "<leader>cv", vim.cmd.vsplit)
Map("n", "<leader>cb", vim.cmd.split)
Map("n", "<leader>cc", vim.cmd.close)
Map("n", "<leader>td", vim.cmd.tabclose)

-- LSP-related keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		Map("n", "K", vim.lsp.buf.hover, opts)
		Map("n", "gd", vim.lsp.buf.definition, opts)
		Map("n", "gD", vim.lsp.buf.declaration, opts)
		Map("n", "gi", vim.lsp.buf.implementation, opts)
		Map("n", "go", vim.lsp.buf.type_definition, opts)
		Map("n", "gr", vim.lsp.buf.references, opts)
		Map("n", "gs", vim.lsp.buf.signature_help, opts)
		Map("n", "<F2>", vim.lsp.buf.rename, opts)
		Map("n", "<F4>", vim.lsp.buf.code_action, opts)
	end,
})
