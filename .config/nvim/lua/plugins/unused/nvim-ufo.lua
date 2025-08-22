return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require("lspconfig")[ls].setup({
        capabilities = capabilities,
        -- you can add other fields for setting up lsp server in this table
      })
    end

    -- folding plugin
    vim.opt.foldcolumn = "0" -- sets column on left telling the fold level
    vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true
    require("ufo").setup()
  end,
}
