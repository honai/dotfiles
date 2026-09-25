# common interactive shell setting for bash, Zsh

export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --HILITE-UNREAD -z-4'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
