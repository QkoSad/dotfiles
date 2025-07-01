return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = true,
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
