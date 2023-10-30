if [ -f $HOME/.dotfiles/shell/common.sh ]; then source $HOME/.dotfiles/shell/common.sh; fi

export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh config from personal dotfiles
if [ -f $HOME/.dotfiles/zsh/init.zsh ]; then source $HOME/.dotfiles/zsh/init.zsh; fi

if [ ! type kubectl &> /dev/null ]; then source <(kubectl completion zsh); fi # this slows zsh the fuck down
export KUBECONFIG=~/.kube/config

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
# source /Users/kevinmurani/.rvm/scripts/rvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bk cli completions
if [ -f /usr/local/bin/bk ]; then source <(bk completion zsh); fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/homebrew/bin:$PATH"
if [ -f /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

source ~/perl5/perlbrew/etc/bashrc

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [ command -v pyenv &> /dev/null ]; then eval "$(pyenv init -)"; fi

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# FYI: sudo ln -sfn /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home ~/.jenv/versions/11 for the "jenv: version `11' is not installed" pain
