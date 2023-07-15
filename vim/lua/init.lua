-- Plugin Config Imports
require('plugins.lspconfig')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.nvim-autopairs')
require('plugins.mason')
require('plugins.dap-vscode-js')
require('plugins.lspsaga')
require('plugins.indent_blankline')
-- /Plugin Config Imports

-- Plugin No Config Imports
require('gitsigns').setup()
-- /Plugin No Config Imports

-- modern plugin manager for Neovim
-- require('lazy-rc')
-- require('packer-rc')
