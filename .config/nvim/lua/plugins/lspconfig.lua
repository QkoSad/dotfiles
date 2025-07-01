return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- install language servers
		{ "williamboman/mason.nvim", opts = {} },
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
				"dotnet",
				"/home/arch/.local/share/nvim/mason/bin/roslyn_ls/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
				"--logLevel",
				"Information",
				"--extensionLogDirectory",
				vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
				"--stdio",
			},
			filetypes = { "cs" },
		})

		vim.lsp.enable("roslyn_ls")
	end,
}
