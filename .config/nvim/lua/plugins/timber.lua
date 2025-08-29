-- alternative is andrewferrier/debugprint.nvim
return {
  "Goose97/timber.nvim",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("timber").setup({
      default_keymaps_enabled = false,
      keymaps = {
        -- Set to false to disable the default keymap for specific actions
        insert_log_below = "g?j",
        insert_log_above = "g?k",
        insert_plain_log_below = "g?o",
        insert_plain_log_above = "g?O",
        insert_batch_log = "g?b",
        add_log_targets_to_batch = "g?a",
        insert_log_below_operator = "g?J",
        insert_log_above_operator = "g?K",
        insert_batch_log_operator = "g?B",
        add_log_targets_to_batch_operator = "g?A",
      },
    })
  end,
}
