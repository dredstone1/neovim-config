return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,
            auto_install = true,
            ensure_installed = {
                "c",
                "markdown",
                "cpp",
                "lua",
                "json",
                "html",
                "css",
                "javascript",
                "python",
                "rust",
                "java",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
