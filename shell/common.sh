if [ -f $HOME/.dotfiles/shell/env.sh ]; then source $HOME/.dotfiles/shell/env.sh; fi
if [ -f $HOME/.dotfiles/shell/aliases.sh ]; then source $HOME/.dotfiles/shell/aliases.sh; fi
if [ -f $HOME/.dotfiles/shell/functions.sh ]; then source $HOME/.dotfiles/shell/functions.sh; fi

# homebrew
if [ -f /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# nvm (disabled to support lazy loading)
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# perl
source ~/perl5/perlbrew/etc/bashrc

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [ command -v pyenv &> /dev/null ]; then eval "$(pyenv init -)"; fi

# sdk man cause jenv has not been nice to me
if [ -f "$HOME/.sdkman/bin/sdkman-init.sh" ]; then source "$HOME/.sdkman/bin/sdkman-init.sh"; fi

# work: bk cli completions
if [ -f /usr/local/bin/bk ]; then source <(bk completion zsh); fi


# machine specific miscllaneous stuff e.g. cowsay seinfeld jokes
if [ -f $HOME/.misc.machine.sh ]; then source $HOME/.misc.machine.sh; fi

