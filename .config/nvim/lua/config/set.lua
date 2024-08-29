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
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
-- search options
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- search bar is non cases sensitive ignorecase is need for smartcase to work
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- gui colors
vim.opt.termguicolors = true
-- never have less the 8 lines on top or bottom
vim.opt.scrolloff = 8
-- stop the signcolumn from disapearing when there are no errors
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- fast updatetime
vim.opt.updatetime = 50
-- add visual column at the 80
vim.opt.colorcolumn = "80"
-- folding
-- use treessitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- change the way the folds looks, stole it from somewhere
vim.opt.foldtext =
	[[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- dunno what this was
vim.opt.fillchars = "fold: "
-- so it dosent open files folded
vim.opt.foldlevel = 8
-- ignores node_modules, and git for vimgrep
vim.opt.wildignore:append({ "**/node_modules", ".git/**" })
-- grep
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
-- netrw
-- vim.g.netrw_keepdir = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_list_hide = "\(^\|\s\s\)\zs\.\S\+"
-- vim.g.netrw_localcopydircmd = "cp -r"
