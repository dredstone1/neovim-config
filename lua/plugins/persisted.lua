return {
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = function(_, opts)
        require("persisted").setup({
            autostart = true,
            should_save = function()
                return true
            end,

            save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
            follow_cwd = true,
            use_git_branch = true,
            autoload = true,
            on_autoload_no_session = function()
                vim.notify("No existing session to load.")
            end,
            telescope = {
                mappings = {
                    copy_session = "<C-c>",
                    change_branch = "<C-b>",
                    delete_session = "<C-d>",
                },
                icons = {
                    selected = " ",
                    dir = "  ",
                    branch = " ",
                },
            },
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "PersistedSavePre",
            callback = function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.bo[buf].filetype == "toggleterm" then
                        vim.api.nvim_buf_delete(buf, { force = true })
                    end
                end
            end,
        })
    end,
}
