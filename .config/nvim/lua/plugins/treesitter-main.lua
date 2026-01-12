return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    opts = {
      -- custom handling of parsers
      ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "css",
        "tsx",
        "python",
        "lua",
        "c_sharp",
        "bash",
        "rst",
        "markdown",
        "markdown-inline",
        "diff",
        "yaml",
        "json",
        "awk",
        "cmake",
        "csv",
        "jsx",
        "dockerfile",
        "http",
        "toml",
        "vimdoc",
        "vim",
        "ninja",
        "kotlin",
        "java",
      },
    },
    config = function(_, opts)
      -- install parsers from custom opts.ensure_installed
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require("nvim-treesitter").install(opts.ensure_installed)
        -- register and start parsers for filetypes
        for _, parser in ipairs(opts.ensure_installed) do
          local filetypes = parser -- In this case, parser is the filetype/language name
          vim.treesitter.language.register(parser, filetypes)

          vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = filetypes,
            callback = function(event) vim.treesitter.start(event.buf, parser) end,
          })
        end
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    opts = { set_jumps = false },
    keys = {
      {
        "af",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end,
        desc = "Select outer function",
        mode = { "x", "o" },
      },
      {
        "if",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end,
        desc = "Select inner function",
        mode = { "x", "o" },
      },
      {
        "ac",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects") end,
        desc = "Select outer conditional",
        mode = { "x", "o" },
      },
      {
        "ic",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects") end,
        desc = "Select inner conditional",
        mode = { "x", "o" },
      },
      {
        "il",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects") end,
        desc = "Select inner loop",
        mode = { "x", "o" },
      },
      {
        "al",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects") end,
        desc = "Select outer loop",
        mode = { "x", "o" },
      },
      {
        "ib",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.inner", "textobjects") end,
        desc = "Select inner code_cell",
        mode = { "x", "o" },
      },
      {
        "ab",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.outer", "textobjects") end,
        desc = "Select outer code_cell",
        mode = { "x", "o" },
      },
      {
        "]b",
        function() require("nvim-treesitter-textobjects.move").goto_next_start("@code_cell.inner", "textobjects") end,
        desc = "Select next code cell",
        mode = { "n", "x", "o" },
      },
      {
        "[b",
        function() require("nvim-treesitter-textobjects.move").goto_previous_start("@code_cell.inner", "textobjects") end,
        desc = "Select prev code cell",
        mode = { "n", "x", "o" },
      },
    },
  },
}
