return {
	"artemave/workspace-diagnostics.nvim",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"folke/trouble.nvim",
	},
	config = function()
		require("workspace-diagnostics").setup({
			workspace_files = function() -- Customize this function to return project files.
				return vim.fn.systemlist("git ls-files") -- Example to get files from Git.
			end,
			-- Add any other configuration options as needed.
		})
	end,
}
