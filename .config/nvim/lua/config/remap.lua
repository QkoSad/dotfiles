-- CONTENTS OF REMAP
-- leader space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set('n','<leader>pv',':Lex 30 <cr>')

vim.keymap.set("n", "<C-w>x", "<C-w>q")
-- don't move the cursor for J
vim.keymap.set("n", "J", "mzJ`z")
-- center screen on movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- when you yank and the highlight and delete the delete does not move in reg
vim.keymap.set("x", "<leader>p", '"_dP')
--  copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')
-- delete to void reg
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>D", '"_D')
vim.keymap.set("n", "<leader>x", '"_x')
-- remove Q
vim.keymap.set("n", "Q", "<nop<")
-- puts the current word under cursort to be replaced
vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- buffer navigation
vim.keymap.set("n", "<C-l>", ":bnext<CR>")
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
-- change list
vim.keymap.set("n", "<leader>cn", ":cn<CR>")
vim.keymap.set("n", "<leader>cp", ":cp<CR>")
-- change dir
vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>")

-- find a way to set keymaps dynamically
-- this does not work
-- Flag = true
-- vim.keymap.set("n", "<leader>ct", function()
--   if (Flag) then
--     vim.keymap.set("n", "<C-l>", ":cn<CR>")
--     vim.keymap.set("n", "<C-h>", ":cp<CR>")
--     Flag=false
--   else
--     vim.keymap.set("n", "<C-l>", "gt")
--     vim.keymap.set("n", "<C-h>", "gT")
--     Flag=true
--   end
-- end)
--
