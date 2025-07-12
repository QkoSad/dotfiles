-- linenumber
vim.opt.relativenumber = true
-- 4 space indets
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- set tabs to spaces
vim.opt.expandtab = true
-- smartindent
vim.opt.smartindent = true
-- line wrap
vim.opt.wrap = false
vim.opt.textwidth = 80
-- backup moved to the undotree plugin
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/vim/undodir"
vim.opt.undofile = true
-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- search bar is non cases sensitive ignorecase is need for smartcase to work
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- gui colors
vim.opt.termguicolors = true
-- never have less the 8 lines on top or bottom
vim.opt.scrolloff = 8
-- stop the signcolumn from disappearing when there are no errors
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- fast updatetime
vim.opt.updatetime = 50
-- add visual column at the 80
vim.opt.colorcolumn = "80"
vim.opt.diffopt = "vertical"

-- folding plugin
vim.opt.foldcolumn = "0" -- sets column on left telling the fold level
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 10
vim.opt.foldenable = true
-- grep
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
-- ignores node_modules, and git for vimgrep
vim.opt.wildignore:append({ "**/node_modules", ".git/**" })
-- stop windows from auto resizing
vim.opt.equalalways = false
