Vim�UnDo� �9ҹ�X�T�����;�2�!�!�V`��P�_   �       �                           f��e    _�                     h   
    ����                                                                                                                                                                                                                                                                                                                                                             f��L     �   h   j   �            �   h   j   �    5��    h                                           �    h                                          �    h   
                                     5�_�                    i       ����                                                                                                                                                                                                                                                                                                                                                             f��_     �   h   j   �            opts =5��    h                                          5�_�                    i       ����                                                                                                                                                                                                                                                                                                                                                             f��`     �   i   n   �              �   j   k   �    �   h   k   �            opts ={�   i   k                }�   h   k   �            opts ={}5��    h                                         �    h                                         �    i                                         �    i                    %              d       5�_�                    m       ����                                                                                                                                                                                                                                                                                                                                                             f��b     �   �               �               �   return {   	"neovim/nvim-lspconfig",   	dependencies = {   		-- install language servers   		"williamboman/mason.nvim",   &		"williamboman/mason-lspconfig.nvim",   		-- completion engine   		"hrsh7th/nvim-cmp",   %		-- completions to add to the engine   1		"hrsh7th/cmp-nvim-lsp", -- completions from lsp   2		"hrsh7th/cmp-buffer", -- /? searches completions   5		"hrsh7th/cmp-path", -- completions in cmd for paths   4		"hrsh7th/cmp-cmdline", -- for the cmd and searches   I		"hrsh7th/cmp-nvim-lua", -- vim.lsp.something completions in vim configs   		-- snipets   :		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },   		"saadparwaiz1/cmp_luasnip",   I		-- fidged, the thing in the bottom right corner when you open a project   		"j-hui/fidget.nvim",   	},   	config = function()   		local cmp = require("cmp")   )		local cmp_lsp = require("cmp_nvim_lsp")   5		local capabilities = cmp_lsp.default_capabilities()       		require("fidget").setup({})   		require("mason").setup()   $		require("mason-lspconfig").setup({   			ensure_installed = {   				"lua_ls",   				"cssls",   7				-- weird thing started giving errors out of nowhere   			},   			handlers = {   7				function(server_name) -- default handler (optional)   .					require("lspconfig")[server_name].setup({   "						capabilities = capabilities,   					})   				end,   5				-- custom settings for the lua ls language server   				["lua_ls"] = function()   +					local lspconfig = require("lspconfig")   					lspconfig.lua_ls.setup({   "						capabilities = capabilities,   						settings = {   							Lua = {   								diagnostics = {   									globals = { "vim" },   
								},   								},   						},   					})   				end,   			},   		})       $		local luasnip = require("luasnip")   &		-- this is from nvim-cmp github wiki   		cmp.setup({   (			mapping = cmp.mapping.preset.insert({   :				-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),   @				["<C-l>"] = cmp.mapping.complete(), -- open completions menu   .				["<Tab>"] = cmp.mapping(function(fallback)   					if cmp.visible() then   "						if luasnip.expandable() then   							luasnip.expand()   
						else   							cmp.confirm({   								select = true,   								})   							end   						else   						fallback()   					end   					end),       &				["<C-n>"] = cmp.mapping(function()   					if cmp.visible() then   						cmp.select_next_item()   ,					elseif luasnip.locally_jumpable(1) then   						luasnip.jump(1)   					end   				end, { "i", "s" }),       &				["<C-p>"] = cmp.mapping(function()   					if cmp.visible() then   						cmp.select_prev_item()   -					elseif luasnip.locally_jumpable(-1) then   						luasnip.jump(-1)   					end   				end, { "i", "s" }),   			}),   !			sources = cmp.config.sources({   				{ name = "nvim_lua" },   				{ name = "nvim_lsp" },   /				{ name = "luasnip" }, -- For luasnip users.   				{ name = "path" },   ,				{ name = "buffer", keyword_length = 3 },   			}),   			snippet = {   				expand = function(args)   E					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.   				end,   			},         opts ={           performance = {   &      debounce = 0, -- default is 60ms   &      throttle = 0, -- default is 30ms       },         }   		})   _		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).   #		cmp.setup.cmdline({ "/", "?" }, {   *			mapping = cmp.mapping.preset.cmdline(),   			sources = {   				{ name = "buffer" },   			},   		})       _		-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).   		cmp.setup.cmdline(":", {   *			mapping = cmp.mapping.preset.cmdline(),   !			sources = cmp.config.sources({   				{ name = "path" },   			}, {   				{ name = "cmdline" },   			}),   =			matching = { disallow_symbol_nonprefix_matching = false },   		})       		vim.diagnostic.config({   			float = {   				focusable = false,   				style = "minimal",   				border = "rounded",   				source = "always",   				header = "",   				prefix = "",   			},   			virtual_text = false,   		})   	end,   }5��            �      �               �      �      �    �                      �                     5�_�                     m       ����                                                                                                                                                                                                                                                                                                                                                             f��d    �         �        "neovim/nvim-lspconfig",     dependencies = {       -- install language servers       "williamboman/mason.nvim",   (    "williamboman/mason-lspconfig.nvim",       -- completion engine       "hrsh7th/nvim-cmp",   '    -- completions to add to the engine   3    "hrsh7th/cmp-nvim-lsp", -- completions from lsp   4    "hrsh7th/cmp-buffer", -- /? searches completions   9    "hrsh7th/cmp-path",   -- completions in cmd for paths   6    "hrsh7th/cmp-cmdline", -- for the cmd and searches   K    "hrsh7th/cmp-nvim-lua", -- vim.lsp.something completions in vim configs       -- snipets   <    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },       "saadparwaiz1/cmp_luasnip",   K    -- fidged, the thing in the bottom right corner when you open a project       "j-hui/fidget.nvim",     },     config = function()       local cmp = require("cmp")   +    local cmp_lsp = require("cmp_nvim_lsp")   7    local capabilities = cmp_lsp.default_capabilities()�      8   �          require("fidget").setup({})       require("mason").setup()   &    require("mason-lspconfig").setup({         ensure_installed = {           "lua_ls",           "cssls",   ;        -- weird thing started giving errors out of nowhere         },         handlers = {   ;        function(server_name) -- default handler (optional)   3          require("lspconfig")[server_name].setup({   (            capabilities = capabilities,             })           end,   9        -- custom settings for the lua ls language server           ["lua_ls"] = function()   0          local lspconfig = require("lspconfig")   "          lspconfig.lua_ls.setup({   (            capabilities = capabilities,               settings = {                 Lua = {                   diagnostics = {   &                  globals = { "vim" },                   },                 },               },             })           end,         },       })�   8   L   �      &    local luasnip = require("luasnip")   (    -- this is from nvim-cmp github wiki       cmp.setup({   +      mapping = cmp.mapping.preset.insert({   >        -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),   D        ["<C-l>"] = cmp.mapping.complete(), -- open completions menu   2        ["<Tab>"] = cmp.mapping(function(fallback)             if cmp.visible() then   (            if luasnip.expandable() then                 luasnip.expand()               else                 cmp.confirm({                   select = true,                 })               end             else               fallback()             end           end),�   L   T   �      *        ["<C-n>"] = cmp.mapping(function()             if cmp.visible() then   "            cmp.select_next_item()   1          elseif luasnip.locally_jumpable(1) then               luasnip.jump(1)             end           end, { "i", "s" }),�   T   w   �   "   *        ["<C-p>"] = cmp.mapping(function()             if cmp.visible() then   "            cmp.select_prev_item()   2          elseif luasnip.locally_jumpable(-1) then               luasnip.jump(-1)             end           end, { "i", "s" }),   	      }),   $      sources = cmp.config.sources({           { name = "nvim_lua" },           { name = "nvim_lsp" },   3        { name = "luasnip" }, -- For luasnip users.           { name = "path" },   1        { name = "buffer",  keyword_length = 3 },   	      }),         snippet = {           expand = function(args)   J          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.           end,         },         opts = {           performance = {   *          debounce = 0, -- default is 60ms   *          throttle = 0, -- default is 30ms   
        },         }       })   a    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).   %    cmp.setup.cmdline({ "/", "?" }, {   -      mapping = cmp.mapping.preset.cmdline(),         sources = {           { name = "buffer" },         },       })�   w   �   �   
   a    -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).       cmp.setup.cmdline(":", {   -      mapping = cmp.mapping.preset.cmdline(),   $      sources = cmp.config.sources({           { name = "path" },   
      }, {           { name = "cmdline" },   	      }),   @      matching = { disallow_symbol_nonprefix_matching = false },       })�   �   �   �          vim.diagnostic.config({         float = {           focusable = false,           style = "minimal",           border = "rounded",           source = "always",           header = "",           prefix = "",         },         virtual_text = false,       })     end,5��    �                   �      �       �       �    w       	      	      (      e      H      �    T       !      !      (
      �      |      �    L                   A	      �       �       �    8                   �      T      �      �                       �      T      �      �                       	       P      $      5��