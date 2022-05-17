bindkey -v
setopt auto_cd
autoload -Uz compinit; compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# anon functions are auto-executed
function {
    local sources file

    sources=(
        $HOME/.aliases
        $HOME/.functions
        $HOME/.localrc
    )

    for file in $sources; do
        if [ -f $file ]
            then source $file
        fi
    done
}

eval "$(starship init zsh)"
