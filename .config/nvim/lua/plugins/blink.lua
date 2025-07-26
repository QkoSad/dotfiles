return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },

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
