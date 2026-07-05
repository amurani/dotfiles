-- Neovim entry point (modern Lua config).
--
-- This is Neovim-only. Classic Vim is configured separately via ~/.vimrc and is
-- intentionally left untouched. Plugins are managed by lazy.nvim and pinned via a
-- committed lazy-lock.json so this config stays reproducible across machines.

-- Leader must be set before lazy.nvim loads. Kept as the historical default `\`
-- to preserve existing muscle memory (and to avoid clashing with the many
-- `<space>`-prefixed LSP mappings).
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
