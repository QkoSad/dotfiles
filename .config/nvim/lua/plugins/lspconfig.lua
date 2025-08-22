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
  event = "VeryLazy",
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
        "yamlls",
        -- "basedpyright",
        "pyright",
      },
    })

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
