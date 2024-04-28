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
- [Java](https://sdkman.io/)

- [asdf](https://asdf-vm.com/#/) - one tool to rule them all ¯\_(ツ)\_/¯

### Nerd Fonts

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts)
- [Font Downloads](https://www.nerdfonts.com/font-downloads)
- [monaco-nerd-fonts](https://github.com/Karmenzind/monaco-nerd-fonts/tree/master) - good option

#### Mac OS
```bash
➜ brew tap homebrew/cask-fonts
➜ brew install --cask font-<FONT NAME>
```

Font reference: https://github.com/Homebrew/homebrew-cask-fonts

Then use the installed font as you would in any other case

Monaco for Powerline Nerd Font: https://github.com/taohexxx/fonts/blob/master/no_ligatures/Monaco%20for%20Powerline%20Nerd%20Font%20Complete.otf

#### Ubuntu

This was a bit of a pain to figure out, but installing fonts and using them in the terminal was not as straight forward as I would have expected.

You will need to install `gnome-tweaks` which allows you to edit/override (not sure what verbiage to use). 
From there, change the monospace font to the once you want to use and make sure to disable the custom font option from the terminal profile text settings

### Shells

#### zsh

```zshrc
if [ -f $HOME/.dotfiles/zsh/init.zsh ]; then source $HOME/.dotfiles/zsh/init.zsh; fi

```

#### bash

```bashrc
if [ -f $HOME/.dotfiles/bash/init.bash ]; then source $HOME/.dotfiles/bash/init.bash; fi

### iTerm considerations

* Enable mouse scrolling in for a long buffer
```

Preference -> Advanced -> Mouse Tab
Scroll wheel sends arrow keys when in alternate screen mode: Yes

```
* Use ⌥ ← and ⌥→ to jump forwards / backwards words in iTerm 2, on OS X. [Guide](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)
```

Preference -> Profiles -> Keys
⌥ ← : Action: Send Escape Sequence and Esc+: b
⌥ →: Action: Send Escape Sequence and Esc+: f

```
* Tweak the scroll buffer limit
```

Preferences -> Profiles -> Terminal Tab -> Scrollback Buffer (section)
Unlimited scrollback: ✔

```

* Missing powerline icons:  Install a Powerline Nerd Font and select it under
```

Preferences -> Profiles -> Text -> Font

```

```
