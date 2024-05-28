local M = {}

function M.setup()
  local dap = require "dap"
  local dapui = require "dapui"

  dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = os.getenv "HOME" .. "/sources/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  }

  dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb",
  }

  local venv = os.getenv "VIRTUAL_ENV"
  local python_path
  if venv == nil then
    python_path = "/bin/python"
  else
    python_path = string.format("%s/bin/python", venv)
    -- python_path = vim.fn.getcwd() .. string.format("%s/bin/python", venv)
  end

  dap.adapters.python = {
    type = "executable",
    -- command = python_path,
    command = "python",
    -- command = vim.fn.getcwd() .. string.format("%s/bin/python", venv),
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}/build/Debug/bin",
      stopAtEntry = true,
      -- args = function()
      -- 	local filter = vim.fn.input("Enter args: ")
      -- 	return { filter }
      -- end,
      -- args = { "-vf", "eq=brightness=0.06:saturation=2", "/home/perseo/Videos/sample-mp4-file.mp4" },
      -- args = { "/home/perseo/Videos/sample-mp4-file.mp4" },
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
      },
    },
    {
      name = "Attach to gdbserver :1234",
      type = "lldb",
      request = "launch",
      MIMode = "gdb",
      miDebuggerServerAddress = "localhost:1234",
      miDebuggerPath = "/usr/bin/gdb",
      cwd = "${workspaceFolder}",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
    },
    {
      name = "Launch hpc",
      type = "cppdbg",
      request = "launch",
      cwd = "${workspaceFolder}/build/Debug/bin",
      program = "${workspaceFolder}/build/Debug/bin/hpc-services",
      stopAtEntry = true,
      args = { "${workspaceFolder}/docker/hpc/Batch.json" },
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
      },
    },
    {
      name = "Launch recoloring",
      type = "cppdbg",
      request = "launch",
      cwd = "${workspaceFolder}/build/debug/bin",
      program = "${workspaceFolder}/build/debug/bin/cpp-recoloring-backend",
      stopAtEntry = true,
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
      },
    },
    {
      name = "Launch garment exporter",
      type = "cppdbg",
      request = "launch",
      cwd = "${workspaceFolder}/build/dev-debug/bin",
      program = "${workspaceFolder}/build/dev-debug/bin/garment-exporter",
      stopAtEntry = true,
      setupCommands = {
        {
          text = "-enable-pretty-printing",
          description = "enable pretty printing",
          ignoreFailures = false,
        },
      },
    },
  }

  dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = "launch",
      name = "Launch file",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      pythonPath = python_path,
      -- args = { "edit", "config" },
    },
    -- {
    --   type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    --   request = "launch",
    --   name = "Launch poetry",
    --   program = "${workspaceFolder}/.venv/bin/poetry",
    --   args = { "run", "start" },
    --   cwd = vim.fn.getcwd(),
    --   pythonPath = python_path,
    -- },
  }

  -- dap.adapters.dart = {
  -- 	type = "executable",
  -- 	command = "dart",
  -- 	-- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
  -- 	args = { "debug_adapter" },
  -- }

  -- dap.configurations.dart = {
  -- 	{
  -- 		type = "dart",
  -- 		request = "launch",
  -- 		name = "Launch Dart Program",
  -- 		-- The nvim-dap plugin populates this variable with the filename of the current buffer
  -- 		program = "${file}",
  -- 		-- The nvim-dap plugin populates this variable with the editor's current working directory
  -- 		cwd = "${workspaceFolder}",
  -- 	},
  -- }

  dap.adapters.dart = {
    type = "executable",
    -- As of this writing, this functionality is open for review in https://github.com/flutter/flutter/pull/91802
    command = "flutter",
    args = { "debug_adapter" },
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter Program",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "${file}",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      -- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
      toolArgs = { "-d", "emulator-5554" },
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

-- dap.configurations.dart = {
-- 	{
-- 		type = "dart",
-- 		request = "launch",
-- 		name = "Launch flutter",
-- 		-- dartSdkPath = "/usr/local/Caskroom/flutter/2.10.3/flutter/bin/cache/dart-sdk/",
-- 		-- flutterSdkPath = "/usr/local/Caskroom/flutter/2.10.3" .. "/flutter",
-- 		program = "${workspaceFolder}/lib/main.dart",
-- 		cwd = "${workspaceFolder}",
-- 	},
-- }
