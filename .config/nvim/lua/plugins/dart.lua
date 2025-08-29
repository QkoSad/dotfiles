return {
  dir = "~/.config/nvim/localPlugins/dart.nvim",
  opts = {
    buflist = { "z", "x", "c", "v", "b", "n", "m" },
    -- Set an individual mapping to an empty string to disable,
    mappings = {
      mark = "''", -- Mark current buffer
      jump = "'", -- Jump to buffer marked by next character i.e `;a`
      pick = "'p", -- Open Dart.pick
      next = "<C-l>", -- Cycle right through the tabline
      prev = "<C-h>", -- Cycle left through the tabline
      unmark_all = "'u",
    },
    buffer_placement = "rigth",
  },
}
