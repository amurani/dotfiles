" ------------------ Plugin Management: vim-plug ------------------
call plug#begin('~/.vim/plugged')
" Installation and setup instructions here: https://github.com/junegunn/vim-plug

" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

Plug 'rose-pine/neovim'                                        " All natural pine, faux fur and a bit of soho vibes for the classy minimalist
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }                 " Catppuccin is a community-driven pastel theme that aims to be the middle ground between low and high contrast themes.

Plug 'honza/vim-snippets'                                      " snippets files for various programming languages
Plug 'junegunn/vim-easy-align'                                 " alignment plugin
Plug 'lewis6991/gitsigns.nvim'                                 " git decorations
Plug 'lukas-reineke/indent-blankline.nvim'                     " This plugin adds indentation guides to all lines (including empty lines) ... no conceal
Plug 'machakann/vim-sandwich'                                  " add/delete/replace surroundings of a sandwiched textobject
Plug 'mhinz/vim-startify'                                      " default start screen on launch
Plug 'ntpeters/vim-better-whitespace'                          " causes all trailing whitespace characters to be highlighted
Plug 'ryanoasis/vim-devicons'                                  " Dev icons for fun stuff
Plug 'tomtom/tcomment_vim'                                     " tcomment provides easy to use, file-type sensible comments for Vim
Plug 'tpope/vim-abolish'                                       " plugin for working with variants of a word
Plug 'windwp/nvim-autopairs'                                   " A super powerful autopair plugin for Neovim that supports multiple characters.
Plug 'nvim-lualine/lualine.nvim'                               " A blazing fast and easy to configure Neovim statusline written in Lua.
Plug 'akinsho/bufferline.nvim'                                 " A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
Plug 'prichrd/netrw.nvim'                                      " netrw + a layer of ✨bling✨ and configuration to your favorite file explorer.

Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'],
  \ 'do': 'make install'
\}                                                             " JSDoc block generator

Plug  'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " a simple and easy way to use the interface for tree-sitter

Plug 'nvim-telescope/telescope.nvim'                           " fuzzy finder with preview
Plug 'smartpde/telescope-recent-files'                         " extension for the Telescope plugin which implements a picker for the recent files.
Plug 'nvim-lua/plenary.nvim'                                   " dependency for the telescope plugin, sourecgraph and nvim-coverage needs this for some reason - 'This plugin depends on plenary and optionally on the lua-xmlreader luarock to parse the cobertura format.
Plug 'stevearc/conform.nvim'                                   " Lightweight yet powerful formatter plugin for Neovim


Plug 'williamboman/mason.nvim'                                 " Easily install and manage LSP servers, DAP servers, linters, and formatters
Plug 'williamboman/mason-lspconfig.nvim'                       " making it easier to use mason.nvim and lspconig
Plug 'neovim/nvim-lspconfig'                                   " configs for the nvim lsp client
Plug 'nvimdev/lspsaga.nvim'                                    " improve lsp experience

Plug 'hrsh7th/cmp-buffer'                                      " nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-nvim-lsp'                                    " nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp'                                        " A completion engine plugin for neovim
Plug 'L3MON4D3/LuaSnip', {
    \ 'tag': 'v2.*',
    \ 'do': 'make install_jsregexp'
\}                                                             " lua snippets engine for lsp completion
Plug 'saadparwaiz1/cmp_luasnip'                                " luasnip completion source for nvim-cmp
Plug 'rafamadriz/friendly-snippets'                            " Snippets collection for a set of different programming languages.
Plug 'dgagn/diagflow.nvim'                                     " Provides a neat and distraction-free way to display LSP diagnostics

Plug 'mfussenegger/nvim-dap'                                   " Debug Adapter Protocol client implementation for Neovim.
Plug 'mxsdev/nvim-dap-vscode-js', {
            \ 'on': 'jsdebugger',
            \ 'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
            \}                                                 " nvim-dap adapter for vscode-js-debug.
Plug 'nvim-neotest/nvim-nio'                                   " A library for asynchronous IO in Neovim - nvim-dap-ui depends
Plug 'rcarriga/nvim-dap-ui'                                    " A UI for nvim-dap
Plug 'theHamsta/nvim-dap-virtual-text'                         " Virtual text support for nvim-dap
Plug 'andythigpen/nvim-coverage'                               " Displays coverage information in the sign column.
Plug 'sourcegraph/sg.nvim', { 'do': 'nvim -l build/init.lua' } " Source graph and co.

Plug 'mistricky/codesnap.nvim', { 'do': 'make' }               " make pretty code snapshots
Plug 'https://gitlab.com/schrieveslaach/sonarlint.nvim'        " Sonarlint  lsp plugin
Plug 'mfussenegger/nvim-lint'                                  " An asynchronous linter plugin for Neovim (>= 0.9.5) complementary to the built-in Language Server Protocol support.

Plug 'git@gitlab.booking.com:devtools/vim-booking.git'         " devtools for working with vim at B.com (only internally accessible)

call plug#end()
" ------------------ /Plugin Management: vim-plug -----------------
