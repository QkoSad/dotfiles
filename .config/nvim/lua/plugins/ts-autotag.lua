return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	ft = { "typescriptreact", "html", "javascriptreact" },
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
