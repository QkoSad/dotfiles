return {
	"folke/snacks.nvim",
	---@type snacks.Config
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader>g",
			"",
			desc = "+Search Git",
			mode = { "n", "v" },
		},
		{
			"<leader>s",
			"",
			desc = "+Find text",
			mode = { "n", "v" },
		},
		{
			"<leader>f",
			"",
			desc = "+Find file",
			mode = { "n", "v" },
		},
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
			enabled = true,
			sources = {
				projects = {
					finder = "recent_projects",
					format = "file",
					dev = { "~/temp", "~/projects/big", "~/projects/unfinished", "~/projects/small" },
					projects = { "~/dotfiles/", "~/.config/nvim" },
					confirm = "load_session",
					patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile" },
					recent = false,
					matcher = {
						frecency = true, -- use frecency boosting
						sort_empty = true, -- sort even when the filter is empty
						cwd_bonus = false,
					},
					sort = { fields = { "score:desc", "idx" } },
					win = {
						preview = { minimal = true },
						input = {
							keys = {
								-- every action will always first change the cwd of the current tabpage to the project
								["<c-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
								["<c-f>"] = { { "tcd", "picker_files" }, mode = { "n", "i" } },
								["<c-g>"] = { { "tcd", "picker_grep" }, mode = { "n", "i" } },
								["<c-r>"] = { { "tcd", "picker_recent" }, mode = { "n", "i" } },
								["<c-w>"] = { { "tcd" }, mode = { "n", "i" } },
								["<c-t>"] = {
									function(picker)
										vim.cmd("tabnew")
										Snacks.notify("New tab opened")
										picker:close()
										Snacks.picker.projects()
									end,
									mode = { "n", "i" },
								},
							},
						},
					},
				},
			},
		},
	},
}
