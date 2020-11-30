" Neovim editor specific config
" import to ~/.vimrc to use

" --------------- Neovim Basic Config ------------------
set cmdheight=2    " Give more space for displaying messages.
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c   " Don't pass messages to |ins-completion-menu|.

"--------------- /Neovim Basic Config ------------------

" ------------------ Plugin Management ------------------
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

call plug#end()
" ------------------ /Plugin Management -----------------

" --------------- Plugin Config: coc -----------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc extensions
let g:coc_global_extensions = [
    \ 'coc-graphql',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ 'coc-perl',
    \ 'coc-prettier',
    \ 'coc-rome',
    \ 'coc-snippets',
    \ 'coc-tabnine',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vimlsp'
    \]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" --------------- /Plugin Config: coc ----------------
 
