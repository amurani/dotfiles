" ------------------ Plugin Management: vim-plug ------------------
call plug#begin('~/.vim/plugged')
" Installation and setup instructions here: https://github.com/junegunn/vim-plug

" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

Plug 'Luxed/ayu-vim'                                           " replacement for 'ayu-theme/ayu-vim' which is unmaintained and broken
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }                 " Catppuccin is a community-driven pastel theme that aims to be the middle ground between low and high contrast themes.

Plug 'honza/vim-snippets'                                      " snippets files for various programming languages
Plug 'https://github.com/prettier/vim-prettier'                " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
                                                               " Plug 'itchyny/lightline.vim'                                 " A light and configurable statusline/tabline plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }            " fzf#install() makes sure that you have the latest binary,
Plug 'junegunn/fzf.vim'                                        " fuzzy find, easy project navigation
Plug 'junegunn/goyo.vim'                                       " distraction free mode
Plug 'junegunn/vim-easy-align'                                 " alignment plugin
Plug 'lewis6991/gitsigns.nvim'                                 " git decorations
Plug 'lukas-reineke/indent-blankline.nvim'                     " This plugin adds indentation guides to all lines (including empty lines) ... no conceal
Plug 'machakann/vim-sandwich'                                  " add/delete/replace surroundings of a sandwiched textobject
Plug 'mhinz/vim-startify'                                      " default start screen on launch
Plug 'ntpeters/vim-better-whitespace'                          " causes all trailing whitespace characters to be highlighted
Plug 'preservim/nerdcommenter'                                 " ¯\_(ツ)_/¯ ... sth sth comment code
Plug 'rose-pine/neovim'                                        " All natural pine, faux fur and a bit of soho vibes for the classy minimalist
Plug 'ryanoasis/vim-devicons'                                  " Dev icons for fun stuff
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }        " a file system explorer
Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }             " center the currently focused buffer to the middle of the screen
Plug 'tomtom/tcomment_vim'                                     " tcomment provides easy to use, file-type sensible comments for Vim
Plug 'tpope/vim-abolish'                                       " plugin for working with variants of a word
                                                               " Plug 'webdevel/tabulous'                                     " tab labels
Plug 'windwp/nvim-autopairs'                                   " A super powerful autopair plugin for Neovim that supports multiple characters.
Plug 'nvim-lualine/lualine.nvim'                               " A blazing fast and easy to configure Neovim statusline written in Lua.
Plug 'akinsho/bufferline.nvim'                                 " A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
Plug 'prichrd/netrw.nvim'                                      " netrw + a layer of ✨bling✨ and configuration to your favorite file explorer.

Plug 'git@gitlab.booking.com:devtools/vim-booking.git'         " devtools for working with vim at B.com (only internally accessible)
Plug 'jparise/vim-graphql'                                     " GraphQL support
Plug 'leafgarland/typescript-vim'                              " typescript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                                " jsx syntax highlighting
Plug 'mityu/vim-applescript'                                   " syntax files for applescript
Plug 'mustache/vim-mustache-handlebars'                        " plugin for working with mustache and handlebars templates
Plug 'pangloss/vim-javascript'                                 " javascript syntax highlighting
Plug 'pantharshit00/vim-prisma'                                " file detection and syntax highlighting support for Prisma 2
Plug 'peitalin/vim-jsx-typescript'                             " tsx syntax highlighting
Plug 'uiiaoo/java-syntax.vim'                                  " better Java synax highlighting
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'],
  \ 'do': 'make install'
\}                                                             " JSDoc block generator
Plug 'jose-elias-alvarez/null-ls.nvim'                         " Use Neovim as a language server to inject LSP diagnostics, code actions, and more (archived?)

Plug  'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}   " a simple and easy way to use the interface for tree-sitter

Plug 'nvim-telescope/telescope.nvim'                           " fuzzy finder with preview
Plug 'smartpde/telescope-recent-files'                         " extension for the Telescope plugin which implements a picker for the recent files.
Plug 'nvim-lua/plenary.nvim'                                   " dependency for the telescope plugin

                                                               " Plug 'neoclide/coc.nvim', {'branch': 'release'}               " make vim act like an IDE
                                                               " Plug 'ryuta69/coc-perl', {'do': 'yarn install && yarn build'} " Perl Language Server
                                                               " Plug 'fannheyward/telescope-coc.nvim'

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
Plug 'williamboman/mason.nvim'                                 " Easily install and manage LSP servers, DAP servers, linters, and formatters
Plug 'williamboman/mason-lspconfig.nvim'                       " making it easier to use mason.nvim and lspconig
Plug 'davidmh/cspell.nvim'                                     " spell checker for code.

Plug 'mfussenegger/nvim-dap'                                   " Debug Adapter Protocol client implementation for Neovim.
                                                               " Plug 'mxsdev/nvim-dap-vscode-js'                               " nvim-dap adapter for vscode-js-debug.
Plug 'mxsdev/nvim-dap-vscode-js', {
            \ 'on': 'jsdebugger',
            \ 'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
            \}                                                 " nvim-dap adapter for vscode-js-debug.

Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'                                    " A UI for nvim-dap
Plug 'theHamsta/nvim-dap-virtual-text'                         " Virtual text support for nvim-dap

Plug 'sourcegraph/sg.nvim', { 'do': 'nvim -l build/init.lua' } " Source graph and co.
Plug 'nvim-lua/plenary.nvim'                                   " Source graph and co.

call plug#end()
" ------------------ /Plugin Management: vim-plug -----------------
