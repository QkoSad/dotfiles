return {
  "danymat/neogen",
  cmd = { "Neogen" },
  opts = {
    snippet_engine = "mini",
  },
  config = true,
  keys = { {
    "<leader>n",
    function() require("neogen").generate() end,
    desc = "Neogen",
  } },
}
