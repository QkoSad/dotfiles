return {
	"dmmulroy/ts-error-translator.nvim",
	ft = "typescriptreact",
	config = function()
		require("ts-error-translator").setup()
	end,
}
