return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>R", "", desc = "+Kuala", mode = { "n", "v" } },
    { "<leader>Rs", desc = "Send request(Kuala)" },
    { "<leader>Ra", desc = "Send all requests(Kuala)" },
    { "<leader>Rb", desc = "Open scratchpad(Kuala)" },
  },
  ft = { "http", "rest" },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
  },
}
