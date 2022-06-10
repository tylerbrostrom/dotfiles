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
}

eval "$(starship init zsh)"
