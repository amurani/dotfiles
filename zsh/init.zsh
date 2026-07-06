# zsh/init.zsh — interactive zsh: plugins, prompt, completions.

# Docker CLI completions — add to fpath BEFORE oh-my-zsh runs compinit so they
# are picked up by the single compinit invocation.
[ -d "$HOME/.docker/completions" ] && fpath=("$HOME/.docker/completions" $fpath)

# oh-my-zsh. nvm is lazy-loaded by zsh-nvm (NVM_LAZY_LOAD) so it costs nothing at
# startup — it loads on the first `nvm`/`node`/`npm` call. oh-my-zsh runs compinit
# once; do not call compinit elsewhere.
export NVM_LAZY_LOAD=true
plugins=(git zsh-nvm zsh-autosuggestions)
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# Prompt
eval "$(starship init zsh)"

# Smart cd
eval "$(zoxide init zsh)"

# fzf shell integration (keybindings + completion). fzf 0.48+ uses `fzf --zsh`;
# fall back to a legacy ~/.fzf.zsh if present.
if command -v fzf >/dev/null 2>&1; then
    _fzf_init="$(fzf --zsh 2>/dev/null)"
    if [ -n "$_fzf_init" ]; then
        eval "$_fzf_init"
    elif [ -f "$HOME/.fzf.zsh" ]; then
        source "$HOME/.fzf.zsh"
    fi
    unset _fzf_init
fi

# Syntax highlighting (catppuccin theme). Keep this near the end.
[ -f "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" ] &&
    source "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# Tool completions (zsh-specific)
command -v kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
command -v bk >/dev/null 2>&1 && source <(bk completion zsh)

# Google Cloud SDK
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
