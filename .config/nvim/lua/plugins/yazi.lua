return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>t",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
    init = function() vim.g.loaded_netrwPlugin = 1 end,
  },
}
