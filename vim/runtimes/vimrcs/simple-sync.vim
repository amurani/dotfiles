if exists('g:simple_sync_enabled')
  finish
endif

function! s:SimpleSyncLog(message, level)
    if g:simple_sync_logging == 0 && a:level ==# 'info'
        return
    endif
    redraw
    if a:level ==# 'error'
        echohl ErrorMsg
    elseif a:level ==# 'ok'
        echohl DiffAdd
    else
        echohl None
    endif
    echom a:message
    echohl None
endfunction

function! s:SimpleSync()
    let configuration = "[]"
    try
        let configuration = readfile(glob(g:simple_sync_config))
    catch
        " call s:SimpleSyncLog("simple-sync: cannot read config: " . g:simple_sync_config, 'error')
        return
    endtry

    let dict = json_decode(configuration)
    for config in dict
        let source_root_path = config['source_root_path']
        let file_dir = expand("%:p:h")
        let match = matchstr(file_dir, source_root_path)
        if !empty(match)
            let scp_options = has_key(config, 'scp_options') ? config['scp_options'] : ""
            let absolute_file_path = expand("%:p")
            let username = config['username']
            let hosts = config['hosts']
            let target_root_path = config['target_root_path']
            let relative_file_path = substitute(absolute_file_path, source_root_path, "", "")

            for host in hosts
                let scp_command = printf(
                            \ "scp %s %s %s@%s:%s%s",
                            \ scp_options,
                            \ absolute_file_path,
                            \ username,
                            \ host,
                            \ target_root_path,
                            \ relative_file_path
                            \)
                let scp_command_output = system(scp_command)
                if v:shell_error != 0
                    call s:SimpleSyncLog("simple-sync: FAILED " . relative_file_path . " → " . host . ": " . trim(scp_command_output), 'error')
                else
                    call s:SimpleSyncLog("simple-sync: ✓ " . relative_file_path . " → " . host, 'ok')
                endif
            endfor
        endif

    endfor
endfunction

autocmd BufWritePost * call s:SimpleSync()

let g:simple_sync_enabled = 1
let g:simple_sync_logging = 0
let g:simple_sync_config = "$HOME/.simple_scp_sync_config.json"

