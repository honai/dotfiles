#!/bin/sh
set -eux

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

DOT_DATA_DIR="$XDG_DATA_HOME/dotfiles"
DOT_REPO_DIR="$DOT_DATA_DIR/repo.git"
mkdir -p $XDG_CACHE_HOME $DOT_DATA_DIR

# clone
CLONE_TMP_DIR="$XDG_CACHE_HOME/dotfiles.tmp"
git clone --no-checkout --separate-git-dir="$DOT_REPO_DIR" \
    https://github.com/honai/dotfiles.git \
    "$CLONE_TMP_DIR"
export GIT_DIR="$DOT_REPO_DIR"
git config core.worktree "$HOME"
git config status.showUntrackedFiles no
rm -rf $CLONE_TMP_DIR

# checkout
git reset -- .
git ls-files --deleted | while IFS= read -r file; do
    git checkout -- ":/$file"
done
if [ -n "$(git ls-files --modified)" ]; then
    echo "Local files that differs from the dotfiles repo were found.
Run dit status."
fi
