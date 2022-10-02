# vim: filetype=ruby
tap "homebrew/cask"

brew "bat"
brew "coreutils" # wanted `ls --hyperlink=auto`
brew "curl"
brew "deno"
brew "difftastic"
brew "dog"
brew "exa"
brew "fd"
brew "ffmpeg"
brew "figlet"
brew "fzf"
brew "gh"
brew "git"
brew "git-lfs"
brew "go"
brew "gum"
brew "htop"
brew "httpie"
brew "imagemagick"
brew "jq"
brew "lazygit"
brew "n"
brew "neofetch"
brew "nmap"
brew "nvim"
brew "pandoc"
brew "ripgrep"
brew "rustup"
brew "shellcheck"
brew "sqlite"
brew "starship"
brew "tree"
brew "wget"

# these casks DO NOT have checksums
# there’s no way to negate `require_sha`
# so they’re listed here, before `require_sha` is declared
cask "cloudflare-warp"
cask "spotify"

cask_args require_sha: true

# these casks have checksums
cask "1password", args: { appdir: "/Applications" }
cask "1password-cli"
cask "brave-browser"
cask "docker"
cask "imagealpha"
cask "imageoptim"
cask "kitty"
cask "qlmarkdown"
cask "rectangle"
cask "syntax-highlight"
cask "vscodium"
cask "vlc"

