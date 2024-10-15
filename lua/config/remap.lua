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

-- save file with ctrl+s, in normal, visual and insert mode
vim.keymap.set({ "n", "v", "i" }, "<c-s>", vim.cmd.w)

-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)


-- add a terminal at the bottom of the screen
-- and focus on it
-- when you press <leader>tt
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.split()
    vim.cmd("wincmd J")
    vim.cmd.terminal()
end)
