-- check iron nvim if dont use images
-- this needs some venv magick to work
return {
  {
    "benlubas/molten-nvim",
    enabled = true,
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/molten/moltenvenv/bin/python3")
      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      -- vim.g.molten_auto_open_output = false

      -- this guide will be using image.nvim
      -- Don't forget to setup and install the plugin if you want to view image outputs
      vim.g.molten_image_provider = "image.nvim"

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true
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
    enabled = true,
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
