return {
	"dmmulroy/tsc.nvim",
	cmd = "TSC",
	config = function()
		require("tsc").setup({
			auto_start_watch_mode = false,
			use_trouble_qflist = true,
			flags = {
				noEmit = true,
				watch = false,
			},
		})
	end,
}
