return {
	"nvim-pack/nvim-spectre", -- keybidnings = ys, cs, ds
	dependencies = { "nvim-pack/nvim-spectre" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
		{
			"<leader>Sw",
			'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
			desc = "Search current word",
		},
		{
			"<leader>Sw",
			'<esc><cmd>lua require("spectre").open_visual()<CR>',
			desc = "Search current word",
			mode = "v",
		},
		{
			"<leader>Sp",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			desc = "Search on current file",
		},
	},
}
