" --------------- Custom Plugin Config: perltidy -----------------
try
    source ~/.vim_runtime/vimrcs/perltidyrc.vim
    nnoremap <silent> tt :%!perltidy -q<Enter>
    vnoremap <silent> tt :!perltidy -q<Enter>
catch
    echo "Failed to load perltidy plugin"
endtry
" --------------- /Custom Plugin Config: perltidy -----------------

