plugins=(git battery)

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.dotfiles/zsh/spaceship.zsh ]; then source $HOME/.dotfiles/zsh/spaceship.zsh; fi

if [ -f $HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh ]; then source $HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh; fi

if [ -f ~/.fzf.zsh  ]; then source ~/.fzf.zsh; fi

