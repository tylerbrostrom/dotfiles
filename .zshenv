# Shell
export ZDOTDIR=$HOME/.config/zsh

# Common
export EDITOR=nvim
export PAGER=less

# Tools
export CARGO_HOME=$HOME/.cargo # referenced by $path
export DENO_DIR=$HOME/.deno
export DENO_INSTALL_ROOT=$DENO_DIR/bin # referenced by $path
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git'
export FZF_DEFAULT_OPTS=--layout=reverse
export GOPATH=$HOME/.go # referenced by $path
export HOMEBREW_AUTO_UPDATE_SECS=900
export HOMEBREW_CASK_OPTS=--appdir=$HOME/Applications
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30
export HOMEBREW_NO_GITHUB_API=1
export LESS=-isSR
export PNPM_HOME=$HOME/.pnpm # referenced by $path

# Setting $path
#
# Q: Why can’t we simply, unconditionally set $path here, in ~/.zshenv, and call it a day?
# A: On MacOS, /etc/zprofile (which only loads for login shells) annoyingly meddles with $path order.
#    We fix $path order by setting $path inside $ZDOTDIR/.zprofile (which loads after /etc/zprofile).
if [[ ! -o login ]]; then source $ZDOTDIR/conf.d/path; fi
