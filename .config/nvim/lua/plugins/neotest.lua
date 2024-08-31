return {
	"nvim-neotest/neotest",
	cmd = { "Neotest" },
	dependencies = {
		"nvim-neotest/neotest-jest",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return {
			-- your neotest config here
			adapters = {
				require("neotest-jest"),
			},
		}
	end,
	config = function(_, opts)
		-- get neotest namespace (api call creates or returns namespace)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		require("neotest").setup(opts)
	end,
}
