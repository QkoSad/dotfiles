return {
  "saghen/blink.cmp",
  dependencies = { "echasnovski/mini.snippets" },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    signature = { enabled = true },

    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      list = { selection = { preselect = true, auto_insert = false } },
    },
    -- keymaps for cmdline mode, not default
    cmdline = {
      keymap = {
        ["<Tab>"] = { "select_and_accept" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
      },
      completion = {
        menu = { auto_show = true },
      },
    },

    snippets = { preset = "mini_snippets" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { "dadbod" },
        mysql = { "dadbod" },
        -- optionally inherit from the `default` sources
        lua = { inherit_defaults = true, "lazydev" },
      },
      providers = {
        dadbod = { module = "vim_dadbod_completion.blink" },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    fuzzy = {
      implementation = "rust",
      sorts = {
        "exact",
        -- defaults
        "score",
        "sort_text",
      },
    },
  },
  opts_extend = { "sources.default" },
}
