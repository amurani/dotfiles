# shell/common.sh — shared interactive config for bash + zsh.
# Aliases + version-manager activation. Environment/PATH lives in shell/env.sh;
# shell-specific bits (completions, prompt, plugins) live in zsh/init.zsh and
# bash/init.bash.

# Aliases
[ -f "$HOME/.dotfiles/shell/aliases.sh" ] && . "$HOME/.dotfiles/shell/aliases.sh"

# Perl (perlbrew)
[ -f "$HOME/perl5/perlbrew/etc/bashrc" ] && . "$HOME/perl5/perlbrew/etc/bashrc"

# pyenv
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# SDKMAN (needed to use `sdk`; must be near the end of the shell init).
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && . "$SDKMAN_DIR/bin/sdkman-init.sh"

# Machine-specific interactive extras (cowsay jokes, work-only bits, etc.).
[ -f "$HOME/.misc.machine.sh" ] && . "$HOME/.misc.machine.sh"
