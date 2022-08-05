tap "cloudflare/cloudflare"
tap "homebrew/cask"

brew "bat"
brew "cloudflare/cloudflare/cloudflared"
brew "coreutils" # wanted `ls --hyperlink=auto`
brew "curl"
brew "deno"
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
brew "htop"
brew "httpie"
brew "hugo"
brew "imagemagick"
brew "jq"
brew "just"
brew "lazygit"
# brew "mas"
brew "neofetch"
brew "nmap"
brew "nvim"
brew "pandoc"
brew "pnpm"
brew "ripgrep"
brew "rustup"
brew "sqlite"
brew "starship"
brew "tree"
brew "wget"
brew "youtube-dl"

# these casks DO NOT have checksums
# there’s no way to negate `require_sha`
# so they’re listed here, before `require_sha` is declared
cask "cloudflare-warp"
cask "sizzy"
cask "spotify"

cask_args require_sha: true

# these casks have checksums
cask "1password", args: { appdir: "/Applications" }
cask "brave-browser"
cask "docker"
cask "imagealpha"
cask "imageoptim"
cask "kitty"
cask "qlmarkdown"
cask "rectangle"
cask "syntax-highlight"
cask "visual-studio-code"
cask "vlc"

# mas "GarageBand", id: 682658836
# mas "MindNode", id: 1289197285
