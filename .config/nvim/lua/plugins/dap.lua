return {
  "mfussenegger/nvim-dap",
  -- keys ={},
  config = function()
    local dap = require("dap")
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
    vim.keymap.set("n", "<Leader>bc", function()
      dap.continue()
    end, { desc = "Debug start/continue" })

    vim.keymap.set("n", "<Leader>bs", function()
      dap.terminate({}, {}, function()
        print("DAP session finished")
      end)
    end, { desc = "Debug stop/delete session" })

    vim.keymap.set("n", "<Leader>bb", function()
      dap.toggle_breakpoint()
    end, { desc = "Debug toggle breakpoint" })

    -- vim.keymap.set("n", "<Leader>bo", function()
    -- 	dap.step_over()
    -- end, { desc = "Debug step over" })
    --
    -- vim.keymap.set("n", "<Leader>bi", function()
    -- 	dap.step_into()
    -- end, { desc = "Debug step into" })
    --
    -- vim.keymap.set("n", "<Leader>bu", function()
    -- 	dap.step_out()
    -- end, { desc = "Debug step out" })
    --
    --
    -- vim.keymap.set("n", "<Leader>bB", function()
    -- 	dap.set_breakpoint()
    -- end, { desc = "Debug set breakpoint" })
    --
    -- vim.keymap.set("n", "<Leader>bk", function()
    -- 	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    -- end, { desc = "Debug set breackpoint with log message" })
    --
    -- vim.keymap.set("n", "<Leader>br", function()
    -- 	dap.repl.open()
    -- end, { desc = "Debug open REPL" })
    --
    -- vim.keymap.set("n", "<Leader>bR", function()
    -- 	dap.repl.close()
    -- end, { desc = "Debug close REPL" })
    --
    -- vim.keymap.set("n", "<Leader>bl", function()
    -- 	dap.run_last()
    -- end, { desc = "Debug run last" })
  end,
}
