return {
	"danymat/neogen",
	cmd = { "Neogen" },
	config = function()
		require("neogen").setup({
			languages = {
				["typescriptreact.tsdoc"] = require("neogen.configurations.typescriptreact"),
			},
		})
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
