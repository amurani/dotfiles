# zsh/init.zsh — interactive zsh: plugins, prompt, completions.

# Docker CLI completions — add to fpath BEFORE oh-my-zsh runs compinit so they
# are picked up by the single compinit invocation.
[ -d "$HOME/.docker/completions" ] && fpath=("$HOME/.docker/completions" $fpath)

# oh-my-zsh. Runs the single compinit; do not call compinit elsewhere.
plugins=(git zsh-autosuggestions)
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# --- Lazy nvm ----------------------------------------------------------------
# Load nvm only on first use. We stub the node-ecosystem entry points; the first
# call loads nvm fully (which puts every global binary back on PATH). This
# replaces the zsh-nvm plugin, whose global-binary enumeration cost ~300ms at
# startup on machines with many global packages.
#
# If you routinely invoke a global tool *before* node/npm in a fresh shell (e.g.
# `cody`, `pn`), add it as a trigger: export NVM_LAZY_EXTRA_CMDS="cody pn"
# (put that in ~/.env.machine.sh so it stays machine-specific).
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    _load_nvm() {
        unfunction nvm node npm npx corepack _load_nvm ${=NVM_LAZY_EXTRA_CMDS} 2>/dev/null
        source "$NVM_DIR/nvm.sh"
        [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    }
    for _cmd in nvm node npm npx corepack ${=NVM_LAZY_EXTRA_CMDS}; do
        eval "${_cmd}() { _load_nvm; ${_cmd} \"\$@\"; }"
    done
    unset _cmd
fi

# --- Cached completions ------------------------------------------------------
# Cache a slow `<tool> completion zsh` to disk and source that, regenerating only
# when the tool's binary is newer than the cache. Avoids re-running slow
# generators (e.g. bk, kubectl) on every shell startup.
# Usage: _cache_completion <cache-name> <bin> <generator command...>
_cache_completion() {
    emulate -L zsh
    local name=$1 bin=$2 binpath
    local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions/${name}.zsh"
    binpath=$(command -v "$bin" 2>/dev/null) || return 0
    if [[ ! -s $cache || $binpath -nt $cache ]]; then
        mkdir -p "${cache:h}"
        shift 2
        "$@" > "$cache" 2>/dev/null
    fi
    source "$cache"
}

# kubectl completion (cached). bk is work-only — cache it from ~/.misc.machine.sh.
command -v kubectl >/dev/null 2>&1 && _cache_completion kubectl kubectl kubectl completion zsh

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

# Google Cloud SDK
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
