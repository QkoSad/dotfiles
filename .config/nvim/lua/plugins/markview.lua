-- return {
-- 	"OXY2DEV/markview.nvim",
-- 	lazy = false,
--
-- 	-- For `nvim-treesitter` users.
-- 	priority = 49,
-- 	-- For blink.cmp's completion
-- 	-- source
-- 	dependencies = {
-- 		"saghen/blink.cmp",
-- 	},
-- 	opts = {
-- 		html = { enable = true },
-- 	},
-- 	latex = { enable = true },
-- }
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  ft = "markdown",
}
