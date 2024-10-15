require("config.remap")
require("config.set")
require("config.lazy")

-- Set the background color of the floating window to none
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "normal", { bg = "none" })
vim.api.nvim_set_hl(0, "normalFloat", { bg = "none" })


