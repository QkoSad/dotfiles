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
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
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

-- add shortcuts for lsp
autocmd("LspAttach", {
  callback = function(e)
    local opts = { buffer = e.buf }
    -- defaults kept here for reference
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set({ "n", "x" }, "<F3>", function()
    -- 	vim.lsp.buf.format({ async = true })
    -- end, opts)
    vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
    -- no sure what this does stole it from primegen might need it later
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  end,
})
