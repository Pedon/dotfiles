#
# Sarp's zsh config
#

# set term 256 color
export TERM="xterm-256color"

#
# powerlevel 9k achieved. we did it boys
#

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs time vi_mode root_indicator)

POWERLEVEL9K_IP_INTERFACE=wlo1

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

#
# Aliases
#
alias sudo='sudo -E'

# better completion
autoload -Uz compinit promptinit
compinit
promptinit

#

# adds transparency
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# makes control work properly
stty -ixon

# base16 Shell Colors
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

zstyle ':completion:*' menu select # arrow keys for completion

# File managment mappings
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

export EDITOR='vim'
