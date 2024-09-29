return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"folke/tokyonight.nvim",
	},
	{
		"tjdevries/colorbuddy.nvim",
	},
	{
		"ellisonleao/gruvbox.nvim",
	},
	{ "nxvu699134/vn-night.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{
		"navarasu/onedark.nvim",
		config = function()
			-- 	require("onedark").setup({
			-- 		style = "deep",
			-- 	})
			-- 	require("onedark").load()
			-- 	vim.cmd("colorscheme onedark")
			-- 	vim.cmd("colorscheme tokyonight-night")
			vim.cmd("colorscheme duskfox")
		end,
	},
}
