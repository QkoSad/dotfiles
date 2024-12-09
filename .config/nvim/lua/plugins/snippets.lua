return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = true,

		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			-- local ls = require("luasnip")
			-- ls.filetype_extend("typescript", { "javascript" })
		end,
	},
}
