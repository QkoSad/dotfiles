return {
  -- { "rose-pine/neovim", name = "rose-pine" },
  -- { "folke/tokyonight.nvim" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "nxvu699134/vn-night.nvim" },
  -- { "EdenEast/nightfox.nvim", },
  -- { "navarasu/onedark.nvim" },
  -- { "Shatur/neovim-ayu" },
  -- { "Yagua/nebulous.nvim" },
  -- { "navarasu/onedark.nvim" },
  -- { "marko-cerovac/material.nvim" },
  -- { "Matsuuu/pinkmare" },
  -- { "DilanGMB/nightbuddy" },
  -- { "ChristianChiarulli/nvcode-color-schemes.vim" },
  -- { "bkegley/gloombuddy" },
  -- { "nekonako/xresources-nvim" },
  -- { "fenetikm/falcon" },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { "vague2k/vague.nvim" },
  { "https://github.com/darianmorat/gruvdark.nvim" },
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerAttachToBuffer",
    config = function() require("colorizer").setup() end,
  },
}
