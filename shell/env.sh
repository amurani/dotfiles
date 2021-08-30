export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/Users/kmurani/.zfunctions")

# this is for machine specific settings that will not be tracked in git
if [ -f $HOME/.env.machine.sh ]; then source $HOME/.env.machine.sh; fi
