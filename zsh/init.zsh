export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export NVM_LAZY_LOAD=true

plugins=(git battery zsh-nvm zsh-autosuggestions)

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# spaceship prompt for zsh
if [ -f $HOME/.dotfiles/zsh/spaceship.zsh ]; then source $HOME/.dotfiles/zsh/spaceship.zsh; fi

# starship prompt
# if [ -f $HOME/.dotfiles/zsh/starship.zsh ]; then source $HOME/.dotfiles/zsh/starship.zsh; fi

# syntax highlighting for zsh
# if [ -f source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
if [ -f $HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ]; then source $HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh; fi

# fzf
if [ -f ~/.fzf.zsh  ]; then source ~/.fzf.zsh; fi

# kubernetes
if [ ! type kubectl &> /dev/null ]; then source <(kubectl completion zsh); fi # this slows zsh the fuck down

# google could tools
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kevinmurani/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kevinmurani/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kevinmurani/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kevinmurani/google-cloud-sdk/completion.zsh.inc'; fi
