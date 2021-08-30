if [ -f $HOME/.dotfiles/shell/common.sh ]; then source $HOME/.dotfiles/shell/common.sh; fi

export HISTTIMEFORMAT="%d/%m/%y %T "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [ -f $HOME/.dotfiles/bash/init.bash ]; then source $HOME/.dotfiles/bash/init.bash; fi

