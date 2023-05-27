" --------------- Basic Config ------------------
filetype plugin indent on      " enable file type detection with loading of file type specific plugin and indentation
syntax enable                  " enable syntax highlighting

set backspace=eol,start,indent " Configure backspace so it acts as it should act
set encoding=utf-8             " sets the character encoding to be used"
set nofoldenable               " all folds are open
set nowrap                     " prevent lines from being wrapped
set hidden                     " set to enable multiple buffers
set autoread                   " set to detect file changes from outside of vim
set number                     " show line numbers
set numberwidth=3              " set minimum columns used for line numbers
set wildmenu                   " command-line completion operates"
set expandtab                  " set to use spaces over tabs
set shiftwidth=4               " set indentation levels
set softtabstop=4              " set whitespace to be added/remove by tab and backspace
set tabstop=4                  " set column width for tab character
set smarttab                   " set to rely on above ab settings when Tab is hit
set laststatus=2               " Configuration for vim airline (always show)
set hlsearch                   " highlight search matches"
set background=dark            " tells vim to use colors that look good on a dark background
set nobackup                   " Turn backups off (in favor of version control e.g. git)
set nowritebackup              " turns off back based version control (in favor of version control e.g. git)
set noswapfile                 " Turn swap files off (in favor of version control e.g. git)
set cursorline                 " set to highlight current line with cursor
set spell                      " enables spell checking
set colorcolumn=120            " adds column indicator at the 120 column mark
set mouse=a                    " ¯\_(ツ)_/¯ for some reason, I need this, to undo it again in the next line
set mouse-=a                   " Disable vim automatic visual mode on mouse select: https://gist.github.com/u0d7i/01f78999feff1e2a8361

" --------------- /Basic Config ------------------

" --------------- File type specific tab settings *****************
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml       setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType ruby       setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby      setlocal expandtab shiftwidth=2 tabstop=2
" --------------- /File type specific tab settings -----------------

" --------------- File type specific syntax settings -----------------
autocmd BufReadPost *.comp     set syntax=mason
autocmd BufReadPost *.html     set syntax=mason
autocmd BufReadPost *.json     set syntax=json
autocmd BufReadPost *.inc      set syntax=tmpl
autocmd BufReadPost *.tmpl     set syntax=tmpl
autocmd BufReadPost *.pp       set syntax=python
autocmd BufReadPost *.config   set syntax=yaml
autocmd BufReadPost *cpanfile  set syntax=perl
autocmd BufReadPost .env*      set syntax=sh
autocmd BufReadPost *.hbs      set syntax=mustache
autocmd BufReadPost *.mustache set syntax=mustache
autocmd BufReadPost *.hql      set syntax=sql

" --------------- /File type specific syntax settings -----------------

" --------------- Editor Specific Config -----------------
if has('nvim')
	source ~/.dotfiles/vim/neovim-init.vim
else
	source ~/.dotfiles/vim/vim-init.vim
endif
set rtp+=~/.vim_runtime/
" --------------- /Editor Specific Config -----------------

" --------------- Plugin Config Imports -----------------
source ~/.dotfiles/vim/plugins/ayu-vim.vim
" source ~/.dotfiles/vim/plugins/indent-line.vim
source ~/.dotfiles/vim/plugins/indent-blankline.vim
source ~/.dotfiles/vim/plugins/nerdtree.vim
" source ~/.dotfiles/vim/plugins/neoformat.vim
source ~/.dotfiles/vim/plugins/tabulous.vim
" source ~/.dotfiles/vim/plugins/perltidy.vim
source ~/.dotfiles/vim/plugins/simple-sync.vim

" --------------- /Plugin Config Imports ----------------
