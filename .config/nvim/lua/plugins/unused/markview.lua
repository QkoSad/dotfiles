return {
	"OXY2DEV/markview.nvim",
	-- lazy = false, -- Recommended
	ft = "markdown",
	enabled = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		latex = {
			enable = false,
		},
		modes = { "n", "i", "no", "c" },
		hybrid_modes = { "i" },

		-- This is nice to have
		callbacks = {
			on_enable = function(_, win)
				vim.wo[win].conceallevel = 2
				vim.wo[win].concealcursor = "nc"
			end,
		},
	},
}
