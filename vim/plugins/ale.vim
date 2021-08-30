" --------------- Plugin Config: dense-analysis/ale -----------------
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'perl': ['perlcritic'],
\   'ruby': ['standardrb', 'rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

" --------------- /Plugin Config: dense-analysis/ale ----------------

