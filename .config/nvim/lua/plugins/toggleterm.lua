return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	keys = {
		{ "<C-;>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
	},
}
