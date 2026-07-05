-- Editor options, translated from the previous vim/init.vim + vim/neovim-init.vim.
local opt = vim.opt

-- UI
opt.number = true -- show line numbers
opt.relativenumber = true -- relative to the cursor
opt.numberwidth = 3 -- minimum gutter width for line numbers
opt.cursorline = true -- highlight the current line
opt.background = "dark" -- colors tuned for a dark background
opt.termguicolors = true -- 24-bit color (required by modern colorschemes)
opt.signcolumn = "yes" -- always show the sign column so diagnostics don't shift text
opt.wrap = false -- don't wrap long lines
opt.foldenable = false -- start with all folds open
opt.laststatus = 2 -- always show the statusline
opt.cmdheight = 2 -- more room for messages
opt.spell = true -- spell checking on

-- Indentation (per-filetype overrides live in autocmds.lua)
opt.expandtab = true -- spaces, not tabs
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smarttab = true

-- Search
opt.hlsearch = true -- highlight matches

-- Files: rely on git rather than vim's backups/swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Behavior
opt.mouse = "" -- mouse disabled (matches the old `set mouse=a` then `mouse-=a`)
opt.updatetime = 300 -- snappier CursorHold / diagnostics
opt.clipboard:append("unnamedplus") -- use the system clipboard
opt.shortmess:append("c") -- don't show ins-completion-menu messages
