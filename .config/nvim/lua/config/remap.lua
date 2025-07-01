-- CONTENTS OF REMAP
-- leader space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set('n','<leader>pv',':Lex 30 <cr>')

-- don't move the cursor for J
-- vim.keymap.set("n", "J", "mzJ`z")
-- -- center screen on movement
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
-- -- when you yank and the highlight and delete the delete does not move in reg
-- vim.keymap.set("x", "<leader>p", '"_dP')
-- --  copy to system clipboard
-- vim.keymap.set("n", "<leader>y", '"+y')
-- vim.keymap.set("v", "<leader>y", '"+y')
-- vim.keymap.set("n", "<leader>Y", '"+y$')
-- -- delete to void reg
-- vim.keymap.set("n", "<leader>d", '"_d')
-- vim.keymap.set("v", "<leader>d", '"_d')
-- vim.keymap.set("n", "<leader>D", '"_D')
-- -- vim.keymap.set("n", "<leader>x", '"_x')
-- -- remove Q
-- vim.keymap.set("n", "Q", "<nop>")
-- -- remove q: , type it too many times trying to exit
-- -- <C-f> does the same thing in command mode
-- vim.keymap.set("n", "q:", "<nop>")
-- -- puts the current word under cursort to be replaced
-- vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- -- buffer navigation
-- vim.keymap.set("n", "<C-l>", ":bnext<CR>")
-- vim.keymap.set("n", "<C-h>", ":bprevious<CR>")
-- vim.keymap.set("n", "<leader>bd", ":bp | sp | bn | bd<CR>")
-- -- change dir
-- vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>")
-- --window
-- -- vim.keymap.set("n", "<C-w>x", "<C-w>q")
-- vim.keymap.set("n", "<A-h>", "<C-w>h")
-- vim.keymap.set("n", "<A-j>", "<C-w>j")
-- vim.keymap.set("n", "<A-k>", "<C-w>k")
-- vim.keymap.set("n", "<A-l>", "<C-w>l")
-- vim.keymap.set("n", "<A-x>", "<C-w>x")
-- vim.keymap.set("n", "<A-w>", "<C-w>w")
-- vim.keymap.set("n", "<A-q>", "<C-w>q")
--
-- -- quickix
-- vim.keymap.set("n", "<leader>q", ":copen<CR>")
-- vim.keymap.set("n", "<leader>l", ":lli<CR>")
-- vim.keymap.set("n", "]c", ":cn<CR>")
-- vim.keymap.set("n", "[c", ":cp<CR>")
-- toggle term
local termtoggle = require("stx.term") -- I have put the above code under ~/.config/nvim/lua/stx/term.lua
vim.keymap.set("n", "<C-t>", termtoggle.toggleterm, { desc = "toggle terminal" })
vim.keymap.set("t", "<C-t>", termtoggle.toggleterm, { buffer = termtoggle.buf, desc = "toggle terminal" })
