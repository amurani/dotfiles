export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git battery zsh-syntax-highlighting)

if [ -f $HOME/.alias ]; then source $HOME/.alias; fi
if [ -f $HOME/.functions ]; then source $HOME/.functions; fi
if [ -f $HOME/.env ]; then source $HOME/.env; fi

source $ZSH/oh-my-zsh.sh

# source <(kubectl completion zsh) # this slows zsh the fuck down
export KUBECONFIG=~/.kube/config:~/.kube/kubconfig2

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

ZSH_THEME="spaceship"
source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh


# commenting out this line in reference to issue hghlighted above
# if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi # setup autocomplete in zsh into the current shell

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kevinmurani/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kevinmurani/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kevinmurani/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kevinmurani/google-cloud-sdk/completion.zsh.inc'; fi

alias reply=/usr/local/bin/reply

source "/Users/kevinmurani/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
# source /Users/kevinmurani/.rvm/scripts/rvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
