mkdir -p "$XDG_STATE_HOME" "$XDG_CACHE_HOME"

path=(
	"$HOME/.local/bin"
	$path
)

# INCLUDES
setopt NULL_GLOB
for file ($ZDOTDIR/.zprofile.*) {
	source $file
}
unsetopt NULL_GLOB
