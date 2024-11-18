return {
	--NvimDapAdapter
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			opts = {
				handlers = {},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function(_, _)
			local dap = require("dap")
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
				name = "lldb",
			}
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},

					-- 💀
					-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
					--
					--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
					--
					-- Otherwise you might get the following error:
					--
					--    Error on launch: Failed to attach to the target process
					--
					-- But you should be aware of the implications:
					-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
					-- runInTerminal = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
		keys = {
			{
				"<leader>dR",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>dE",
				function()
					require("dapui").eval(vim.fn.input("[Expression] > "))
				end,
				desc = "Evaluate Input",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				mode = { "n", "v" },
				desc = "Evaluate",
			},
			{
				"<leader>dC",
				function()
					require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
				end,
				desc = "Conditional Breakpoint",
			},
			{
				"<leader>dL",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				silent = true,
				desc = "Set Breakpoint",
			},
			{
				"<leader>dU",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle UI",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause.toggle()
				end,
				desc = "Pause",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").step_back()
				end,
				desc = "Step Back",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>ds",
				function()
					require("dap").continue()
				end,
				desc = "Start",
			},
			{
				"<leader>dd",
				function()
					require("dap").disconnect()
				end,
				desc = "Disconnect",
			},
			{
				"<leader>dg",
				function()
					require("dap").session()
				end,
				desc = "Get Session",
			},
			{
				"<leader>dh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "Hover Variables",
			},
			{
				"<leader>dS",
				function()
					require("dap.ui.widgets").scopes()
				end,
				desc = "Scopes",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>du",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dq",
				function()
					require("dap").close()
				end,
				desc = "Quit",
			},
			{
				"<leader>dx",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>dO",
				function()
					require("dap").repl.open()
				end,
				silent = true,
				desc = "Repl Open",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				silent = true,
				desc = "Run Last",
			},
		},
	},
	{
		"nvim-telescope/telescope-dap.nvim",
	},
	{
		-- https://github.com/theHamsta/nvim-dap-virtual-text
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		opts = {
			-- Display debug text as a comment
			commented = true,
			-- Customize virtual text
			display_callback = function(variable, buf, stackframe, node, options)
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value
				else
					return variable.name .. " = " .. variable.value
				end
			end,
		},
	},
}
