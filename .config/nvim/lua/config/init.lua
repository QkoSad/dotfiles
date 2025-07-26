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
-- MOLTEN
-- change the configuration when editing a python file
autocmd("BufEnter", {
  pattern = "*.py",
  callback = function(e)
    if string.match(e.file, ".otter.") then return end
    if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
      vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
      vim.fn.MoltenUpdateOption("virt_text_output", false)
    else
      vim.g.molten_virt_lines_off_by_1 = false
      vim.g.molten_virt_text_output = false
    end
  end,
})

-- Undo those config changes when we go back to a markdown or quarto file
autocmd("BufEnter", {
  pattern = { "*.qmd", "*.md", "*.ipynb" },
  callback = function(e)
    if string.match(e.file, ".otter.") then return end
    if require("molten.status").initialized() == "Molten" then
      vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
      vim.fn.MoltenUpdateOption("virt_text_output", true)
    else
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_output = true
    end
  end,
})
-- Provide a command to create a blank new Python notebook
-- note: the metadata is needed for Jupytext to understand how to parse the notebook.
-- if you use another language than Python, you should change it in the template.
local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

local function new_notebook(filename)
  local path = filename .. ".ipynb"
  local file = io.open(path, "w")
  if file then
    file:write(default_notebook)
    file:close()
    vim.cmd("edit " .. path)
  else
    print("Error: Could not open new notebook file for writing.")
  end
end

vim.api.nvim_create_user_command("NewNotebook", function(opts) new_notebook(opts.args) end, {
  nargs = 1,
  complete = "file",
})
