return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = false,
		opts = {},
		dependencies = {
			{
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	},
}
