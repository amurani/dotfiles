# zmodload zsh/zprof

# command not found: compdef
autoload -Uz compinit
compinit -i

if [ -f $HOME/.dotfiles/shell/common.sh ]; then source $HOME/.dotfiles/shell/common.sh; fi
if [ -f $HOME/.dotfiles/zsh/init.zsh ]; then source $HOME/.dotfiles/zsh/init.zsh; fi
# zprof

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/kevinmurani/.bun/_bun" ] && source "/Users/kevinmurani/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
