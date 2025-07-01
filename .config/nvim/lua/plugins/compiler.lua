return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
		keys = {
			-- Open compiler
			{ "<F6>", "<cmd>CompilerOpen<cr>", desc = "Open compiler" },

			{ "<F7>", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", desc = "Restart Compiler" },

			{ "<F8>", "<cmd>CompilerToggleResults<cr>", desc = "Compiler Results" },
		},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
}
