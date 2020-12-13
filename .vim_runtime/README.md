## simple-sync

Vimscript version of [simple scp sync](https://github.com/amurani/simple_scp_sync) perl implementation

### Usage

```vimscript
" usage in vimrc config
source ~/.vim_runtime/vimrcs/simple-sync.vim

```

### Options

- `let g:simple_sync_enabled` - turn syncing on or off (`1|0`)
- `let g:simple_sync_logging` - view script logs in messages (`1|0`)
- `let g:simple_sync_config` - path to configuration file. Defaults to `$HOME/.simple_scp_sync_config.json`

### Configuration file

This is a json file with an array of objects defining each sync operations

```json
[
  // ...,

  {
    "hosts": ["kevinmurani.com"],
    "username": "kmurani", // optional, we can default to the user running the command if not needed
    "source_root_path": "/local/path/to/project/root/",
    "target_root_path": "/remote/path/to/project/root/",
    "scp_otions": "-P 22" // depends on you. If you do any extra scp options, this would be where to add them
  }

  // ...
]
```
