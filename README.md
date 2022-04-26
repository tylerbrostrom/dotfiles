# Dotfiles for Familiar, Cozy Development

When your 2012 MacBook Pro inevitably fails, this setup will spare you from:

- Installing apps and system dependencies
- Configuring `zsh`, `git`, `vim`, `npm`, etc.

Wherever you find yourself, be it MacOS, Ubuntu, or Windows (WSL2), it's gonna be okay. **You're welcome, future me.**

## Setting up a new machine

<details>
<summary>Setting up a Windows or Linux machine?</summary>
<p>
    
> You're first going to need to install `zsh` and make it your default shell:
>
> ```sh
> sudo apt install zsh
> chsh -s $(which zsh)
> ```
>
> Close this shell, and open a new one.
>
> Enter 'q' to skip the initial setup prompt (the next step will place a `.zshrc` config file in your home directory).
</details>
</p>

### 1. Install dotfiles

```sh
cd $HOME && mkdir .dotfiles && cd .dotfiles
git clone --bare git@github.com:tylerbrostrom/dotfiles.git .
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' checkout
```

>The `.dotfiles/` dirname is arbitrary. If you want to change the directory name, be sure to add it to `.gitignore`

### 2. Install Homebrew, formulae and casks

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/bundle
brew bundle install --global
```

### 3. Install pnpm, Node.js

```sh
curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.0.0-rc.8 sh -
pnpm env use --global lts
```

>TODO: try installing pnpm via brew as soon as pnpm@7 is available

## Managing dotfiles

The `dot` command is an alias for `git` that can be invoked from any directory.

Use it like you’d use git:

```sh
dot status
dot commit
dot add -p
```
