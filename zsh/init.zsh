plugins=(git battery)

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.dotfiles/zsh/spaceship.zsh ]; then source $HOME/.dotfiles/zsh/spaceship.zsh; fi

if [ -f ~/.fzf.zsh  ]; then source ~/.fzf.zsh; fi

