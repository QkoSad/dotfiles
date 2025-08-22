return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    require("lint").linters_by_ft = {
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
      mysql = { "sqlfluff" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "ruff" },
    }
  end,
}
