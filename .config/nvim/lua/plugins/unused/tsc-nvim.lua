return {
	"dmmulroy/tsc.nvim",
	enabled = false,
	cmd = "TSC",
	opts = {
		auto_start_watch_mode = false,
		use_trouble_qflist = true,
		flags = {
			noEmit = true,
			watch = false,
		},
	},
}
