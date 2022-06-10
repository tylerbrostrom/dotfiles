## Setup

1. Install dotfiles

    ```sh
    # clone as a bare repository
    mkdir $HOME/.dotfiles && cd $_
    git clone --bare git@github.com:tylerbrostrom/dotfiles.git .
    ```

    ```sh
    # checkout dotfiles into $HOME
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
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
