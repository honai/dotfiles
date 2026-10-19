setopt NULL_GLOB
source "${XDG_CONFIG_HOME:-$HOME/.config}/profile"
unsetopt NULL_GLOB

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
[[ -d "$ZDOTDIR" ]] || mkdir -p "$ZDOTDIR"
