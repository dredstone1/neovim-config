return {
	{ "nvim-neotest/nvim-nio", lazy = true },
	{ "theHamsta/nvim-dap-virtual-text", lazy = true },
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		recommended = true,
		desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
		lazy = true,
		keys = {
			{ "<leader>dt", "<cmd>DapToggleBreakpoint<cr>", mode = { "n", "v" } },
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				mode = { "n", "v" },
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}

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
			-- dap.adapters.lldb = {
			-- 	type = "executable",
			-- 	command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
			-- 	name = "lldb",
			-- }
			-- dap.configurations.cpp = {
			-- 	{
			-- 		name = "Launch",
			-- 		type = "lldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = "${workspaceFolder}",
			-- 		stopOnEntry = false,
			-- 		args = {},
			--
			-- 		-- 💀
			-- 		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			-- 		--
			-- 		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			-- 		--
			-- 		-- Otherwise you might get the following error:
			-- 		--
			-- 		--    Error on launch: Failed to attach to the target process
			-- 		--
			-- 		-- But you should be aware of the implications:
			-- 		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			-- 		-- runInTerminal = false,
			-- 	},
			-- }
		end,
	},
}
