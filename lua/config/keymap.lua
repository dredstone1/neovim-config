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

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})
