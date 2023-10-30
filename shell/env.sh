# this is for machine specific settings that will not be tracked in git
if [ -f $HOME/.env.machine.sh ]; then source $HOME/.env.machine.sh; fi

# kubernetes
export KUBECONFIG=~/.kube/config

# homebrew
export PATH="/usr/local/homebrew/bin:$PATH"
if [ -f /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# nvm
export NVM_DIR="$HOME/.nvm"

# node/yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"

