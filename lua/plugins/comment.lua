return {
    'numToStr/Comment.nvim',
    lazy = true,
    keys = {
        {"gcc"},
        {"gbc"},
        {"gc"},
        {"gb"},
        {"gcO"},
        {"gco"},
        {"gcA"},
    },
    config = function()
        require('Comment').setup()
    end
}
