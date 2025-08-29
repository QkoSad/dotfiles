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
  },
  event = "VeryLazy",
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
      end,
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
    vim.lsp.inlay_hint.enable()

    -- This is for molten, to not see all the errors
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            diagnosticSeverityOverrides = {
              reportUnusedExpression = "none",
            },
          },
        },
      },
    })
    -- taken from nvim-lspconfig, replaces lazydev
    vim.lsp.config("lua_ls", {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using (most
            -- likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Tell the language server how to find Lua modules same way as Neovim
            -- (see `:h lua-module-load`)
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths
              -- here.
              -- "${3rd}/luv/library",
              -- "${3rd}/busted/library",
            },
            -- Or pull in all of 'runtimepath'.
            -- NOTE: this is a lot slower and will cause issues when working on
            -- your own configuration.
            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
            -- library = {
            --   vim.api.nvim_get_runtime_file('', true),
            -- }
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
    -- Rolsyn looks for /usr/lib/dotnet/packs
    -- sudo ln -s /usr/share/dotnet/packs /usr/lib/dotnet/packs
    -- taken from lspconfig
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
    local languages = {
      "ansiblels",
      "awk_ls",
      "bashls",
      "cssls",
      "dockerls",
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "roslyn_ls",
      "systemd_ls",
      "ts_ls",
      "yaml_ls",
    }
    for _, val in ipairs(languages) do
      vim.lsp.enable(val)
    end
  end,
}
