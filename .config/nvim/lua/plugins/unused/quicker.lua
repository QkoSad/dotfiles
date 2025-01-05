return {
	"stevearc/quicker.nvim",
	-- event = "FileType qf",
	event = "VeryLazy",
	---@module "quicker"
	---@type quicker.SetupOptions
	enabled = false,
	opts = {},
	config = function()
		require("quicker").setup({
			keys = {
				{
					">",
					function()
						require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
					end,
					desc = "Expand quickfix context",
				},
				{
					"<",
					function()
						require("quicker").collapse()
					end,
					desc = "Collapse quickfix context",
				},
			},
		})
	end,
}
