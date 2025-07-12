return {
  "dmmulroy/tsc.nvim",
  enabled = true,
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
