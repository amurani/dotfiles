--[[
Setting up sonarlint via mason or manually proved to be problematic and it's not clear why

The general setup as below is standard, but based on the issue pointed out in the link below,
not all versions of sonarlint work with the plugin equally so I'm going to lock myself to version 4.3.0
which is working fine for me
@link: https://gitlab.com/schrieveslaach/sonarlint.nvim/-/issues/14

--]]

local lspconfig = require("lspconfig")

-- local install_location = vim.fn.expand("$HOME/sonarlint-vscode-darwin-x64-4.3.0/extension/server/sonarlint-ls.jar")
local install_location =
	vim.fn.expand("$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/server/sonarlint-ls.jar")

require("sonarlint").setup({
	server = {
		cmd = {
			"java",
			"-jar",
			install_location,
			-- Ensure that sonarlint-language-server uses stdio channel
			"-stdio",
			"-analyzers",
			install_location,
		},
		settings = {
			sonarlint = {},
		},
		autostart = true,
	},
	filetypes = {
		"typescript",
		"javascript",
	},
})
