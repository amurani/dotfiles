" ------------------ Plugin Management: vim-plug ------------------
call plug#begin('~/.vim/plugged')
" Installation and setup instructions here: https://github.com/junegunn/vim-plug

" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }       " a file system explorer
Plug 'ayu-theme/ayu-vim'                                      " favorite color scheme/theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                       " fuzzy find, easy project navigation
Plug 'preservim/nerdcommenter'                                " ¯\_(ツ)_/¯ ... sth sth comment code
Plug 'junegunn/vim-easy-align'                                " alignment plugin
Plug 'webdevel/tabulous'                                      " tab labels
Plug 'Yggdroot/indentLine'                                    " visually show indentation levels for code indented with spaces
Plug 'https://github.com/prettier/vim-prettier'               " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plug 'ntpeters/vim-better-whitespace'                         " causes all trailing whitespace characters to be highlighted
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " make vim act like an IDE
Plug 'pangloss/vim-javascript'                                " javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                               " jsx syntax highlighting
Plug 'leafgarland/typescript-vim'                             " typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript'                            " tsx syntax highlighting
Plug 'itchyny/lightline.vim'                                  " A light and configurable statusline/tabline plugin
Plug 'jiangmiao/auto-pairs'                                   " adds a closing bracket, paren, quote, etc
Plug 'machakann/vim-sandwich'                                 " add/delete/replace surroundings of a sandwiched textobject
Plug 'airblade/vim-gitgutter'                                 " git diff in the gutter
Plug 'honza/vim-snippets'                                     " snippets files for various programming languages
Plug 'mhinz/vim-startify'                                     " default start screen on launch
Plug 'junegunn/goyo.vim'                                      " distraction free mode
Plug 'ryuta69/coc-perl', {'do': 'yarn install && yarn build'} " Perl Language Server
Plug 'jparise/vim-graphql'                                    " GraphQL support
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'],
  \ 'do': 'make install'
\}                                                            " JSDoc block generator
Plug 'tpope/vim-abolish'                                      " plugin for working with variants of a word
Plug 'tomtom/tcomment_vim'                                    " tcomment provides easy to use, file-type sensible comments for Vim
Plug 'mustache/vim-mustache-handlebars'                       " plugin for working with mustache and handlebars templates
Plug 'mityu/vim-applescript'                                  " syntax files for applescript
Plug 'pantharshit00/vim-prisma'                               " file detection and syntax highlighting support for Prisma 2
Plug 'ryanoasis/vim-devicons'                                 " Dev icons for fun stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'                                  " dependecy for the telescope plugin
Plug 'nvim-telescope/telescope.nvim'                          " fuzzy finder with preview
Plug 'git@gitlab.booking.com:devtools/vim-booking.git'        " devtools for working with vim at B.com (only internally accessible)
Plug 'junegunn/goyo.vim'                                      " Distraction-free writing in Vim
Plug  'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " a simple and easy way to use the interface for tree-sitter
Plug 'uiiaoo/java-syntax.vim'                                 " better Java synax highlighting

call plug#end()
" ------------------ /Plugin Management: vim-plug -----------------