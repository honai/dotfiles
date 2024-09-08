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

# DOTFILES management
# enable same completion as git
compdef dit=git
# git wrapper for DOTFILES management
dit () {
	case "$1" in
		"add")
		# prevent adding all untracked files (= ALL files in $HOME)
		case "$2" in
			"."|"-A"|"--all")
				echo 'Do not add untracked files!' 1>&2
				return 1
				;;
		esac
		;;
	esac
	command git --git-dir="$DOT_REPO_DIR" "$@"
}

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
setopt TRANSIENT_RPROMPT
autoload -Uz promptinit && promptinit
prompt honai
