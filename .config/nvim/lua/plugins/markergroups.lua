return {
  "jameswolensky/marker-groups.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
  },
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("marker-groups").setup({
      data_dir = vim.fn.system({ "git", "rev-parse", "--show-toplevel" }):sub(1, -2) .. "/.marker-groups"
        or vim.fn.stdpath("data") .. "/.marker-groups",
      -- data_dir = vim.fn.stdpath("data") .. "/marker-groups",
      keymaps = {
        enabled = false,
      },
    })
  end,
}
