# Dotfiles for Cozy Development (on MacOS)

When the 2012 MacBook Pro inevitably fails, these dotfiles will spare you from:

- Installing apps and system dependencies
- Configuring `git`, `vim`, `zsh`

You're welcome, future me.

>BTW: With some tweaking, this setup _could_ work on straight-up Linux or Windows (via Windows Subsystem for Linux). Probs would just need to install `zsh` and make _it_ the default shell.

## Setting up a new machine

Symlink dotfiles to home directory:
```sh
./install.sh
```

### Apps & Dependencies

Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install and upgrade all dependencies from the global `.Brewfile`:

```sh
brew bundle install --global
```

>BTW: Setting up a Linux machine? Probs need to comment out Mac-specific stuff in `.Brewfile` before running `brew bundle`. Or maybe you don't. I dunno; find out.

### Get Ready for JavaScriptin'

Download and install the latest version of Node.js via `n` (Node.js version manager previously installed via Homebrew):

```sh
n lts
```

>Note @ self: Maybe replace `n` with `pnpm env` in the future (one less tool to worry about).

Download and install `pnpm` package manager:

```sh
curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
```

Install the ever-so-excellent Pure `zsh` theme:

```sh
pnpm add -g pure-prompt
```
