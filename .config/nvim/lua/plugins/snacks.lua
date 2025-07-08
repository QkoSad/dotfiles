return {
	"folke/snacks.nvim",
	---@type snacks.Config
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		-- git
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
	opts = {
		picker = {
			-- your picker configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			picker = { enabled = true },
		},
		win = {
			-- input window
			input = {
				keys = {
					-- to close the picker on ESC instead of going to normal mode,
					-- add the following keymap to your config
					-- ["<Esc>"] = { "close", mode = { "n", "i" } },
					["/"] = "toggle_focus",
					["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
					["<C-Up>"] = { "history_back", mode = { "i", "n" } },
					["<C-c>"] = { "cancel", mode = "i" },
					["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
					["<CR>"] = { "confirm", mode = { "n", "i" } },
					["<Down>"] = { "list_down", mode = { "i", "n" } },
					["<Esc>"] = "cancel",
					["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
					["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
					["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
					["<Up>"] = { "list_up", mode = { "i", "n" } },
					["<a-d>"] = { "inspect", mode = { "n", "i" } },
					["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
					["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
					["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
					["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
					["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
					["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
					["<c-a>"] = { "select_all", mode = { "n", "i" } },
					["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
					["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
					["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
					["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
					["<c-j>"] = { "list_down", mode = { "i", "n" } },
					["<c-k>"] = { "list_up", mode = { "i", "n" } },
					["<c-n>"] = { "list_down", mode = { "i", "n" } },
					["<c-p>"] = { "list_up", mode = { "i", "n" } },
					["<c-q>"] = { "qflist", mode = { "i", "n" } },
					["<c-s>"] = { "edit_split", mode = { "i", "n" } },
					["<c-t>"] = { "tab", mode = { "n", "i" } },
					["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
					["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
					["<c-r>#"] = { "insert_alt", mode = "i" },
					["<c-r>%"] = { "insert_filename", mode = "i" },
					["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
					["<c-r><c-f>"] = { "insert_file", mode = "i" },
					["<c-r><c-l>"] = { "insert_line", mode = "i" },
					["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
					["<c-r><c-w>"] = { "insert_cword", mode = "i" },
					["<c-w>H"] = "layout_left",
					["<c-w>J"] = "layout_bottom",
					["<c-w>K"] = "layout_top",
					["<c-w>L"] = "layout_right",
					["?"] = "toggle_help_input",
					["G"] = "list_bottom",
					["gg"] = "list_top",
					["j"] = "list_down",
					["k"] = "list_up",
					["q"] = "close",
				},
				b = {
					minipairs_disable = true,
				},
			},
			-- result list window
			list = {
				keys = {
					["/"] = "toggle_focus",
					["<2-LeftMouse>"] = "confirm",
					["<CR>"] = "confirm",
					["<Down>"] = "list_down",
					["<Esc>"] = "cancel",
					["<S-CR>"] = { { "pick_win", "jump" } },
					["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
					["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
					["<Up>"] = "list_up",
					["<a-d>"] = "inspect",
					["<a-f>"] = "toggle_follow",
					["<a-h>"] = "toggle_hidden",
					["<a-i>"] = "toggle_ignored",
					["<a-m>"] = "toggle_maximize",
					["<a-p>"] = "toggle_preview",
					["<a-w>"] = "cycle_win",
					["<c-a>"] = "select_all",
					["<c-b>"] = "preview_scroll_up",
					["<c-d>"] = "list_scroll_down",
					["<c-f>"] = "preview_scroll_down",
					["<c-j>"] = "list_down",
					["<c-k>"] = "list_up",
					["<c-n>"] = "list_down",
					["<c-p>"] = "list_up",
					["<c-q>"] = "qflist",
					["<c-s>"] = "edit_split",
					["<c-t>"] = "tab",
					["<c-u>"] = "list_scroll_up",
					["<c-v>"] = "edit_vsplit",
					["<c-w>H"] = "layout_left",
					["<c-w>J"] = "layout_bottom",
					["<c-w>K"] = "layout_top",
					["<c-w>L"] = "layout_right",
					["?"] = "toggle_help_list",
					["G"] = "list_bottom",
					["gg"] = "list_top",
					["i"] = "focus_input",
					["j"] = "list_down",
					["k"] = "list_up",
					["q"] = "close",
					["zb"] = "list_scroll_bottom",
					["zt"] = "list_scroll_top",
					["zz"] = "list_scroll_center",
				},
				wo = {
					conceallevel = 2,
					concealcursor = "nvc",
				},
			},
		},
		config = {
			matcher = { frecency = true },
		},
	},
}
