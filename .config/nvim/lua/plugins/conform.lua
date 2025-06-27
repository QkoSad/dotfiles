return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>ft",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
			cs = { "csharpier" },
			sql = { "sql_formatter" },
			mysql = { "sql_formatter" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 1500 },
		-- Customize formatters
		formatters = {
			-- necessary since csharpier has been change, will remove when conform
			-- mergers a PR for fixing it
			csharpier = function()
				local useDotnet = not vim.fn.executable("csharpier")

				local command = useDotnet and "dotnet csharpier" or "csharpier"

				local version_out = vim.fn.system(command .. " --version")

				--NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
				local version_result = version_out[#version_out]
				local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
				local is_new = major_version >= 1

				local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

				return {
					command = command,
					args = args,
					stdin = not is_new,
					require_cwd = false,
				}
			end,
		},
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
