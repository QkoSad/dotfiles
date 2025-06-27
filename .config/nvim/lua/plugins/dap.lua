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
