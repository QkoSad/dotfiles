export EDITOR=nvim
export XDG_CONFIG_HOME=/home/arch/.config
export XDG_CACHE_HOME=/home/arch/.cache
export XDG_DATA_HOME=/home/arch/.local/share
export XDG_STATE_HOME=/home/arch/.local/state
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export XDG_PICTURES_DIR=/home/arch/documents/Pictures/Screenshots
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHON_HISTORY=$XDG_STATE_HOME/python
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export W3M_DIR="$XDG_STATE_HOME/w3m"

# fabric AI, if fabric fails i can uncomment those
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# path=($GOROOT/bin $path)
# path=($GOPATH/bin $path)
# path=($HOME/.local/bin $path)
# export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

# from archwiki to prevent path duplication
typeset -U path PATH
path=($HOME/Documents/scripts $path)

# needed for webUI stable diffusion
export python_cmd="python3.11"

# conda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

export PATH
