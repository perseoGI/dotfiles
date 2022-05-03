local M = {}

function M.setup()
	local dap = require("dap")
	local dapui = require("dapui")

	dap.adapters.cppdbg = {
		id = "cppdbg",
		type = "executable",
		command = "/home/perseo/sources/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
			-- args = function()
			-- 	local filter = vim.fn.input("Enter args: ")
			-- 	return { filter }
			-- end,
			-- args = { "-vf", "eq=brightness=0.06:saturation=2", "/home/perseo/Videos/sample-mp4-file.mp4" },
			args = { "/home/perseo/Videos/sample-mp4-file.mp4" },
		},
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			miDebuggerPath = "/usr/bin/gdb",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
		},
	}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp

	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

return M
