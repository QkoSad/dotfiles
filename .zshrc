autoload -U colors && colors
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
alias history="history 1 | cut -c 8- | sort -u | fzf"
# when i kill tmux it writes properly
setopt APPEND_HISTORY 
# different sessions share history
setopt SHARE_HISTORY 
# add timestams
setopt EXTENDED_HISTORY
# dunno
setopt extendedglob nomatch notify
# turn off beeping
unsetopt autocd beep

#aliases
alias cat=bat
alias ls=exa
alias la="exa -lah"
alias ll="exa -l"
alias urm=rm
alias rm=trash
# starts bc in float mode
alias bc="bc -l"
# alias cd=z
alias grep="grep --with-filename --line-number --color=auto -i"
# makes nnn rash instead of delete
alias t="NNN_TRASH=1 nnn -e"
alias cp="advcp -g"
alias mv="advmv -g"
# Mozilla Bug 1908825 makes both browsers crash in wayland this forces them to
# run in xwayland and not crash, those aliases can be removed when the bugfix is
# mergen in the browsers. It is unknow when this will happen since both browsers
# merge mozilla extended release which are 52 weaks behind. This link will say
# when the bugfix has been merged: https://gitlab.torproject.org/tpo/applications/tor-browser-build/-/raw/maint-13.5/projects/browser/Bundle-Data/Docs-TBB/ChangeLog.txt
alias mullvad-browser="MOZ_ENABLE_WAYLAND=0 nohup mullvad-browser &>/dev/null &"
alias torbrowser-launcher="MOZ_ENABLE_WAYLAND=0 nohup torbrowser-launcher &>/dev/null &"
alias webRip="wget --random-wait -r -p -e robots=off -U mozilla"

# prompt
PS1="%F{magenta}%n@%m%f %B%F{yellow}%~%f%b"$'\n'"%F{yellow}%?%f %F{cyan}%%%f "
# vi mode
bindkey -v
export KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Basic auto/tab complete:
autoload -Uz compinit 
# menu when tabbing
zstyle ':completion:*' menu select
# case insensite when tabbing
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# set colors for tab menu. the string is drawn from dircolors. for some reason
# zsh does not want to use the variable LS_COLORS
zstyle ':completion:*:default' list-colors 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'

# below is a bit more complex completion
# zstyle ':completion:*:*:*:default' menu yes select search
#
zmodload zsh/complist
compinit
# _comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# for some reason no history search in vim mode
bindkey "^R" history-incremental-search-backward

#notes
notes() { nvim --cmd 'cd ~/.notes'}   
# commands
mem(){
  if [[ -z $1 ]]; then
    \cat ~/.commands
  else
    echo "Description:\n"$1"\nCommand:\n"$2"\n------------" >> ~/.commands 
  fi
}
#time-tracking
time-start(){
  declare desc="$1"
  echo "${1} Started - `date +'%H:%m %D'`" >>  ~/.time
}
time-stop(){
  declare desc="$1"
  echo "${1} Finished - `date +'%H:%m %D'`" >>  ~/.time
}
time-ls(){
  cat ~/.time
}
# finding things
fcd(){
  cd "$(find -type d | fzf)"
}
open(){
  xdg-open "$(find -type f | fzf)"
}
# find files into fzf replace starting ./ with nothing  
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
# fzf with preview
alias fzf="fzf --preview '/usr/bin/bat {} --color=always'"
# zoxided
eval "$(zoxide init zsh)"
# lynx 
alias lynx="lynx --useragent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1 Lynx' -cfg=$HOME/.config/lynx/lynx.cfg -lss=$HOME/.config/lynx/lynx.lss"
# lyxn search ripped rom https://github.com/rwxrob
urlencode() {
  declare str="$*"
  declare encoded=""
  for (( i=0; i<${#str}; i++ )); do
    c=${str:$i:1}
    case "$c" in
      [-_.~a-zA-Z0-9] ) x="$c" ;;
      * ) printf -v x '%%%02x' "'$c" ;;
    esac
    encoded+="$x"
  done
  echo "$encoded"
}
duck () {
  declare url=$(urlencode "$*")
  lynx "https://duckduckgo.com/lite?q=$url"
}
alias "?"=duck

# shell built ins man pages
unalias run-help
autoload run-help
alias help=run-help

# autostart DE
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec Hyprland
fi
# configurations so home dir stays clean
alias irssi="irssi --config='$XDG_CONFIG_HOME'/irssi/config --home='$XDG_DATA_HOME'/irssi"
alias nvidia-settings="nvidia-settings --config='$XDG_CONFIG_HOME'/nvidia/settings"
alias mbsync="mbsync -c '$XDG_CONFIG_HOME'/isync/mbsyncrc"
alias yarn="yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn/config'"

# Plugins
# zsh substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

