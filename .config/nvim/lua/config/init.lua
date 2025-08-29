-- CONTENTS OF INIT.LUA

local autocmd = vim.api.nvim_create_autocmd

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
