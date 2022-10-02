export DOTFILES_GIT_DIR=$HOME/.dotfiles.git

export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

export LESS='-i -s -S -R'

export CARGO_HOME=$HOME/.cargo
export DENO_DIR=$HOME/.deno
export DENO_INSTALL_ROOT=$DENO_DIR/bin
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git'
export FZF_DEFAULT_OPTS=" \
  --layout=reverse \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export GOPATH=$HOME/.go

export HOMEBREW_AUTO_UPDATE_SECS=900
export HOMEBREW_AUTOREMOVE=1
export HOMEBREW_BAT=1
export HOMEBREW_CASK_OPTS=--appdir=$HOME/Applications
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

export N_PREFIX=$HOME/.n
export N_PRESERVE_NPM=1
export N_PRESERVE_COREPACK=1

export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME:-$HOME/.config}/ripgrep/config

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

path=(
  $HOME/.local/bin
  $path
  $CARGO_HOME/bin
  $DENO_INSTALL_ROOT
  $GOPATH/bin
  $N_PREFIX/bin
)

# My Zsh vars
export ZFUNCDIR=${ZFUNCDIR:-${ZDOTDIR:-$HOME/.config/zsh}/functions}
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-~}/.zplugins}
