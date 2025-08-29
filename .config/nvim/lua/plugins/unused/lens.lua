-- migth be usefull for now not needed
return {
  "oribarilan/lensline.nvim",
  tag = "1.0.0", -- or: branch = 'release/1.x' for latest non-breaking updates
  event = "LspAttach",
  enabled = false,
  config = function() require("lensline").setup() end,
}
