" Neovim editor specific config
" import to ~/.vimrc to use

" ------------------ Plugin Management ------------------
call plug#begin('~/.vim/plugged')
" Installation and setup instructions here: https://github.com/junegunn/vim-plug

" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " a file system explorer
Plug 'ayu-theme/ayu-vim'                                " favorite color scheme/theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                 " fuzzy find, easy project navigation
Plug 'preservim/nerdcommenter'                          " ¯\_(ツ)_/¯ ... sth sth comment code
Plug 'junegunn/vim-easy-align'                          " alignment plugin
Plug 'webdevel/tabulous'                                " tab labels
Plug 'Yggdroot/indentLine'                              " visually show indentation levels for code indented with spaces
Plug 'https://github.com/prettier/vim-prettier'         " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plug 'ntpeters/vim-better-whitespace'                   " causes all trailing whitespace characters to be highlighted
Plug 'sbdchd/neoformat'                                 " plugin for formatting code
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " make vim act like an IDE
Plug 'pangloss/vim-javascript'                          " javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                         " jsx syntax highlighting
Plug 'leafgarland/typescript-vim'                       " typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript'                      " tsx syntax highlighting
Plug 'itchyny/lightline.vim'                            " A light and configurable statusline/tabline plugin
Plug 'jiangmiao/auto-pairs'                             " adds a closing bracket, paren, quote, etc
Plug 'machakann/vim-sandwich'                           " add/delete/replace surroundings of a sandwiched textobject
Plug 'airblade/vim-gitgutter'                           " git diff in the gutter
Plug 'honza/vim-snippets'                               " snippets files for various programming languages
Plug 'mhinz/vim-startify'                               " default start screen on launch
call plug#end()
" ------------------ /Plugin Management -----------------

