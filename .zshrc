bindkey -v
setopt auto_cd
autoload -Uz compinit promptinit
compinit -u
promptinit
prompt pure
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export EDITOR=vim
export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--layout=reverse"
export N_PREFIX=$HOME/.node

typeset -U PATH path # dedupes values in the `path` array
path=(
    $HOME/.bin
    $N_PREFIX/bin
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
