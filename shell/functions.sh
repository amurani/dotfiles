# Git stuff
if [ -f $HOME/.dotfiles/shell/functions/git.sh ]; then source $HOME/.dotfiles/shell/functions/git.sh; fi
if [ -f $HOME/.dotfiles/shell/functions/kubectl.sh ]; then source $HOME/.dotfiles/shell/functions/kubectl.sh; fi
if [ -f $HOME/.dotfiles/shell/functions/work.sh ]; then source $HOME/.dotfiles/shell/functions/work.sh; fi

fzyarn() {
  yarn $(bat package.json | fx 'x => Object.keys(x.scripts).join("\n")' | fzf --preview "bat package.json | fx '.scripts[\"{}\"]'")
}
