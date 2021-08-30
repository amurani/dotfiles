" --------------- Custom Plugin Config: sync on save script -----------------
" autocmd BufWritePost * ! perl -w ~/simple_sync.pl --dir_name %:p:h --file_name %:t
" --------------- /Custom Plugin Config: sync on save script -----------------

" --------------- Custom Plugin Config: simple-sync -----------------
try
    source ~/.vim_runtime/vimrcs/simple-sync.vim
    let g:simple_sync_enabled = 0
catch
    echo "Failed to load simple-sync plugin"
endtry
" --------------- /Custom Plugin Config: simple-sync -----------------

