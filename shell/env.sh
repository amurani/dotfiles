# shell/env.sh — environment & PATH shared by all POSIX shells (bash + zsh).
#
# Sourced from ~/.zshenv (zsh) and ~/.bashrc (bash). Keep it POSIX and safe for
# non-interactive shells: exports and PATH only — no completions, no prompt, and
# no version-manager activation (those are lazy/interactive; see common.sh).

# Machine-specific, untracked overrides (usernames, work-only vars, etc.).
[ -f "$HOME/.env.machine.sh" ] && . "$HOME/.env.machine.sh"

# Homebrew (Apple Silicon or Intel). Sets PATH/MANPATH/INFOPATH.
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Kubernetes
export KUBECONFIG="$HOME/.kube/config"

# Tool roots. The managers themselves are activated lazily/interactively.
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export SDKMAN_DIR="$HOME/.sdkman"
export BUN_INSTALL="$HOME/.bun"

# PATH additions (built once, in priority order). `~/.dotfiles/bin` holds the
# portable helper scripts; keep it early so they take precedence.
export PATH="$HOME/.dotfiles/bin:$HOME/.local/bin:$PYENV_ROOT/bin:$BUN_INSTALL/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Windsurf / Codeium editor CLI, if installed on this machine.
[ -d "$HOME/.codeium/windsurf/bin" ] && export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# fzf defaults (interactive keybindings/completion are set up in zsh/init.zsh).
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if command -v ag >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
fi

# Locale / terminal
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
