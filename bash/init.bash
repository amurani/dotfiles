export HISTTIMEFORMAT="%d/%m/%y %T "

# fzf
if [ -f ~/.fzf.bash  ]; then source ~/.fzf.bash; fi

# nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
