<pre align=center>
      __ _ _           
     / _(_) | ___  ___ 
    | |_| | |/ _ \/ __|
 _  |  _| | |  __/\__ \
(_) |_| |_|_|\___||___/
                       
</pre>

## Setup

1. Clone the bare repo

    ```sh
    git clone --bare git@github.com:tylerbrostrom/dotfiles $HOME/.dotfiles.git
    ```

2. Checkout files
   
   >Be sure to move/backup any files which would be overwritten by the following checkout! 

    ```sh
    git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME checkout
    ```

3. Install Homebrew

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

4. Open a new shell and install dependencies specified by `~/.Brewfile`

    ```sh
    zsh
    brew bundle -g install
    ```

5. Install Fonts

    - [MonoLisa](https://www.monolisa.dev)
    - [NerdFont Symbols](https://github.com/ryanoasis/nerd-fonts/blob/196f78789a3ee9e5ff9d0f2cdc9b6c3fd41d6e8e/patched-fonts/NerdFontsSymbolsOnly/complete/Symbols-2048-em%20Nerd%20Font%20Complete.ttf)

## Making Changes

Use `dotf` instead of `git`

- `dotf` is a shell alias for `git` where `GIT_DIR=$HOME/.dotfiles.git` and `GIT_WORK_TREE=$HOME`

    ```sh
    dotf status
    dotf commit -v
    ```

- `git` aliases still work too

    ```sh
    dotf st
    dotf ci
    ```

## Acknowledgements

- [@durdn](https://twitter.com/durdn) for the write-up: [How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)
