return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "folke/tokyonight.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "nxvu699134/vn-night.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "Shatur/neovim-ayu" },
	{ "Yagua/nebulous.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "marko-cerovac/material.nvim" },
	{ "Matsuuu/pinkmare" },
	{ "DilanGMB/nightbuddy" },
	{ "ChristianChiarulli/nvcode-color-schemes.vim" },
	{ "bkegley/gloombuddy" },
	{ "nekonako/xresources-nvim" },
	{ "fenetikm/falcon" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- 	require("onedark").setup({
			-- 		style = "deep",
			-- 	})
			-- 	require("onedark").load()
			-- 	vim.cmd("colorscheme tokyonight-night")
			vim.cmd("colorscheme kanagawa-wave")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
