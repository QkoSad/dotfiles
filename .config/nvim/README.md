# TODO's

[] mark dart put new buffers on the right
[] mini.snippets leaves annoying virtual text and Lua snippets doesn't move as it
should in the snippet and doesn't have snippets menu
[X] use which key only for registers and not keys
[] paste text that has a new line without the new line
[X] configure molten and quarto so they don't trigger for all markdowns
[X] the custom treesitter textobjects brake constantly, need to find a fix
turns out markdown files need an empty line at the end of file. But this is
new it wasn't the case and somehow no one else has the same problem
Also happens when joining lines in lua
Alas other people also suffer
https://github.com/nvim-treesitter/nvim-treesitter/issues/8043
fixed with this merge
https://github.com/neovim/neovim/pull/35307
merge is for 0.11.4 and in on 0.11.3. For now merge is manually applied

# package manager

- lazy.nvim = plugin manager that supports lazy loading which means not everything
  is loaded at the start nvim. Plugins can be loaded at events key combinations
  commands etc

# lsp

- nvim-lspconfig = part of base neovim. Used to connect and interact with language
  servers.
- mason.nvim = used to download language servers, formaters, daps and Linters
- roslyn = lsp for c#
- typescript-tools = lsp for ts

## Notes

- for c# netcoredbg use the second option when choosing debugger

# formatter

- conform = configures formatters

# Linter

- nvim-lint - configures linters

# Debugger

- nvim-dap = debugger
- nvim-dap-ui = debugger UI
- nvim-dap-virtual-text = addition to debugger UI

# completions

- blink - completions engine
- friendly-snippets = snippet engine

# git

- gitsigns = show what change have been made to a file
- vim-fugitive = git interface so don't need to open terminal

# editing

- ts-comments = commenting html jsx tsx
- nvim-ts-autotag = tag completion and tag renaming
- nvim-surround = change the surroundings of text objects, yss etc.
- mini-pairs = adds second pair
- foldtext = better folding

# movement

- snacks.picker = quick search and open files
- yazi = file explorers
- scope = makes each tab have separate buffers

# Docs

- Neogen = generate docs

# Testing

- Neotest = testing framework
- neotest-dotnet = allow running C# tests
- neotest-jest = allow running JS tests

# Database

- vim-dadbod = interface with Databases
- vim-dadbod-completion = completions for DBUI
- vim-dadbod-ui = UI for dadbod

# Misc

- undotree = git of each files keeps them in a tree for easy going back to changes
- FixCursorHold = library
- plenary.nvim = library

# Visual

- mini.tabline = basic tabline with buffers and tabs
- nvim-treesitter = code parser allows coloring indentation
- nvim-treesitter-textobjects = adds more objects besides word and brackets

# misc

- hydra - creates new modes, in which keys do different things. Useful for UI's
like DAP and Kulala
- molten - working with jupyter notebook
- jupytext - turns ipynb files in md. All it does is call cli jupytext with
  option --to markdown
- quarto - works only with md or qmd files, thats why we need jupytext
- otter - provides LSP features for embedded languages, quarto uses it for LSP
- whichkey - Show what each key does
- kulala - HTTP client
- workspace-diagnostics - loads all the errors in the entire project
- trouble - fancy error display

# Additional installation instructions

In order to use molten
Every new project that uses venev should do:

```bash
pip install ipykernel
python -m ipykernel install --user --name project_name
```

Project name should match the venev name in order for Molten to automatically
load the kernel

If nvim is installed on new machine:

1. Create new venv for molten to use

```bash
mkdir ~/.local/share/nvim/molten
python -m venv ~/.local/share/nvim/molten/moltenvenv
source ~/.local/share/nvim/molten/moltenvenv/bin/activate
pip install pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip nbformat
```

nbformat is not in the docs but it is needed

2. UpdateRemotePlugins
