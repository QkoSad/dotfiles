return {
  "nvimtools/hydra.nvim",
  enabled = true,
  config = function()
    local Hydra = require("hydra")
    -- local dap = require("dap")
    Hydra({
      name = "window",
      mode = "n",
      body = "<C-w>",
      hint = [[ Resize window ]],
      heads = {
        { ">", "<C-w>>", { desc = "Increase windth" } },
        { "<", "<C-w><", { desc = "Decrease windth" } },
        { "+", "<C-w>+", { desc = "Increase hight" } },
        { "-", "<C-w>-", { desc = "Decrease hight" } },
      },
    })
    local function keys(str)
      return function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "m", true) end
    end
    Hydra({
      name = "QuartoNavigator",
      hint = [[
      _j_/_k_: move down/up  _r_: run cell
      _l_: run line  _R_: run above
      ^^     _<esc>_/_q_: exit ]],
      config = {
        color = "pink",
        invoke_on_body = true,
      },
      mode = { "n" },
      body = "<localleader>j", -- this is the key that triggers the hydra
      heads = {
        { "j", keys("]b") },
        { "k", keys("[b") },
        { "r", ":QuartoSend<CR>" },
        { "l", ":QuartoSendLine<CR>" },
        { "R", ":QuartoSendAbove<CR>" },
        { "<esc>", nil, { exit = true } },
        { "q", nil, { exit = true } },
      },
    })

    -- TODO: nah ill figure this one next time
    -- 	Hydra({
    -- 		-- string? only used in auto-generated hint
    -- 		name = "Debug",
    --
    -- 		-- string | string[] modes where the hydra exists, same as `vim.keymap.set()` accepts
    -- 		mode = "n",
    --
    -- 		-- string? key required to activate the hydra, when excluded, you can use
    -- 		-- Hydra:activate()
    -- 		body = "<leader>bh",
    --
    -- 		-- these are explained below
    -- 		hint = [[ Debug mode ]],
    -- 		config = {
    -- 		foreign_keys= run,
    -- 		exit = false },
    -- 		heads = {
    -- 			{
    -- 				"c",
    -- 				function()
    -- 					dap.continue()
    -- 				end,
    -- 				desc = "Run/Continue",
    -- 			},
    -- 			{
    -- 				"a",
    -- 				function()
    -- 					dap.continue({ before = get_args })
    -- 				end,
    -- 				desc = "Run with Args",
    -- 			},
    -- 			{
    -- 				"g",
    -- 				function()
    -- 					dap.goto_()
    -- 				end,
    -- 				desc = "Go to Line (No Execute)",
    -- 			},
    -- 			{
    -- 				"i",
    -- 				function()
    -- 					dap.step_into()
    -- 				end,
    -- 				desc = "Step Into",
    -- 			},
    -- 			{
    -- 				"J",
    -- 				function()
    -- 					dap.down()
    -- 				end,
    -- 				desc = "Down",
    -- 			},
    -- 			{
    -- 				"K",
    -- 				function()
    -- 					dap.up()
    -- 				end,
    -- 				desc = "Up",
    -- 			},
    -- 			{
    -- 				"L",
    -- 				function()
    -- 					dap.run_last()
    -- 				end,
    -- 				desc = "Run Last",
    -- 			},
    -- 			{
    -- 				"o",
    -- 				function()
    -- 					dap.step_out()
    -- 				end,
    -- 				desc = "Step Out",
    -- 			},
    -- 			{
    -- 				"O",
    -- 				function()
    -- 					dap.step_over()
    -- 				end,
    -- 				desc = "Step Over",
    -- 			},
    -- 			{
    -- 				"p",
    -- 				function()
    -- 					dap.pause()
    -- 				end,
    -- 				desc = "Pause",
    -- 			},
    -- 			{
    -- 				"r",
    -- 				function()
    -- 					dap.repl.toggle()
    -- 				end,
    -- 				desc = "Toggle REPL",
    -- 			},
    -- 			{
    -- 				"s",
    -- 				function()
    -- 					dap.session()
    -- 				end,
    -- 				desc = "Session",
    -- 			},
    -- 			{
    -- 				"t",
    -- 				function()
    -- 					dap.terminate()
    -- 				end,
    -- 				desc = "Terminate",
    -- 			},
    -- 			{
    -- 				"w",
    -- 				function()
    -- 					require("dap.ui.widgets").hover()
    -- 				end,
    -- 				desc = "Widgets",
    -- 			},
    -- 		},
    -- 	})
  end,
}
