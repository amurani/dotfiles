# .zshenv — sourced for ALL zsh invocations (login, interactive, and scripts).
# Keep this to environment + PATH only; interactive config lives in .zshrc.
if [ -f "$HOME/.dotfiles/shell/env.sh" ]; then
    . "$HOME/.dotfiles/shell/env.sh"
fi
