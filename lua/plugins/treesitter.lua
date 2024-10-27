return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
    lazy = true,
    -- Install parsers synchronously (only applied to `ensure_installed`)


    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,

            auto_install = true,
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "json",
                "html",
                "css",
                "javascript",
                "python",
                "rust",
                "comment",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
