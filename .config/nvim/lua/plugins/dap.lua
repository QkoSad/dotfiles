return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{ "<leader>b", "", desc = "+debug", mode = { "n", "v" } },
		{
			"<leader>bB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Breakpoint Condition",
		},
		{
			"<leader>bb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>bc",
			function()
				require("dap").continue()
			end,
			desc = "Run/Continue",
		},
		{
			"<leader>ba",
			function()
				require("dap").continue({ before = get_args })
			end,
			desc = "Run with Args",
		},
		{
			"<leader>bC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to Cursor",
		},
		{
			"<leader>bg",
			function()
				require("dap").goto_()
			end,
			desc = "Go to Line (No Execute)",
		},
		{
			"<leader>bi",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<leader>bj",
			function()
				require("dap").down()
			end,
			desc = "Down",
		},
		{
			"<leader>bk",
			function()
				require("dap").up()
			end,
			desc = "Up",
		},
		{
			"<leader>bl",
			function()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>bo",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<leader>bO",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<leader>bp",
			function()
				require("dap").pause()
			end,
			desc = "Pause",
		},
		{
			"<leader>br",
			function()
				require("dap").repl.toggle()
			end,
			desc = "Toggle REPL",
		},
		{
			"<leader>bs",
			function()
				require("dap").session()
			end,
			desc = "Session",
		},
		{
			"<leader>bt",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate",
		},
		{
			"<leader>bw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "Widgets",
		},
	},
	config = function()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "/home/arch/.local/share/nvim/mason/bin/netcoredbg",
			args = { "--interpreter=vscode" },
			options = { detached = false },
		}
		-- for c# netcoredbg use the second option when choosing debugger
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					local cwd = vim.fn.getcwd()
					local project_name = vim.fn.fnamemodify(cwd, ":t")

					-- Match all DLLs under bin/Debug/net*/<project>.dll
					local glob_pattern = cwd .. "/bin/Debug/net*/" .. project_name .. ".dll"

					-- Find matching paths (returns a list of full paths)
					local dll_files = vim.fn.glob(glob_pattern, false, true)
					return vim.fn.input(dll_files[1])
				end,
			},
		}
		dap.adapters.python = function(cb, config)
			if config.request == "attach" then
				---@diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				---@diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or "127.0.0.1"
				cb({
					type = "server",
					port = assert(port, "`connect.port` is required for a python `attach` configuration"),
					host = host,
					options = {
						source_filetype = "python",
					},
				})
			else
				cb({
					type = "executable",
					command = "/home/arch/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
					args = { "-m", "debugpy.adapter" },
					options = {
						source_filetype = "python",
					},
				})
			end
		end

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
		-- vscode and deno adapter
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				-- command = "node",
				-- args = { "/home/arch/.local/share/nvim/js-debug/src/dapDebugServer.js", "${port}" },
				command = "js-debug-adapter",
				args = { "${port}" },
			},
		}

		-- deno supposed to work with typescript it sometimes does
		-- dap.configurations.javascript = {
		-- 	{
		-- 		type = "pwa-node",
		-- 		request = "launch",
		-- 		name = "Launch file",
		-- 		runtimeExecutable = "deno",
		-- 		runtimeArgs = {
		-- 			"run",
		-- 			"--inspect-wait",
		-- 			"--allow-all",
		-- 		},
		-- 		program = "${file}",
		-- 		cwd = "${workspaceFolder}",
		-- 		attachSimplePort = 9229,
		-- 	},
		-- }
		-- vscode
		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}
		dap.configurations.typescript = dap.configurations.javascript
	end,
}
