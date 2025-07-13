fpath=(
	$ZDOTDIR/functions
	$fpath
)

bindkey -e
unsetopt FLOWCONTROL

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
select-history() {
  BUFFER=$(history -n -r 1 | fzf --reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
if type fzf >/dev/null; then
	bindkey '^r' select-history
fi
zle -N up-line-or-local-history
zle -N down-line-or-local-history
bindkey '^P' up-line-or-local-history
bindkey '^N' down-line-or-local-history

# move/delete per slash
typeset -g WORDCHARS=${WORDCHARS:s@/@}

# update time on enter command
re-prompt() {
	zle .reset-prompt
	zle .accept-line
}
zle -N accept-line re-prompt

# COMPLETION
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"

# enable same completion as git for dot
compdef dot=git

# ALIAS
setopt autocd
autoload -Uz j
alias ,="j ,"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
system_type="$(uname -s)"
if [ "$system_type" = "Darwin" ]; then
	alias ls="ls -G"
else
	alias ls="ls --color=auto"
fi
alias ll="ls -lh"
alias l="less"
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
