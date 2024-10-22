-- remap some keys to make it easier to use
vim.g.mapleader = " "

-- return to the file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- spliting windows
-- space + c + b -> horizontal split
-- space + c + c -> close window
vim.keymap.set("n", "<leader>cv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>cb", vim.cmd.split)
vim.keymap.set("n", "<leader>cc", vim.cmd.close)

-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) 
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
