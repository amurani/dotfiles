-- Plugin Config Imports

-- Improve NVIM UI
require('plugins.lualine')
require('plugins.bufferline')

-- IDEfy NVIM
require('plugins.lspconfig')
require('plugins.lspsaga')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.mason')

-- General QoL tools for coding
require('plugins.nvim-autopairs')
require('plugins.indent_blankline')

-- Language specific QoL tools
require('plugins.dap-vscode-js')
require('plugins.null-ls')

-- /Plugin Config Imports

-- Plugin No Config Imports
require('gitsigns').setup()
-- /Plugin No Config Imports

-- modern plugin manager for Neovim
-- require('lazy-rc')
-- require('packer-rc')
