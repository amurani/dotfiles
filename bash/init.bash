# bash/init.bash — bash-specific interactive config.

export HISTTIMEFORMAT="%d/%m/%y %T "

# fzf (bash)
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# Lazy nvm for bash (zsh handles this via the zsh-nvm plugin). Defines stub
# functions that load nvm on first use, so startup stays fast.
if [ -s "$NVM_DIR/nvm.sh" ]; then
    _load_nvm() {
        unset -f nvm node npm npx _load_nvm 2>/dev/null
        . "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    }
    nvm() { _load_nvm; nvm "$@"; }
    node() { _load_nvm; node "$@"; }
    npm() { _load_nvm; npm "$@"; }
    npx() { _load_nvm; npx "$@"; }
fi
