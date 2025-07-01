return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		delay = 2000,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<C-d>", "<C-d>zz", desc = "Move down" },
			{ "J", "mzJ`z", desc = "Join lines without moving cursor" },
			{ "<C-u>", "<C-u>zz", desc = "Move cursor up" },
			{ "n", "nzzzv", desc = "Next search" },
			{ "N", "Nzzzv", desc = "Prev search" },
			-- when you yank and the highlight and delete the delete does not move in reg
			{ "<leader>p", '"_dP', desc = "Paste over highligthed area without register ", mode = "x" },
			--  copy to system clipboard
			{ "<leader>y", '"+y', desc = "Copy to sys clip" },
			{ "<leader>y", '"+y', desc = "Copy to sys clip", mode = "v" },
			{ "<leader>Y", '"+y$', desc = "Copy to end of line to sys clip" },
			-- delete to void reg
			{ "<leader>d", '"_d', desc = "Delete to void reg" },
			{ "<leader>d", '"_d', desc = "Delete to void reg", mode = "v" },
			{ "<leader>D", '"_D', desc = "Delete to end of line to void reg" },
			-- vim.keymap.set("n", "<leader>x", '"_x')
			-- remove Q
			{ "Q", "<nop>", desc = "Remove Q" },
			-- remove q: , type it too many times trying to exit
			-- <C-f> does the same thing in command mode
			-- { "q:", "<nop>", desc = "Remove q:" },
			-- puts the current word under cursort to be replaced
			{
				"<leader>s",
				[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
				mode = "v",
				desc = "Replace curr word",
			},
			-- buffer navigation
			{ "<C-l>", ":bnext<CR>", desc = "Next buffer" },
			{ "<C-h>", ":bprevious<CR>", desc = "Prev buffer" },
			{ "<leader>bd", ":bp | sp | bn | bd<CR>", desc = "Delete buffer" },
			{ "<leader>cd", ":cd %:h<CR>", desc = "Change cwd" },
			--window
			{ "<A-h>", "<C-w>h", desc = "Left Window" },
			{ "<A-j>", "<C-w>j", desc = "Down Window" },
			{ "<A-k>", "<C-w>k", desc = "Up window" },
			{ "<A-l>", "<C-w>l", desc = "Right window" },
			{ "<A-x>", "<C-w>x", desc = "Swap window" },
			{ "<A-w>", "<C-w>w", desc = "Prev Window" },
			{ "<A-q>", "<C-w>q", desc = "Close window" },
			-- quickix
			{ "<leader>q", ":copen<CR>", desc = "Open quickfix" },
			{ "<leader>l", ":lli<CR>", desc = "Open location" },
			{ "]c", ":cn<CR>", desc = "Next qf" },
			{ "[c", ":cp<CR>", desc = "Prev qf" },
		})
	end,
}
