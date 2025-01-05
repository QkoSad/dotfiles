lazy.nvim = plugin manager that supports lazy loading which means not everything
    is loaded at the start nvim. Plugins can be loaded at events key combinations
    commands etc
# lsp
nvim-lspconfig = part of base neovim. Used to connect and interact with language
    servers.
mason.nvim = used to download language servers, for maters, daps and Linters
mason-lspconfig.nvim = Instead of copying the configuration for each new LSP
    this does it automatically
fidged = shows little information about mounting lsps and formatters in the
    bottom right corner
conform = like mason-lspconfig but for formatters
lazydev = lua lsp
roslyn =  lsp for c#
typescript-tools = lsp for ts
nvim-dap = debugger
nvim-dap-ui = debugger UI
nvim-dap-virtual-text = addition to debugger UI

# completions
nvim-cmp = part of base neovim. Used for autocompletions for anything from lsp
    to auto suggestion like in a messaging app
cmp-buffer = completions from buffer
cmp-nvim-lsp = completions from lsp
cmp-nvim-lua = completions for lua
cmp-path = completions for when writing path 
cmp_luasnip = completions for snippet engines
friendly-snippets = snippet engine
LuaSnip = snippet engine

# git
gitsigns = show what change have been made to a file
diffview = shows git diff of a file
vim-fugitive = git interface so don't need to open terminal

# editing
mini.comment = comment a line
nvim-ts-context-commentstring  = commenting html jsx tsx
nvim-ts-autotag = tag completion and tag renaming
nvim-surround = change the surroundings of text objects, yss etc.
nvim-autopairs = adds second pair

# movement
harpoon = quick movement between couple of files
telescope.nvim = quick search and open files
oil = file explorere
scope = makes each tab have separete buffers

# Misc
nvim-ufo = better folding
quicker = better quickfix list
Neogen = 
Neotest = testing framework
neotest-dotnet = allow running C# tests
neotest-jest = allow running js tests
undotree = git of each files keeps them in a tree for easy going back to changes
vim-dadbod = interface with Databases
vim-dadbod-completion = completions for DBUI
vim-dadbod-ui = UI for dadbod
zen-mode.nvim = clear the UI for when working on 1 file
vimwiki 
FixCursorHold = library
nvim-nio = library
promise-async = library
plenary.nvim = collection of lua modules required by some other plugins
nvim-web-devicons = icons
telescope-fzf-native.nvim = fzf for telescope

# Visual
mini.tabline =  basic tabline with buffers and tabs
nvim-treesitter = code parser allows coloring indentation
nvim-treesitter-textobjects = adds more objects besides word and brackets 


# Unused
set filetype? - prints the current buffer file type

tsc-nvim, ts-error-translator might be unneeded not sure what use they are
Unsure about trouble
lsp-zero.nvim = lsp mangers helps set up and running lsp servers. It removes the
    need of manual configuration with nvim-cmp and nvim-lspconfig. 
    !No longer used.
