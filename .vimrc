" --------------- Basic Config ------------------
filetype plugin indent on

set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set encoding=utf-8
set nofoldenable " all folds are open
set hidden
set expandtab
set smarttab
set autoread
set number " line numbers
set numberwidth=3
set wildmenu " command-line completion operates"

set shiftwidth=4
set softtabstop=4
set tabstop=4

set laststatus=2 " Configuration for vim airline (always show)
set hlsearch " highlight search matches"

" Turn backups off as most of the stuuf I work on is in git
set nobackup
set nowb
set noswapfile

syntax enable
syntax on

autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

au BufReadPost *.comp set syntax=mason
au BufReadPost *.html set syntax=mason
au BufReadPost *.json set syntax=json
au BufReadPost *.inc set syntax=tmpl
au BufReadPost *.tmpl set syntax=tmpl
au BufReadPost *.pp set syntax=python
au BufReadPost *.config set syntax=yaml

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
set background=dark
if (has("termguicolors"))
    set termguicolors
endif
let ayucolor="mirage"
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
autocmd BufWritePre *.js Neoformat " have Neoformat run Prettier on save
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
