" NB: if on a macbook, please install vim via brew instead of the Apple
" verion. That one's shit
set backspace=indent,eol,start
set nocompatible " be iMproved, required
filetype off " required

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set rtp+=~/.vim_runtime/
try
    " pertidy
    source ~/.vim_runtime/vimrcs/perltidyrc.vim
    nnoremap <silent> tt :%!perltidy -q<Enter>
    vnoremap <silent> tt :!perltidy -q<Enter>

catch
endtry

" plugin Vundle: START
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
Plugin 'sbdchd/neoformat'
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
" plugin Vundle: END

" config: START
set encoding=utf-8

filetype plugin indent on

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
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

syntax enable
syntax on

set laststatus=2 " Configuration for vim airline (always show)

set hlsearch " highlight search matches"

" Turn backup off, stuff is in git and I don't care much for swap files
set nobackup
set nowb
set noswapfile

au BufReadPost *.comp set syntax=mason
au BufReadPost *.html set syntax=mason
au BufReadPost *.json set syntax=json
au BufReadPost *.inc set syntax=tmpl
au BufReadPost *.tmpl set syntax=tmpl
au BufReadPost *.pp set syntax=python
au BufReadPost *.config set syntax=yaml

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let JSHintUpdateWriteOnly=1
let g:JSHintHighlightErrorLine = 1
" let g:syntastic_tmpl_checkers = ['javascript', 'eslint']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'eslint'
" let g:syntastic_pl_checkers = ['perlcritic']
" let g:syntastic_pm_checkers = ['perlcritic']
" let g:syntastic_check_on_open = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'perl': ['perlcritic'],
\   'ruby': ['standardrb', 'rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

let g:indentLine_char = '.'
let g:indentLine_color_tty_dark = 1

let NERDTreeShowHidden=1

let g:loaded_matchit = 1

set background=dark
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" my sync on save script
" autocmd BufWritePost * ! perl -w ~/simple_sync.pl --dir_name %:p:h --file_name %:t

" have Neoformat run Prettier on save
autocmd BufWritePre *.js Neoformat

let loadTabulous = 1

