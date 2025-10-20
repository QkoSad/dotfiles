return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    system_clipboard = {
      sync_with_ring = false,
    },
    highlight = {
      on_put = false,
      on_yank = false,
    },
    preserve_cursor_position = {
      enabled = true,
    },
  },
  keys = {
    { "<leader>fy", mode = { "n" }, function() Snacks.picker.yanky() end, desc = "Yanky ring" },
  },
}
