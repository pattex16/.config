#           _                 _     
#  ___  ___| |____    _______| |__  
# / __|/ _ \ |_  /___|_  / __| '_ \ 
# \__ \  __/ |/ /_____/ /\__ \ | | |
# |___/\___|_/___|   /___|___/_| |_|
                                  
source "$ZDOTDIR/alias"

bindkey -v
bindkey -v '^?' backward-delete-char

source ~/.config/zsh/keymap

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
_comp_options+=(globdots)
zstyle ':completion::complete:*' gain-privileges 1
# eval $(navi widget zsh)

_call_navi() {
  local selected
  if [ -n "$LBUFFER" ]; then
    if selected="$(printf "%s" "$(navi --print --fzf-overrides '--no-select-1' --query "${LBUFFER}" </dev/tty)")"; then
      LBUFFER="$selected"
    fi
  else
    if selected="$(printf "%s" "$(navi --print </dev/tty)")"; then
      LBUFFER="$selected"
    fi
  fi
  zle redisplay
}

zle -N _call_navi

bindkey '^g' _call_navi

setopt autocd
stty stop undef

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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

bindkey -s '^o' 'ranger\n' 
bindkey -s '^f' '$(fzf)\n'
# bindkey -s '^g' 'navi\n'

#PLUGINS
source ~/.config/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.configre/zsh/plugins/zsh-autocomplete/zsh-autocomplete.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-github-cli-completion.zsh
# source ~/.config/zsh/plugins/zsh-ddgr-completion.zsh
# source "/usr/share/doc/pkgfile/command-not-found.zsh"

if [[ $(whoami) = "u0_a219" ]];
then
  [[ -z $TMUX ]] && tmux
fi

autoload -Uz compinit
compinit -d ~/.cache/zsh/.zcompdump
# kitty + complete setup zsh | source /dev/stdin
setopt promptsubst

local hostname_short=$(hostname | cut -c -5)

if [[ $(whoami) = "root" ]]
then
  PROMPT='%B%F{red}%n%f%b@%B%F{blue}$hostname_short%f%b:%F{yellow}%B$(~/.config/zsh/plugins/pwd-shorten/pwd-shorten.py)%b%f%# '
else
  PROMPT='%B%F{green}%n%f%b@%B%F{blue}$hostname_short%f%b:%F{yellow}%B$(~/.config/zsh/plugins/pwd-shorten/pwd-shorten.py)%b%f%# '
fi

# export TERM="kitty"

