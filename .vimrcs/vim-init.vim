" vim editor specific config
" import to ~/.vimrc to use

" NB: if on a macbook, please install vim via brew instead of the Apple
" verion. That one's shit

" ------------------ Plugin Management ------------------
try
    set rtp+=~/.vim/bundle/vundle/vundle.vim
catch
    echo "We need vundle to be install manuall cause chicken and egg 🐣 ¯\_(ツ)_/¯"
    echo "Go to: https://github.com/VundleVim/Vundle.vim to get started"
endtry

call vundle#begin()

Plugin 'gmarik/vundle'  " let vundle manage vundle
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'Yggdroot/indentLine' " visually show indentation levels for code indented with spaces
Plugin 'vim-airline/vim-airline' " status/tabline
Plugin 'itchyny/lightline.vim'
Plugin 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc
Plugin 'airblade/vim-gitgutter' " git diff in the gutter
Plugin 'pangloss/vim-javascript' " javascript syntax highlighting
Plugin 'maxmellon/vim-jsx-pretty' " jsx syntax highlighting
Plugin 'flazz/vim-colorschemes' " colorscheme
Plugin 'webdevel/tabulous' " tab labels
Plugin 'https://github.com/prettier/vim-prettier' "A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plugin 'terryma/vim-multiple-cursors' "multiline edit yo!
Plugin 'ntpeters/vim-better-whitespace' " causes all trailing whitespace characters to be highlighted
Plugin 'andymass/vim-matchup'
Plugin 'sbdchd/neoformat' " plugin for formatting code
Plugin 'dense-analysis/ale'
Plugin 'https://github.com/tpope/vim-eunuch.git'
Plugin 'ayu-theme/ayu-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'powerline/powerline-fonts'
Plugin 'zivyangll/git-blame.vim'
Plugin 'tarekbecker/vim-yaml-formatter'
Plugin 'udalov/kotlin-vim'
Plugin 'https://github.com/Shadowsith/kotlincomplete.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'sudar/vim-arduino-syntax'
Plugin 'sudar/vim-arduino-snippets'

call vundle#end()
" ------------------ /Plugin Management -----------------

" --------------- Plugin Config: dense-analysis/ale -----------------
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'perl': ['perlcritic'],
\   'ruby': ['standardrb', 'rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

" --------------- /Plugin Config: dense-analysis/ale ----------------

" --------------- Plugin Config: pangloss/vim-javascript -----------------
let g:javascript_plugin_flow = 1
" --------------- /Plugin Config: pangloss/vim-javascript -----------------
