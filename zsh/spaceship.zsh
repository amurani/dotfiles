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

