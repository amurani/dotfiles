# --------------- git ------------------
alias gnp='git --no-pager'
alias mygit='git log --author="Kevin Murani"'
alias gti='git'
alias gut='git'
alias gs='git fetch && git status'

# --------------- /git ------------------

# --------------- /apps ------------------
alias reply=/usr/local/bin/reply
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias vim=/usr/local/Cellar/vim/8.2.1900/bin/vim
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# --------------- /apps ------------------

# --------------- /work ------------------
if [ -f $HOME/.aliases.work.sh ]; then source $HOME/.aliases.work.sh; fi
# --------------- /work ------------------

