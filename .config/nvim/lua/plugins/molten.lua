return {
  "benlubas/molten-nvim",
  enabled = true,
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  init = function()
    -- vim.g.molten_output_win_max_height = 20
    vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/molten/moltenvenv/bin/python3")
    -- vim.g.molten_auto_image_popup = true
    vim.g.molten_auto_open_output = false
    vim.g.molten_cover_empty_lines = true
    -- vim.g.molten_copy_output = true
    vim.g.molten_enter_output_behavior = "open_and_enter"
    vim.g.molten_image_location = "both"
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_crop_border = false
    vim.g.molten_output_virt_lines = true
    vim.g.molten_output_show_more = true
    vim.g.molten_output_win_max_height = 500
    vim.g.molten_output_win_max_width = 500
    vim.g.molten_output_win_style = "minimal"
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_virt_text_max_lines = 10000
    vim.opt.scrolloff = 0
  end,
  keys = {
    { "<leader>m", "", desc = "+Molten", mode = { "n", "v" } },
    {
      "<localleader>mi",
      function()
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
        if venv ~= nil then
          -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
          venv = string.match(venv, "/.+/(.+)")
          vim.cmd(("MoltenInit %s"):format(venv))
        else
          vim.cmd("MoltenInit python3")
        end
      end,
      { desc = "Initialize Molten for python3", silent = true },
    },
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
    {
      "<localleader>me",
      ":noautocmd MoltenEnterOutput<CR>",
      mode = { "n" },
      { silent = true, desc = "show/enter output" },
    },
  },
}
