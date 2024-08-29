-- CONTENTS OF COLORS
-- Additional coloring for vn-night color scheme
function LineNumberColors()
	-- coloring line numbers
	-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#34B4FE', bold = true })
	-- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
	-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#F7454B', bold = true })
	-- coloring folds
	-- vim.api.nvim_set_hl(0, 'Folded', { fg = '#a986f3', bg = '#242752' })
	-- coloring the other parentesis
	-- vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#000000', bg = '#FFFFFF' })
	-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#193549' })
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#7aa2f7", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#f7768e", bold = true })
	vim.api.nvim_set_hl(0, "SpellBad", { fg = "red", undercurl = true })
end

LineNumberColors()
