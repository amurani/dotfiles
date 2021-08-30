" ------------------ Plugin Management: vundle ------------------

" automated installation of vundle if not installed
if empty(glob('~/.vim/bundle/vundle/vundle.vim'))
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle/vundle.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set rtp+=~/.vim/bundle/vundle/vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'                            " let vundle manage vundle
Plugin 'kien/ctrlp.vim'                           " fuzzy find files
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'Yggdroot/indentLine'                      " visually show indentation levels for code indented with spaces
Plugin 'vim-airline/vim-airline'                  " status/tabline
Plugin 'itchyny/lightline.vim'
Plugin 'Raimondi/delimitMate'                     " automatic closing of quotes, parenthesis, brackets, etc
Plugin 'airblade/vim-gitgutter'                   " git diff in the gutter
Plugin 'pangloss/vim-javascript'                  " javascript syntax highlighting
Plugin 'maxmellon/vim-jsx-pretty'                 " jsx syntax highlighting
Plugin 'flazz/vim-colorschemes'                   " colorscheme
Plugin 'webdevel/tabulous'                        " tab labels
Plugin 'https://github.com/prettier/vim-prettier' " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plugin 'terryma/vim-multiple-cursors'             " multiline edit yo!
Plugin 'ntpeters/vim-better-whitespace'           " causes all trailing whitespace characters to be highlighted
Plugin 'andymass/vim-matchup'
Plugin 'sbdchd/neoformat'                         " plugin for formatting code
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
" ------------------ /Plugin Management: vundle -----------------

