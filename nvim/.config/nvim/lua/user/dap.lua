local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dap_ui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_ext_status_ok, dap_ext = pcall(require, "dap.ext.vscode")
if not dap_ext_status_ok then
	return
end

-- dap.adapters.cppdbg = {
--     id = "cppdbg",
--     type = "executable",
--     command = "/home/ryan/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
-- }
--
-- dap_ext.load_launchjs(nil, { cppdbg = { "c", "cpp" } })

-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "cppdbg",
--         request = "launch",
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtEntry = false,
--         MIMode = 'gdb',
--         miDebuggerPath = '/usr/bin/gdb',
--         setupCommands = {
--             {
--                 text = '-enable-pretty-printing',
--                 description = 'enable pretty printing',
--                 ignoreFailures = false
--             },
--         },
--     },
-- }
--
-- dap.configurations.c = dap.configurations.cpp

dap.adapters.python = {
	type = "executable",
	command = string.format("%s/bin/python", os.getenv("VIRTUAL_ENV")),
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

-- dap ui settings
dap_ui.setup({})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close()
end
