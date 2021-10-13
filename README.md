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

Symlink dotfiles to home directory:
```sh
./install.sh
```

### Apps & Dependencies

Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install and upgrade all apps and system dependencies from the global `.Brewfile`:

```sh
brew bundle install --global
```

> On Linux, `brew bundle` will skip cask installs and other MacOS-specific stuff.

### Get Ready for JavaScriptin'

Download and install the latest version of Node.js via `n` (Node.js version manager previously installed with Homebrew):

```sh
n lts
```

>Note @ self: Maybe replace `n` with `pnpm env` in the future (one less tool to worry about).

Download and install `pnpm` package manager:

```sh
curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
```

### Perty Promptin'

Install the ever-so-excellent `pure-prompt` theme for `zsh`:

```sh
pnpm add -g pure-prompt
```

Close this shell, and open a new one. Voila, it's perty!

<details>
<summary>Did it fail?</summary>
<p>

> If `pure-prompt` fails to install itself, manually run its `postinstall` npm script with `sudo`:
>
> ```sh
> cd $(pnpm root -g)/pure-prompt
> sudo $(which pnpm) run postinstall
> ```
</p>
</details>
