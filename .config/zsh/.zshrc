fpath=(
	$ZDOTDIR/functions
	$fpath
)

bindkey -e

# HISTORY
HISTFILE="$XDG_STATE_HOME/zsh_history"
SAVEHIST=100000
HISTSIZE=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
# ^P/^N to navigate local history
up-line-or-local-history () {
	zle set-local-history 1
	zle up-line-or-history
	zle set-local-history 0
}
down-line-or-local-history () {
	zle set-local-history 1
	zle down-line-or-history
	zle set-local-history 0
}
zle -N up-line-or-local-history
zle -N down-line-or-local-history
bindkey '^P' up-line-or-local-history
bindkey '^N' down-line-or-local-history

# COMPLETION
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"

# enable same completion as git for dot
compdef dot=git

# ALIAS
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
# TODO: Linux / Mac?
alias ls="ls -G"
alias ll="ls -lh"
alias path="echo $PATH | tr : $'\n'"

# INCLUDES
setopt NULL_GLOB
for file ($ZDOTDIR/.zshrc.*) {
	source $file
}
unsetopt NULL_GLOB

# PROMPT (should be handled last)
#setopt PROMPT_SUBST
#setopt TRANSIENT_RPROMPT
autoload -Uz promptinit && promptinit
prompt honai
