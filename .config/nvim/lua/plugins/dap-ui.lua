return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
    {
      "theHamsta/nvim-dap-virtual-text",
      lazy = true,
      opts = {},
    },
  },
  lazy = true,
  opts = { floating = { border = "rounded" } },
  config = function(_, opts)
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    dapui.setup(opts)
  end,
}
