if [ -f $HOME/.dotfiles/shell/env.sh ]; then source $HOME/.dotfiles/shell/env.sh; fi
if [ -f $HOME/.dotfiles/shell/aliases.sh ]; then source $HOME/.dotfiles/shell/aliases.sh; fi
if [ -f $HOME/.dotfiles/shell/functions.sh ]; then source $HOME/.dotfiles/shell/functions.sh; fi

# homebrew
if [ -f /opt/homebrew/bin/brew ]; then eval "$(/opt/homebrew/bin/brew shellenv)"; fi

# nvm (disabled to support lazy loading)
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# perl
source ~/perl5/perlbrew/etc/bashrc

# pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [ command -v pyenv &> /dev/null ]; then eval "$(pyenv init -)"; fi

# jenv
eval "$(jenv init -)"
# FYI: sudo ln -sfn /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home ~/.jenv/versions/11 for the "jenv: version `11' is not installed" pain

# work: bk cli completions
if [ -f /usr/local/bin/bk ]; then source <(bk completion zsh); fi
