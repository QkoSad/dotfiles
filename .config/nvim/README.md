# TODO's
1. configure molten and quatro so they dont trigger for all markdowns
2. the custom treesitter textobjects brake constantly, need to find a fix
3. fix blink working differently in command mode
# package manager
* lazy.nvim = plugin manager that supports lazy loading which means not everything
    is loaded at the start nvim. Plugins can be loaded at events key combinations
    commands etc
# lsp
* nvim-lspconfig = part of base neovim. Used to connect and interact with language
    servers.
* mason.nvim = used to download language servers, for maters, daps and Linters
* mason-lspconfig.nvim = Instead of copying the configuration for each new LSP
    this does it automatically
* lazydev = adds vim commands to the lua lsp, 
* roslyn =  lsp for c#
* typescript-tools = lsp for ts
## Notes
* for c# netcoredbg use the second option when choosing debugger

# formatter
* conform = configures formatters

# Linter
* nvim-lint - configures lintes

# Debugger
* nvim-dap = debugger
* nvim-dap-ui = debugger UI
* nvim-dap-virtual-text = addition to debugger UI

# completions
* blink - completions engine
* friendly-snippets = snippet engine

# git
* gitsigns = show what change have been made to a file
* diffview = shows git diff of a file
* vim-fugitive = git interface so don't need to open terminal
* git-confict = resolve conflicts

# editing
* ts-comments = commenting html jsx tsx
* nvim-ts-autotag = tag completion and tag renaming
* nvim-surround = change the surroundings of text objects, yss etc.
* mini-pairs = adds second pair
* foldtext = better folding

# movement
* harpoon = quick movement between couple of files
* snacks.picker = quick search and open files
* yazi = file explorere
* scope = makes each tab have separate buffers

# Docs
* Neogen = generate docs

# Testing
* Neotest = testing framework
* neotest-dotnet = allow running C# tests
* neotest-jest = allow running js tests

# Database
* vim-dadbod = interface with Databases
* vim-dadbod-completion = completions for DBUI
* vim-dadbod-ui = UI for dadbod

# Misc
* undotree = git of each files keeps them in a tree for easy going back to changes
* zen-mode.nvim = clear the UI for when working on 1 file
* FixCursorHold = library
* plenary.nvim = collection of lua modules required by some other plugins

# Visual
mini.tabline =  basic tabline with buffers and tabs
nvim-treesitter = code parser allows coloring indentation
nvim-treesitter-textobjects = adds more objects besides word and brackets 

# 
hydra - creates new modes, in which keys do different things. Usefull for UI's
    like DAP and Kulala
molten - working with jupyter notebook
jupytext - molten dep
quatro - molten dep
otter - molte dep
whichkey - Show what each key does
kulala - HTTP client
workspace-diagnostics - loads all the errors in the entire project
trouble - fancy error display

# Additional installation instuctions
In order to use molten
Every new project that uses vnev should do:
```
pip install ipykernel
python -m ipykernel install --user --name project_name
```
Project name should match the venev name in order for Molten to automatically
load the kernel

If nvim is installed on new machine:
1. Create new venv for molten to use
```
mkdir ~/.local/share/nvim/molten
python -m venv ~/.local/share/nvim/molten/moltenvenv
source ~/.local/share/nvim/molten/moltenvenv/bin/activate
pip install pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip
nbformat # nbformat is not in the docs but it is needed
```
2. UpdateRemotePlugins
