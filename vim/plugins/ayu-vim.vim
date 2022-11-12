" --------------- Plugin Config: ayu-theme/ayu-vim -----------------
if (has("termguicolors"))
    set termguicolors
endif

try
    let g:ayucolor="mirage"
catch
    echo "ayu color theme not set"
endtry

colorscheme ayu
" --------------- /Plugin Config: ayu-theme/ayu-vim ----------------
