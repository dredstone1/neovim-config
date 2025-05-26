vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false
vim.opt.scrolloff = 8

vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_hide = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

vim.opt.updatetime = 50

vim.opt.backup = false
vim.opt.swapfile = false

local undodir_path = vim.fn.stdpath("data") .. "/undodir"

if vim.fn.isdirectory(undodir_path) == 0 then
	vim.fn.mkdir(undodir_path, "p")
end

vim.opt.undodir = undodir_path
vim.opt.undofile = true
