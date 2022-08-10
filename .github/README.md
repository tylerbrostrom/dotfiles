<pre align=center>
      __ _ _           
     / _(_) | ___  ___ 
    | |_| | |/ _ \/ __|
 _  |  _| | |  __/\__ \
(_) |_| |_|_|\___||___/
                       
</pre>

## Setup

1. Clone this repository
    
    ```sh
    GIT_DIR=$HOME/.dotfiles git clone --bare https://github.com/tylerbrostrom/dotfiles.git
    ```

2. Checkout files and submodules

    ```sh
    GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME git checkout && git submodule update --init --recursive
    ```
    
    >Neovim config is included as a submodule (https://github.com/tylerbrostrom/nvim-config)
    
3. Install Homebrew

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

4. Install dependencies specified by `~/.Brewfile`

    ```sh
    zsh
    beer up
    ```

5. Install Fonts

    - [MonoLisa](https://www.monolisa.dev)
    - [NerdFont Symbols](https://github.com/ryanoasis/nerd-fonts/blob/196f78789a3ee9e5ff9d0f2cdc9b6c3fd41d6e8e/patched-fonts/NerdFontsSymbolsOnly/complete/Symbols-2048-em%20Nerd%20Font%20Complete.ttf)

## Making Changes

Instead of `git`, use `dot`.

- It’s _just_ an alias for `git` (where `GIT_DIR=$HOME/.dotfiles` and `GIT_WORK_TREE=$HOME`)

    ```sh
    dot status
    dot commit -v
    ```

- Git aliases still work

    ```sh
    dot st
    dot ci
    ```

- Works regardless of current working directory
- Zsh completions still work

## Managing Dependencies

Instead of `brew`, use `beer`.

```
beer - Manage global Homebrew dependencies specified by ~/.Brewfile

USAGE:
beer up       Upgrade outdated deps; install missing deps
beer sync     Remove unspecified deps; install missing deps
beer check    Check for outdated, missing, or unspecified deps
beer ls       List deps by type: formula, cask, tap
beer ls-tree  List formulas and their dependencies
```

## Acknowledgements

- [@durdn](https://twitter.com/durdn) for the write-up: [How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)
