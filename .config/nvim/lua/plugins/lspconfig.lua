return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- install language servers
		{
			"williamboman/mason.nvim",
			opts = {
				registries = { "github:mason-org/mason-registry", "github:Crashdummyy/mason-registry" },
			},
		},
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"awk_ls",
				"bashls",
				"cssls",
				"dockerls",
				"html",
				"jsonls",
				"lua_ls",
				"pylsp",
				"yamlls",
				-- "omnisharp",
			},
		})
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
			virtual_text = false,
		})

		vim.lsp.config("roslyn_ls", {
			cmd = {
				"roslyn",
				"--logLevel",
				"Information",
				"--extensionLogDirectory",
				vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
				"--stdio",
			},
			filetypes = { "cs" },
			capabilities = {
				textDocument = {
					diagnostic = {
						dynamicRegistration = true,
					},
				},
				-- enable file watch server side, can slow down the server
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
						-- enable file watcher capabilities for lsp clients
						relativePatternSupport = true,
					},
				},
			},
		})

		vim.lsp.enable("roslyn_ls")
	end,
}
