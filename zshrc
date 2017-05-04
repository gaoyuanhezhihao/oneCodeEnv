

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
[[ $TMUX = "" ]] && export TERM="xterm-256color"
source ~/oneCodeEnv/scripts/sourceAll.sh
