## Setup

1. Install dotfiles

    Clone as a bare repository

    ```sh
    mkdir $HOME/.dotfiles && cd $_
    git clone --bare git@github.com:tylerbrostrom/dotfiles.git .
    ```

    Checkout dotfiles into $HOME

    ```sh
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME submodule update --init --recursive
    ```

    >The dirname, `.dotfiles/`, is arbitrary. Wanna change it? Be sure to add the new dirname to `.gitignore`.

2. Close the shell, and open a new one

3. Install dependencies & apps

    ```sh
    # install Homebrew package manager
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

    ```sh
    # install dependencies specified by ~/.Brewfile
    beer install
    ```

### Install Fonts

- [MonoLisa](https://www.monolisa.dev)
- [NerdFont Symbols](https://github.com/ryanoasis/nerd-fonts/blob/196f78789a3ee9e5ff9d0f2cdc9b6c3fd41d6e8e/patched-fonts/NerdFontsSymbolsOnly/complete/Symbols-2048-em%20Nerd%20Font%20Complete.ttf)
## Development

Use `dot` to manage dotfiles.

>`dot` is just a zsh alias for `git` that works from any directory.

```sh
# use it like you’d use git
dot add -p
dot push origin main

# git aliases still work
dot st
dot ci
```

### Updating Dependencies

Use `beer` to manage Homebrew dependencies.

>Run `beer -h` for a rundown of all the subcommands.
