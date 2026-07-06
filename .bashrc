# ~/.bashrc — bash configuration.

# Environment & PATH (shared with zsh; zsh loads this via ~/.zshenv).
[ -f "$HOME/.dotfiles/shell/env.sh" ] && source "$HOME/.dotfiles/shell/env.sh"

# Shared interactive config (aliases + version managers).
[ -f "$HOME/.dotfiles/shell/common.sh" ] && source "$HOME/.dotfiles/shell/common.sh"

# bash-specific interactive config.
[ -f "$HOME/.dotfiles/bash/init.bash" ] && source "$HOME/.dotfiles/bash/init.bash"
