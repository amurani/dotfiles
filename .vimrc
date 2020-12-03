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
set spell spelllang=en_us      " enables spell checking

" *************** File type specific tab settings *****************
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml       setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType ruby       setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby      setlocal expandtab shiftwidth=2 tabstop=2
" *************** /File type specific tab settings *****************

" *************** File type specific syntax settings *****************
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

" *************** /File type specific syntax settings *****************

" --------------- /Basic Config -----------------

" --------------- Editor Specific Config -----------------
if has('nvim')
	source ~/.vimrcs/neovim-init.vim
else
	source ~/.vimrcs/vim-init.vim
endif
set rtp+=~/.vim_runtime/
" --------------- /Editor Specific Config -----------------

" --------------- Plugin Config: ayu-theme/ayu-vim -----------------
if (has("termguicolors"))
    set termguicolors
endif
let ayucolor="dark"
colorscheme ayu
" --------------- /Plugin Config: ayu-theme/ayu-vim ----------------

" --------------- Plugin Config: Yggdroot/indentLine -----------------
let g:indentLine_char = '.'
let g:indentLine_color_tty_dark = 1
" --------------- /Plugin Config: Yggdroot/indentLine -----------------

" --------------- Plugin Config: NERDTree -----------------
let NERDTreeShowHidden=1
" --------------- /Plugin Config: NERDTree----------------

" --------------- Plugin Config: sbdchd/neoformat -----------------
" have Neoformat run Prettier on save
" autocmd BufWritePre *.js,*.ts          Neoformat " javascript, typescript
" autocmd BufWritePre *.pl,*.pm,*.t,*.PL Neoformat " perl
" --------------- /Plugin Config: sbdchd/neoformat -----------------

" --------------- Plugin Config: webdevel/tabulous -----------------
let loadTabulous = 1
" --------------- /Plugin Config: webdevel/tabulous ----------------

" --------------- Custom Plugin Config: sync on save script -----------------
" autocmd BufWritePost * ! perl -w ~/simple_sync.pl --dir_name %:p:h --file_name %:t
" --------------- /Custom Plugin Config: sync on save script -----------------


" --------------- Custom Plugin Config: pertidy -----------------
try
    source ~/.vim_runtime/vimrcs/perltidyrc.vim
    nnoremap <silent> tt :%!perltidy -q<Enter>
    vnoremap <silent> tt :!perltidy -q<Enter>
catch
endtry
" --------------- /Custom Plugin Config: pertidy -----------------
