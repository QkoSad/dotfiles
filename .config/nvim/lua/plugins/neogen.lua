return {
  "danymat/neogen",
  cmd = { "Neogen" },
  config = true,
  keys = { {
    "<leader>n",
    function() require("neogen").generate() end,
    { desc = "Neogen" },
  } },
}
