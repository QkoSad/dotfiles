return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- install language servers
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- completion engine
		"hrsh7th/nvim-cmp",
		-- completions to add to the engine
		"hrsh7th/cmp-nvim-lsp", -- completions from lsp
		"hrsh7th/cmp-buffer", -- /? searches completions
		"hrsh7th/cmp-path", -- completions in cmd for paths
		"hrsh7th/cmp-cmdline", -- for the cmd and searches
		"hrsh7th/cmp-nvim-lua", -- vim.lsp.something completions in vim configs
		-- snipets
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
		"saadparwaiz1/cmp_luasnip",
		-- fidged, the thing in the bottom right corner when you open a project
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"html",
				"jsonls",
				"lua_ls",
				"pylsp",
				"tailwindcss",
				-- "ts_ls",
				"yamlls",
				-- "prettierd",
				-- "stylua",
				-- those 2 need manual install because they are formatters
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- custom settings for the lua ls language server
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		local luasnip = require("luasnip")
		-- this is from nvim-cmp github wiki
		cmp.setup({
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = true,
				disallow_partial_matching = false,
				disallow_prefix_unmatching = true,
			},
			mapping = cmp.mapping.preset.insert({
				-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-l>"] = cmp.mapping.complete(), -- open completions menu
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),

				["<C-n>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					end
				end, { "i", "s" }),

				["<C-p>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			opts = {
				performance = {
					debounce = 0, -- default is 60ms
					throttle = 0, -- default is 30ms
				},
			},
		})
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
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
