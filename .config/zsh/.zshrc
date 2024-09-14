fpath=(
	$ZDOTDIR/prompts
	$fpath
)

# HISTORY
HISTFILE="$XDG_STATE_HOME/zsh_history"
SAVEHIST=100000
HISTSIZE=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

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
