return
{
    -- fzf for telescop otherwise cant sapce and choose directroies and i have
    -- to speciffy them in full like plugin/lua. With it i just go "plu lu"
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>vh", "<cmd>Telescope help_tags<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
      { "<leader>ps", function()
        require('telescope.builtin').grep_string({ search = vim.fn.input("Grep:") })
      end
      }
    },
    config = function()
      require('telescope').setup()
      require('telescope').load_extension('fzf')
    end
  }
}
