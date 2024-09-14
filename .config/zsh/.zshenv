export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

setopt NULL_GLOB
for file ($ZDOTDIR/.zshenv.*) {
	source $file
}
unsetopt NULL_GLOB