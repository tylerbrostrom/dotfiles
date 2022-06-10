bindkey -v
setopt auto_cd
autoload -Uz compinit; compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function {
    local sources file

    sources=(
        $ZDOTDIR/conf.d/aliases
        $ZDOTDIR/conf.d/functions
    )

    for file in $sources; do
        if [ -f $file ]
            then source $file
        fi
    done

    # Enable kitty’s shell integration
    if [[ -n $KITTY_INSTALLATION_DIR ]]; then
      export KITTY_SHELL_INTEGRATION="enabled"
      autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
      kitty-integration
      unfunction kitty-integration
    fi

    # Initialize prompt
    eval "$(starship init zsh)"
}

