return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>a", function() require("harpoon.mark"):list():add() end, desc = "Add buff to harpoon" },
    {
      "<C-e>",
      function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
      desc = "Show harpoon",
    },
    { "<C-1>", function() require("harpoon"):list():select(1) end, desc = "Select first item from harpoon" },
    { "<C-2>", function() require("harpoon"):list():select(2) end, desc = "Select second item from harpoon" },
    { "<C-3>", function() require("harpoon"):list():select(3) end, desc = "Select third item from harpoon" },
    { "<C-4>", function() require("harpoon"):list():select(4) end, desc = "Select fourth item from harpoon" },
    { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Select previous item from harpoon" },
    { "<C-n>", function() require("harpoon"):list():next() end, desc = "Select next item from harpoon" },
  },
  config = function()
    -- REQUIRED
    require("harpoon"):setup()
    -- REQUIRED
  end,
}
