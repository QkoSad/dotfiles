return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>bd", function() Snacks.bufdelete.delete() end },
    -- pickers
    { "<leader>f", "", desc = "+Find file", mode = { "n", "v" } },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fgs", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>fgd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>fb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { '<leader>f"', function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>f/", function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>fC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>fz", function() Snacks.picker.zoxide() end, desc = "Zoxide" },
  },
  lazy = false,
  priority = 1000,
  opts = {
    image = {
      enabled = true,
      doc = {
        enabled = true,
        max_width = 100,
        max_height = 100,
      },
    },
    bufdelete = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        projects = {
          dev = { "~/temp", "~/projects", "~/projects", "~/projects" },
          projects = { "~/dotfiles/", "~/.config/nvim" },
          confirm = "load_session",
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", ".csproj" },
          recent = false,
        },
      },
    },
  },
}
