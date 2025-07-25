return {
  "folke/which-key.nvim",
  opts = {
    delay = 1000,
  },
  cmd = "WhichKey",
  keys = {
    {
      "<leader>?",
      function() require("which-key").show() end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = true,
}
