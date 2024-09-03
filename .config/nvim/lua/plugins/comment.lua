-- return {
-- 	"terrortylor/nvim-comment",
-- 	opts = {
-- 		hook = function()
-- 			require("ts_context_commentstring").update_commentstring()
-- 		end,
-- 	},
-- 	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
-- }
--
return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
}
