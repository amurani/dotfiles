## dotfiles

### Useage

- Clone repo to `$HOME` i.e. `~/.dotfiles`
- Run `~/.dotfiles/setup/sh && source ~/.zshrc`
- Go do your thing ...

### Other useful tools to make life easier

#### (like X ... but better)

- [BAT](https://github.com/sharkdp/bat) - like `cat` but ...
- [HTTPie](https://httpie.io/) - like `curl` but ...
- [ack](https://beyondgrep.com/) - like `grep` but ...
- [exa](https://the.exa.website/) - like `ls` but ...
- [fd](https://github.com/sharkdp/fd) - like `find` but ...

#### others

- [mdless](https://github.com/ttscoff/mdless) - markdown files preview in terminal
- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) - code searching tool simalr to `ack`
- [fzf](https://github.com/junegunn/fzf) - command line fuzzy finder
- [peco](nvim-lua/plenary.nvim) - nteractive filtering tool

### Versions Managers

- [Perl](https://perlbrew.pl/)
- [Node JS](https://github.com/nvm-sh/nvm)
- [Ruby](https://rvm.io/)
- [Python](https://github.com/pyenv/pyenv)
- [Java](https://github.com/jenv/jenv)

- [asdf](https://asdf-vm.com/#/) - one tool to rule them all ¯\_(ツ)\_/¯

### Nerd Fonts

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts)
- [Font Downloads](https://www.nerdfonts.com/font-downloads)

```bash
➜ brew tap homebrew/cask-fonts
➜ brew install --cask font-<FONT NAME>
```

Font reference: https://github.com/Homebrew/homebrew-cask-fonts

Then use the installed font as you would in any other case

Monaco for Powerline Nerd Font: https://github.com/taohexxx/fonts/blob/master/no_ligatures/Monaco%20for%20Powerline%20Nerd%20Font%20Complete.otf

### Shells

#### zsh

```zshrc
if [ -f $HOME/.dotfiles/zsh/init.zsh ]; then source $HOME/.dotfiles/zsh/init.zsh; fi

```

#### bash

```bashrc
if [ -f $HOME/.dotfiles/bash/init.bash ]; then source $HOME/.dotfiles/bash/init.bash; fi

```
