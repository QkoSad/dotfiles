return {
  {
    dir = "~/.config/nvim/localPlugins/dart.nvim",
    opts = {
      buflist = { "z", "x", "c", "v", "b", "n" },
      -- Set an individual mapping to an empty string to disable,
      mappings = {
        mark = "mm", -- Mark current buffer
        jump = "m", -- Jump to buffer marked by next character i.e `;a`
        pick = "mp", -- Open Dart.pick
        next = "<C-l>", -- Cycle right through the tabline
        prev = "<C-h>", -- Cycle left through the tabline
        unmark_all = "mu",
      },
      buffer_placement = "right",
    },
  },
  { "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
}
