mkdir -p "$XDG_STATE_HOME" "$XDG_CACHE_HOME"

path=(
	"$HOME/.local/bin"
	$path
)

export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --HILITE-UNREAD -z-4'

export VIRTUAL_ENV_DISABLE_PROMPT=1

# INCLUDES
setopt NULL_GLOB
for file ($ZDOTDIR/.zprofile.*) {
	source $file
}
unsetopt NULL_GLOB
