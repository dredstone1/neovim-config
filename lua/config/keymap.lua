function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

Map("n", "<leader>e", vim.cmd.Ex)
Map("n", "<leader>gs", vim.cmd.Git)


Map("n", "<leader>cv", vim.cmd.vsplit)
Map("n", "<leader>cb", vim.cmd.split)
Map("n", "<leader>cc", vim.cmd.close)
Map("n", "<leader>td", vim.cmd.tabclose)

Map("n", "=", "<cmd>vertical resize +5<cr>")
Map("n", "-", "<cmd>vertical resize -5<cr>")
Map("n", "+", "<cmd>horizontal resize +2<cr>")
Map("n", "_", "<cmd>horizontal resize -2<cr>")

Map("t", "=", "<cmd>vertical resize +5<cr>")
Map("t", "-", "<cmd>vertical resize -5<cr>")
Map("t", "+", "<cmd>horizontal resize +2<cr>")
Map("t", "_", "<cmd>horizontal resize -2<cr>")

Map("n", "<C-h>", "<cmd>wincmd h<CR>")
Map("n", "<C-j>", "<cmd>wincmd j<CR>")
Map("n", "<C-k>", "<cmd>wincmd k<CR>")
Map("n", "<C-l>", "<cmd>wincmd l<CR>")

Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")

Map("n", "<leader>tt", "<cmd>terminal<CR>")
