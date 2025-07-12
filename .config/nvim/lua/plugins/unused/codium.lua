return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  ft = { "typescriptreact", "typescript", "javascript", "javascriptreact" },
  enabled = false,
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<A-f>", neocodeium.accept)
  end,
}
