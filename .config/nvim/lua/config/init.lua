-- CONTENTS OF INIT.LUA

local autocmd = vim.api.nvim_create_autocmd

-- autocmd("BufWritePre", {
--   pattern = "*.md",
--   callback = function()
--     local line = vim.fn.getline("$")
--     if line ~= "" and line:sub(-1) ~= "\n" then vim.fn.append(vim.fn.line("$"), "") end
--   end,
-- })

autocmd({
  "BufWritePost",
}, {
  pattern = { "*" },
  callback = function() require("lint").try_lint() end,
})

-- highlights searched text, removes highlight when no longer searching
autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function() vim.cmd.nohlsearch() end)
    end
  end,
})
-- set cwd to the entered file
-- why :p:h https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers
-- or :h filename-modifiers
autocmd("VimEnter", {
  pattern = "*",
  command = "silent! lcd %:p:h",
})
-- set spelling for markdown files
autocmd({
  "BufEnter",
}, {
  pattern = { "*.md,*.txt" },
  callback = function()
    -- :setlocal spell spelllang=en_us
    vim.opt_local.spelllang = "en_us"
    vim.opt.colorcolumn = "80"
  end,
})

-- highlight when yanking
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "Visual",
      timeout = 300,
    })
  end,
})

-- format with conform.nvim plugin
autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args) require("conform").format({ bufnr = args.buf }) end,
})
-- set terminal color to nvim bg color, so it removes the terminal lines around
-- nvim
-- autocmd({ "UIEnter", "ColorScheme" }, {
-- 	callback = function()
-- 		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
-- 		if not normal.bg then
-- 			return
-- 		end
-- 		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
-- 	end,
-- })
-- autocmd("UILeave", {
-- 	callback = function()
-- 		io.write("\027]111\027\\")
-- 	end,
-- })
