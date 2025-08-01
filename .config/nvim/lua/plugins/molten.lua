return {
  dir = "~/.config/nvim/localPlugs/molten-nvim/",
  -- enabled = false,
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  lazy = false,
  config = function()
    -- vim.g.molten_output_win_max_height = 20
    vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/molten/moltenvenv/bin/python3")
    vim.g.molten_auto_open_output = false
    vim.g.molten_cover_empty_lines = true
    -- vim.g.molten_copy_output = true
    vim.g.molten_enter_output_behavior = "open_and_enter"
    vim.g.molten_image_location = "both"
    -- to use snacks have to change the branch of molten in
    -- .local/share/nvim/lazy/molten
    -- after the new version is release it won't be necesseray vim.g.molten_image_provider = "snacks.nvim" vim.g.molten_output_crop_border = false
    vim.g.molten_image_provider = "snacks.nvim"
    vim.g.molten_output_virt_lines = true
    vim.g.molten_output_show_more = true
    vim.g.molten_output_win_max_height = 500
    vim.g.molten_output_win_max_width = 500
    vim.g.molten_output_win_style = "minimal"
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_virt_text_max_lines = 10000
    -- initialize kernel based on kernelspec that are at the top of each ipynb
    -- falls back to a kernel that matches the name of the active venv (if any)
    -- local imb = function(e) -- init molten buffer
    --   vim.schedule(function()
    --     local kernels = vim.fn.MoltenAvailableKernels()
    --     local try_kernel_name = function()
    --       local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
    --       return metadata.kernelspec.name
    --     end
    --     -- check ipynb for kernel name
    --     local ok, kernel_name = pcall(try_kernel_name)
    --     if not ok or not vim.tbl_contains(kernels, kernel_name) then
    --       kernel_name = nil
    --       local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
    --       if venv ~= nil then kernel_name = string.match(venv, "/.+/(.+)") end
    --     end
    --     if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
    --       if kernel_name ~= "python3" then
    --         vim.cmd(("MoltenInit %s"):format(kernel_name))
    --       else
    --         vim.cmd("MoltenInit")
    --       end
    --     end
    --     vim.cmd("MoltenImportOutput")
    --   end)
    -- end
    -- -- automatically import output chunks from a jupyter notebook
    -- vim.api.nvim_create_autocmd("BufAdd", {
    --   pattern = { "*.ipynb" },
    --   callback = imb,
    -- })
    -- -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --   pattern = { "*.ipynb" },
    --   callback = function(e)
    --     if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then imb(e) end
    --   end,
    -- })
    -- -- automatically export output chunks to a jupyter notebook on write
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   pattern = { "*.ipynb" },
    --   callback = function()
    --     if require("molten.status").initialized() == "Molten" then vim.cmd("MoltenExportOutput!") end
    --   end,
    -- })
    -- change settings for python files
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.py",
      callback = function(e)
        if string.match(e.file, ".otter.") then return end
        if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
          vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
          vim.fn.MoltenUpdateOption("virt_text_output", false)
        else
          vim.g.molten_virt_lines_off_by_1 = false
          vim.g.molten_virt_text_output = false
        end
      end,
    })

    -- Undo those config changes when we go back to a markdown or quarto file
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.qmd", "*.md", "*.ipynb" },
      callback = function(e)
        if string.match(e.file, ".otter.") then return end
        if require("molten.status").initialized() == "Molten" then
          vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
          vim.fn.MoltenUpdateOption("virt_text_output", true)
        else
          vim.g.molten_virt_lines_off_by_1 = true
          vim.g.molten_virt_text_output = true
        end
      end,
    })

    -- Provide a command to create a blank new Python notebook
    -- note: the metadata is needed for Jupytext to understand how to parse the notebook.
    -- if you use another language than Python, you should change it in the template.
    local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
   ]]

    local function new_notebook(filename)
      local path = filename .. ".ipynb"
      local file = io.open(path, "w")
      if file then
        file:write(default_notebook)
        file:close()
        vim.cmd("edit " .. path)
      else
        print("Error: Could not open new notebook file for writing.")
      end
    end

    vim.api.nvim_create_user_command("NewNotebook", function(opts) new_notebook(opts.args) end, {
      nargs = 1,
      complete = "file",
    })
  end,
  keys = {
    { "<leader>m", "", desc = "+Molten", mode = { "n", "v" } },
    {
      "<leader>mi",
      ":MoltenInit<CR>",
      -- automatically Initialize the kernel based on current virtualenv
      -- function()
      --   local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
      --   if venv ~= nil then
      --     -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
      --     venv = string.match(venv, "/.+/(.+)")
      --     vim.cmd(("MoltenInit %s"):format(venv))
      --   else
      --     vim.cmd("MoltenInit python3")
      --   end
      -- end,
      { desc = "Initialize Molten for python3", silent = true },
    },
    {
      "<leader>mo",
      ":MoltenEvaluateOperator<CR>",
      { silent = true, desc = "Run operator selection(Molten)" },
    },
    { "<leader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line(Molten)" } },
    { "<leader>mr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell(Molten)" } },
    {
      "<leader>mv",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      mode = { "v" },
      { silent = true, desc = "evaluate visual selection" },
    },
    {
      "<localleader>me",
      ":noautocmd MoltenEnterOutput<CR>",
      mode = { "n" },
      { silent = true, desc = "show/enter output" },
    },
    {
      "<leader>mn",
      function()
        local row = vim.fn.line(".") -- current line (1-based)
        local lines = { "```python", "", "```" }

        -- Insert the block at the current line
        vim.api.nvim_buf_set_lines(0, row, row, true, lines)

        -- Move cursor to the empty line (2nd line inserted)
        vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
      end,
      { desc = "new python cell" },
    },
  },
}
