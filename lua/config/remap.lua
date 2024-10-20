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

