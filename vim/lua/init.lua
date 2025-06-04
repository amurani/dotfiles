-- Plugin Config Imports

-- Improve NVIM UI
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.netrw")

-- IDEfy NVIM
require("plugins.lspconfig")
require("plugins.lspsaga")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.mason")
require("plugins.luasnip")
require("plugins.sonarlint")
require("plugins.conform")

-- General QoL tools for coding
require("plugins.nvim-autopairs")
require("plugins.indent_blankline")

-- Language specific QoL tools
require("plugins.dap")

-- /Plugin Config Imports

-- Plugin No Config Imports
require("gitsigns").setup()
-- require("diagflow").setup({
-- 	border_chars = {
-- 		top_left = "┌",
-- 		top_right = "┐",
-- 		bottom_left = "└",
-- 		bottom_right = "┘",
-- 		horizontal = "─",
-- 		vertical = "│",
-- 	},
-- 	show_borders = true,
-- })
-- /Plugin No Config Imports

-- modern plugin manager for Neovim
-- require('lazy-rc')
-- require('packer-rc')

-- AI coding assistants
-- require('plugins.sourcegraph')

require("codesnap").setup({
	mac_window_bar = false,
	has_breadcrumbs = false,
	bg_color = "#edeff3ff",
	watermark = "",
	code_font_family = "Monaco Nerd Font",
})

-- require("lint").linters_by_ft = {
-- 	kotlin = { "ktlint" },
-- }

require("coverage").setup()
