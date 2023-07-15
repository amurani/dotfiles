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
Plug 'Luxed/ayu-vim'                                          " replacement for 'ayu-theme/ayu-vim' which is unmaintained and broken
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                       " fuzzy find, easy project navigation
Plug 'preservim/nerdcommenter'                                " ¯\_(ツ)_/¯ ... sth sth comment code
Plug 'junegunn/vim-easy-align'                                " alignment plugin
Plug 'webdevel/tabulous'                                      " tab labels
Plug 'lukas-reineke/indent-blankline.nvim'                    " This plugin adds indentation guides to all lines (including empty lines) ... no conceal
Plug 'https://github.com/prettier/vim-prettier'               " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plug 'ntpeters/vim-better-whitespace'                         " causes all trailing whitespace characters to be highlighted
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " make vim act like an IDE
Plug 'pangloss/vim-javascript'                                " javascript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                               " jsx syntax highlighting
Plug 'leafgarland/typescript-vim'                             " typescript syntax highlighting
Plug 'peitalin/vim-jsx-typescript'                            " tsx syntax highlighting
Plug 'itchyny/lightline.vim'                                  " A light and configurable statusline/tabline plugin
Plug 'machakann/vim-sandwich'                                 " add/delete/replace surroundings of a sandwiched textobject
Plug 'lewis6991/gitsigns.nvim'                                " git decorations
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
Plug 'fannheyward/telescope-coc.nvim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'                                   " vscode-like pictograms
Plug 'hrsh7th/cmp-buffer'                                     " nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-nvim-lsp'                                   " nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp'                                       " Completion
Plug 'nvimdev/lspsaga.nvim'                                   " improve lsp experences

Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }            " center the currently focused buffer to the middle of the screen
Plug 'windwp/nvim-autopairs'                                  " A super powerful autopair plugin for Neovim that supports multiple characters.
Plug 'smartpde/telescope-recent-files'                        " extension for the Telescope plugin which implements a picker for the recent files.
Plug 'rose-pine/neovim'                                       " All natural pine, faux fur and a bit of soho vibes for the classy minimalist

Plug 'mfussenegger/nvim-dap'                                  " Debug Adapter Protocol client implementation for Neovim.
Plug 'mxsdev/nvim-dap-vscode-js'                              " nvim-dap adapter for vscode-js-debug.
Plug 'rcarriga/nvim-dap-ui'                                   " A UI for nvim-dap

call plug#end()
" ------------------ /Plugin Management: vim-plug -----------------
