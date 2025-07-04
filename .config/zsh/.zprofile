mkdir -p "$XDG_STATE_HOME" "$XDG_CACHE_HOME"

path=(
	"$HOME/.local/bin"
	$path
)

export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --HILITE-UNREAD -z-4'

GEM_HOME="$XDG_DATA_HOME/gems"
if [[ -d "$GEM_HOME/bin" ]]; then
	path=(
		"$GEM_HOME/bin"
		$path
	)
	export GEM_HOME
fi

PNPM_HOME="$XDG_DATA_HOME/pnpm"
if [[ -d "$PNPM_HOME" ]]; then
	path=(
		"$PNPM_HOME"
		$path
	)
	export PNPM_HOME
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1

# INCLUDES
setopt NULL_GLOB
for file ($ZDOTDIR/.zprofile.*) {
	source $file
}
unsetopt NULL_GLOB
