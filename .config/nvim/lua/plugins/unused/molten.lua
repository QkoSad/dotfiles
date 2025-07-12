-- check iron nvim if dont use images
-- this needs some venv magick to work
return {
  {
    "benlubas/molten-nvim",
    enabled = false,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { "<leader>m", "", desc = "+Molten", mode = { "n", "v" } },
      { "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" } },
      {
        "<leader>mo",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "Run operator selection(Molten)" },
      },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line(Molten)" } },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell(Molten)" } },
      {
        "<leader>mv",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = { "v" },
        { silent = true, desc = "evaluate visual selection" },
      },
    },
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    enabled = false,
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
      backend = "ueberzug", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
