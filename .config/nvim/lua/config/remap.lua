-- CONTENTS OF REMAP
-- leader space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_set_keymap('n','<leader>pv',':Lex 30 <cr>',{desc=""})

-- don't move the cursor for J
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines without moving cursor" })
-- center screen on movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search center cursor" })
-- when you yank and the highlight and delete the delete does not move in reg
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over highlighted area without cutting" })
--  copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to sys clip" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to sys clip" })
vim.keymap.set("n", "<leader>Y", '"+y$', { desc = "Yank to sys clip" })
-- delete to void reg
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to void reg" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete to void reg" })
vim.keymap.set("n", "<leader>D", '"_D', { desc = "Delete to void reg" })
-- vim.keymap.set("n", "<leader>x", '"_x',{ desc=""})
-- remove Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Remove Q" })
-- remove q: , type it too many times trying to exit
-- <C-f> does the same thing in command mode
vim.keymap.set("n", "q:", "<nop>", { desc = "Remove q:" })
-- puts the current word under cursort to be replaced
-- vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],{ desc="Put current word into search"})
-- buffer navigation
vim.keymap.set("n", "<C-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", ":bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<A-Tab>", ":b#<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", ":bp | sp | bn | bd<CR>", { desc = "Delete buffer" })
-- tabs
vim.keymap.set("n", "<C-j>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<C-k>", "gT", { desc = "Prev buffer" })

-- change dir
vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>", { desc = "Change dir" })
--window
-- vim.keymap.set("n", "<C-w>x", "<C-w>q",{ desc=""})
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Left Window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Bottom Window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Top Window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Right Window" })
vim.keymap.set("n", "<A-w>", "<C-w>w", { desc = "Prev Window" })
vim.keymap.set("n", "<A-q>", "<C-w>q", { desc = "Close window" })
vim.keymap.set("n", "<A-s>", "<C-w>s", { desc = "Side split" })
vim.keymap.set("n", "<A-v>", "<C-w>v", { desc = "Vertical split" })
vim.keymap.set("n", "<A-_>", "<C-w>_", { desc = "Minimize vertical" })
vim.keymap.set("n", "<A-=>", "<C-w>=", { desc = "Normalize size" })

-- quickfix
vim.keymap.set("n", "<leader>q", function()
	vim.cmd(vim.fn.getqflist({ winid = 0 }).winid > 0 and "cclose" or "copen")
end, { desc = "Toggle Quickfix" })

vim.keymap.set("n", "<leader>l", function()
	vim.cmd(vim.fn.getloclist(0, { winid = 0 }).winid > 0 and "lclose" or "lopen")
end, { desc = "Toggle Location", silent = true })

-- vim.keymap.set("n", "<leader>q", ":copen<CR>", { desc = "Open quickfix" })
-- vim.keymap.set("n", "<leader>l", ":lli<CR>", { desc = "Open location" })
vim.keymap.set("n", "]c", ":cn<CR>", { desc = "Next quickfix" })
vim.keymap.set("n", "[c", ":cp<CR>", { desc = "Prev quickfix" })

--terminal
-- vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", { desc = "Left Window" })
-- vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", { desc = "Bottom Window" })
-- vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", { desc = "Top Window" })
-- vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", { desc = "Right Window" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })
