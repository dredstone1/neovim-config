return {
    "aserowy/tmux.nvim",
    config = function()
        return require("tmux").setup({
            copy_sync = {
                enable = true,
                ignore_buffers = { empty = false },
                redirect_to_clipboard = false,
                register_offset = 0,
                sync_clipboard = true,
                sync_registers = true,
                sync_registers_keymap_put = true,
                sync_registers_keymap_reg = true,
                sync_deletes = true,
                sync_unnamed = true,
            },
            navigation = {
                cycle_navigation = true,
                enable_default_keybindings = true,
                persist_zoom = false,
            },
            resize = {
                enable_default_keybindings = true,
                resize_step_x = 5,
                resize_step_y = 2,
            }
        })
    end,
}
