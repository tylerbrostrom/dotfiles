bindkey -v
setopt auto_cd
autoload -Uz compinit promptinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

typeset -aU path
path=(
    $HOME/.bin
    $DENO_INSTALL/bin
    $HOME/.cargo/bin
    $PNPM_HOME
    $HOME/.composer/vendor/bin
    $path
)

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

unset sources file

eval "$(starship init zsh)"
