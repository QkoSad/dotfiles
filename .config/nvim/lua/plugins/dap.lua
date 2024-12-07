return {
	"mfussenegger/nvim-dap",
	-- keys ={},
	config = function()
		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "netcoredbg",
			args = { "--interpreter=vscode" },
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

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll:", vim.fn.getcwd() .. "/bin/Debug/", "file")
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

		vim.keymap.set("n", "<Leader>bc", dap.continue)
		vim.keymap.set("n", "<Leader>bs", dap.terminate)
		vim.keymap.set("n", "<Leader>bb", dap.toggle_breakpoint)
		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F2>", dap.step_into)
		vim.keymap.set("n", "<F3>", dap.step_over)
		vim.keymap.set("n", "<F4>", dap.step_out)
		vim.keymap.set("n", "<F5>", dap.step_back)
		vim.keymap.set("n", "<F13>", dap.restart)
	end,
}
