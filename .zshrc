# ~/.zshrc — interactive zsh configuration.
# Environment and PATH are set in ~/.zshenv (which sources shell/env.sh).
#
# To profile startup: uncomment the next line and the `zprof` line at the end.
# zmodload zsh/zprof

# zsh-specific interactive config first (oh-my-zsh runs the single compinit here,
# so `compdef` is defined before anything in common.sh — e.g. `pyenv init` — uses it).
[ -f "$HOME/.dotfiles/zsh/init.zsh" ] && source "$HOME/.dotfiles/zsh/init.zsh"

# Shared interactive config (aliases + version managers) — also used by bash.
# Sourced after init.zsh so our aliases win over oh-my-zsh's.
[ -f "$HOME/.dotfiles/shell/common.sh" ] && source "$HOME/.dotfiles/shell/common.sh"

# zprof
