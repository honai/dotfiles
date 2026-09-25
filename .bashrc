source "$XDG_CONFIG_HOME/rc.sh"

HISTFILE="$XDG_STATE_HOME/bash/history"
[[ -f "$HISTFILE" ]] || mkdir -p $(dirname "$HISTFILE")

PS1='
\u@\h ${MSYSTEM}${WSL_DISTRO_NAME} \w
\$ '
