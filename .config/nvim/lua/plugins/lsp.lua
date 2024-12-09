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
				"ts_ls",
				-- "tailwindcss",
				--
				-- "prettierd",
				-- "stylua",
				-- "black",
				-- "js-debug-adapter",
				-- those 4 need manual install because they are not lsps
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- custom settings for the lua ls language server
				-- ["lua_ls"] = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig.lua_ls.setup({
				-- 		capabilities = capabilities,
				-- 		settings = {
				-- 			Lua = {
				-- 				diagnostics = {
				-- 					globals = { "vim" },
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
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
	end,
}
