return {
	-- fzf for telescop otherwise cant sapce and choose directroies and i have
	-- to speciffy them in full like plugin/lua. With it i just go "plu lu"
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
		},
		config = function()
			require("telescope").setup({
				-- defaults = {
				-- 	file_ignore_patterns = { "bin", "obj" },
				-- },
				extensions = { fzf = {} },
			})
			require("telescope").load_extension("fzf")
		end,
	},
}
