return {
  "nvimtools/hydra.nvim",
  event = "VeryLazy",
  config = function()
    local Hydra = require("hydra")
    -- local dap = require("dap")
    Hydra({
      name = "window",
      mode = "n",
      body = "<C-w>",
      config = {
        hint = {
          type = "statusline",
          show_name = false,
        },
      },
      heads = {
        { ">", "<C-w>>" },
        { "<", "<C-w><" },
        { "+", "<C-w>+" },
        { "-", "<C-w>-" },
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
        invoke_on_body = true,
      },
      mode = { "n" },
      body = "<leader>j", -- this is the key that triggers the hydra
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

    Hydra({
      name = "Debug",
      hint = [[ _b_: breakpoint _c_: continue _C_ : run to cursor _i_: step into _o_: step out _O_: step over _t_: stop _w_: stop _B_: BP condition _p_: pause _<esc>_/_q_: exit]],
      config = {
        invoke_on_body = true,
        foreign_keys = "run",
        color = "pink",
      },
      mode = { "n" },
      body = "<leader>b", -- this is the key that triggers the hydra
      heads = {
        { "B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end },
        { "b", function() require("dap").toggle_breakpoint() end },
        { "c", function() require("dap").continue() end },
        { "C", function() require("dap").run_to_cursor() end },
        { "i", function() require("dap").step_into() end },
        { "o", function() require("dap").step_out() end },
        { "O", function() require("dap").step_over() end },
        { "p", function() require("dap").pause() end },
        { "t", function() require("dap").terminate() end },
        { "w", function() require("dap.ui.widgets").preview() end },
        { "<esc>", nil, { exit = true } },
        { "q", nil, { exit = true } },
        -- { "a", function() require("dap").continue({ before = get_args }) end },
        -- { "r", function() require("dap").repl.toggle() end },
        -- { "s", function() require("dap").session() end },
        -- { "j", function() require("dap").down() end },
        -- { "k", function() require("dap").up() end },
        -- { "l", function() require("dap").run_last() end },
        -- { "g", function() require("dap").goto_() end },
      },
    })
  end,
}
