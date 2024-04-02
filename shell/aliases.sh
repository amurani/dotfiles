# --------------- git ------------------
alias gnp='git --no-pager'
alias mygit='git log --author="Kevin Murani"'
alias gti='git'
alias gut='git'
alias gs='git fetch && git status'
alias gaf='git add $(git status -s | awk "{ print \$2 }" | fzf --multi --preview "bat --style=numbers --color=always --line-range :500 {} -p")' # [g]it [a]dd via [f]zf
alias gbf='git checkout $(brnch)' # [g]it checkout [b]ranch via [f]zf

# --------------- /git ------------------

# --------------- /apps ------------------
alias reply=/usr/local/bin/reply
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# --------------- /apps ------------------

# --------------- /work ------------------
if [ -f $HOME/.aliases.work.sh ]; then source $HOME/.aliases.work.sh; fi
# --------------- /work ------------------

