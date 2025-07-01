return {
	"folke/which-key.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	cmd = "WhichKey",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show()
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = true,
}
