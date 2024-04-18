# this is for machine specific settings that will not be tracked in git
if [ -f $HOME/.env.machine.sh ]; then source $HOME/.env.machine.sh; fi

# kubernetes
export KUBECONFIG=~/.kube/config

# homebrew
export PATH="/usr/local/homebrew/bin:$PATH"
if [ -f /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# nvm (disabled to supportlazy loading)
# export NVM_DIR="$HOME/.nvm"

# node/yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"

# fzf
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)" # for shell integration
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
    if command -v ag &> /dev/null; then export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'; fi
else
    echo "No FZF"
fi
