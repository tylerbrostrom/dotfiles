# make `cd` implicit (e.g. `directory` instead of `cd directory`)
setopt auto_cd
# set line-editor to `vi` mode
bindkey -v
# enable completion
autoload -Uz compinit; compinit -u
# load custom functions
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $ZDOTDIR/functions/*
# make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
# enable kitty’s shell integration
if [[ -n $KITTY_INSTALLATION_DIR ]]; then
	export KITTY_SHELL_INTEGRATION="enabled"
	autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
	kitty-integration
	unfunction kitty-integration
fi
# initialize prompt
eval "$(starship init zsh)"
# define aliases
source $ZDOTDIR/.zaliases
