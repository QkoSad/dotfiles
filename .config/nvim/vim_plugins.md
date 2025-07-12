# vim plugins

## vim
### dadbod
to connect to db:
mariadb://monty:some_pass@localhost:3306/devcon

### 
<C-l> next tab
<C-h> prev tab

## plugin
### cmp
insert mode
<Tab> - accept completion complete
<C-l> - open completions menu
<C-n> - next in the completions menu
<C-p> - prev in the completions menu


### lsp
K - show information about the symbol
gd - go to definition
gD - go to declaration
gi - list all implementations for the symbol
go - go to definionf of the type of symbol
gr - list all references
gs - display signature information about the symbol
<F2> - rename all refences of the symbol
<F3> - format
<F4> - select a code action 

gl - display error
]d - function() prev error
[d - function() next error

<leader>vws - function() vim.lsp.buf.workspace_symbol
<C-h> - vim.lsp.buf.signature_help

### telescope
<leader>ff - find files
<leader>vh - help tags
<leader>fg - live grep
<leader>fb - find buffers
<leader>fh - help tags
<leader>ps - double grep 
<leader>gf - fzf git


### fugutive 
<leader> gs - whateve fugutive does

### oil nvim
<leader> t - toggle tree

### undo tree
<leader> u - toggle undoTree

### vim surround 

ds{surrounding} =  delete surroundings
"i am surrounded" -> i am surrounded 

cs{surrounding}{new_surrounding} = change the surroundings
'i am surrounded' -> "i am surrounded" 

ys{object}{surrounding} = adds surorunding

yst-" = ys trigger command, t- points to - , " adds brackets
i am surrounded -> "i am surrounded" 

yss{surrounding} = whole line
v{movement}S{surrounding} = works in visual mode
### Trouble

<leader>xx
<leader>xX
<leader>cs
<leader>cl
<leader>xL
<leader>xQ

### Zen
<leader>zz - zen
<leader>zZ - zen

### Conform 
<leader>ft - format

### comment
gcc - comment current line
gc{motion} - comment


# additional plugins i don't use but might consider
LPS's:
    ltex-ls
    harper-ls

