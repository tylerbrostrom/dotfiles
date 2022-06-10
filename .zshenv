export ZDOTDIR=$HOME/.config/zsh

export EDITOR=nvim

export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--layout=reverse"

export GOPATH=$HOME/.go
export DENO_INSTALL_ROOT=$HOME/.deno
export PNPM_HOME=$HOME/Library/pnpm

# preserves `npm` version between `node` versions
export N_PRESERVE_NPM=1
export N_PREFIX=$HOME/.node

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

# $path
#
# why can’t we just set $path here, in ~/.zshenv, and call it a day?
# on MacOS, /etc/zprofile annoyingly meddles with $path order
# we fix $path order by setting $path inside $ZDOTDIR/.zprofile
if [[ ! -o login ]]; then source $ZDOTDIR/conf.d/path; fi
