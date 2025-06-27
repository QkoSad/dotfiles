return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- install language servers
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		-- fidged, the thing in the bottom right corner when you open a project
		{ "j-hui/fidget.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()
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
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})
		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
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
		})
		vim.lsp.enable("roslyn_ls")
	end,
}
