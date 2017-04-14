# Author: Sarp Orgul
# File: .zshrc
# ------------------
# zsh settings

# set term 256 color
export TERM="xterm-256color"

# I should not have to do this myself...
#export PATH=/usr/lib/smlnj/bin/:${PATH}

# because fuck
eval "$(thefuck --alias)"

export BROWSER=chromium

# make rvm work properly
source ~/.rvm/scripts/rvm

./.vim/plugged/gruvbox/gruvbox_256palette.sh

# ----------------------
# Powerlevel 9k Achieved
# ----------------------

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(rvm virtualenv vcs vi_mode root_indicator)

POWERLEVEL9K_IP_INTERFACE=wlo1

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# -------
# Aliases
# -------

alias sudu='sudo -E'
alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'

alias vi='vim'

alias hman='man --html=chromium'

alias c='clear'
alias e='exit'
alias t='tmux'
alias weather='curl wttr.in/'

alias neo='neofetch --image ~/Wallpapers/mountainsea.jpg'
alias spotify='spotify --force-device-scale-factor=2'

alias light='startx ./.xinitrc-light'

# rlwrap seems cool
alias sml='rlwrap -c sml'

# ----------------
# General Settings
# ----------------

# setup history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# better completion
autoload -Uz compinit promptinit
compinit
promptinit

# make default editor vim
export EDITOR='vim'

# adds transparency
#[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# makes control work properly
stty -ixon

# base16 Shell Colors
#BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-3024.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

zstyle ':completion:*' menu select # arrow keys for completion

# -----------------------
# File managment mappings
# -----------------------

# Alt+up - parent dir
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
bindkey '^[[1;3A'      cdParentKey

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
