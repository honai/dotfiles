source "$XDG_CONFIG_HOME/rc.sh"

HISTFILE="$XDG_STATE_HOME/zsh/history"
[[ -f "$HISTFILE" ]] || mkdir -p $(dirname "$HISTFILE")
SAVEHIST=10000
HISTSIZE=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

typeset -g WORDCHARS=${WORDCHARS:s@/@}

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"

PROMPT='
%n@%M %~
%% '
