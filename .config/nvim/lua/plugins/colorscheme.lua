return {
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "folke/tokyonight.nvim", },
	-- { "ellisonleao/gruvbox.nvim", },
	-- { "nxvu699134/vn-night.nvim" },
	-- { "navarasu/onedark.nvim" },
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- 	require("onedark").setup({
			-- 		style = "deep",
			-- 	})
			-- 	require("onedark").load()
			-- 	vim.cmd("colorscheme tokyonight-night")
			vim.cmd("colorscheme duskfox")
		end,
	},
}
