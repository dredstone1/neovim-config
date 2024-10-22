return {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    lazt = true,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    opts = {},
    keys = {
        { "<leader>dt", "<cmd>DapToggleBreakpoint<cr>", mode = {"n", "v"}},
        { "<leader>dc", function() require("dap").continue() end, mode = {"n", "v"} },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
}

