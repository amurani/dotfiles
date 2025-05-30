if exists('g:simple_sync_enabled')
  finish
endif

function! s:SimpleSyncLogger(message)
    if g:simple_sync_logging  == 1
        echo a:message
    endif
endfunction

function! s:SimpleSync()
    let configuration = "[]"
    try
        let configuration = readfile(glob(g:simple_sync_config))
    catch
       call s:SimpleSyncLogger("syncing cannot run without a configuration file file name")
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
                call s:SimpleSyncLogger(scp_command_output)
                call s:SimpleSyncLogger("✓ synced ". relative_file_path . " okay")
            endfor
        endif

    endfor
endfunction

autocmd BufWritePre * call s:SimpleSync()

let g:simple_sync_enabled = 1
let g:simple_sync_logging = 0
let g:simple_sync_config = "$HOME/.simple_scp_sync_config.json"

