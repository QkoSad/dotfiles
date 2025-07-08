return {
	"danymat/neogen",
	cmd = { "Neogen" },
	config = true,
	keys = { {
		"<leader>n",
		function()
			require("neogen").generate()
		end,
	} },
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
