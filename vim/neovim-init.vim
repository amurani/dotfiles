" Neovim editor specific config

" --------------- Neovim Basic Config ------------------
set cmdheight=2            " Give more space for displaying messages.
set updatetime=300         " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
set clipboard+=unnamedplus " use the system clipboard instead of interacting with the "+" and/or "*" registers explicitly): >vim


" --------------- /Neovim Basic Config ------------------

" ------------------ Plugin Management ------------------
source ~/.dotfiles/vim/plug.vim
" ------------------ /Plugin Management ------------------

" --------------- Plugin Config Imports -----------------
" source ~/.dotfiles/vim/plugins/coc.rc.vim
" --------------- /Plugin Config Imports -----------------

" --------------- File type specific syntax settings -----------------
autocmd BufReadPost *.hbs      set syntax=handlebars " setting this here so we can use treesitter
autocmd BufReadPost *.mustache set syntax=handlebars " setting this here so we can use treesitter

" --------------- /File type specific syntax settings -----------------


lua <<EOF
    -- vim settings
    vim.cmd.colorschem("catppuccin-macchiato")

    -- since I am using a custom plugin path, I need to add this the rtp
    -- so the plugin config can be imported
    vim.opt.runtimepath:append(',~/.dotfiles/vim')

    -- lets get into it then
    require('init')
EOF
