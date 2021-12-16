" Neovim editor specific config

" --------------- Neovim Basic Config ------------------
set cmdheight=2    " Give more space for displaying messages.
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c   " Don't pass messages to |ins-completion-menu|.
set nospell        " turn off spell checking to reduce highlight noise
" --------------- /Neovim Basic Config ------------------

" ------------------ Plugin Management ------------------
source ~/.dotfiles/vim/plug.vim
" ------------------ /Plugin Management ------------------

" --------------- Plugin Config Imports -----------------
source ~/.dotfiles/vim/plugins/coc.rc.vim
" source ~/.dotfiles/vim/plugins/goyo.rc.vim
source ~/.dotfiles/vim/plugins/treesitter.rc.vim
" --------------- /Plugin Config Imports -----------------

