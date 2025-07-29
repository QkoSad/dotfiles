-- CONTENTS OF COLORS
-- Additional coloring for vn-night color scheme
function LineNumberColors()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#7aa2f7", bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#f7768e", bold = true })
  vim.api.nvim_set_hl(0, "SpellBad", { fg = "red", undercurl = true })
end

LineNumberColors()
