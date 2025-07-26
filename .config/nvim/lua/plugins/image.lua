return {
  "3rd/image.nvim",
  build = false,

  opts = {
    backend = "kitty", -- whatever backend you would like to use
    max_width = 100,
    max_height = 12,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    -- without thisinline images dont work
    window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  },
}
