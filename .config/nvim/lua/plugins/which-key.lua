return {
  "folke/which-key.nvim",
  opts = {
    -- remove triggers for normal mode so i can only use the register and mark
    -- additions
    triggers = {
      {},
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function() require("which-key").show() end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = true,
}
