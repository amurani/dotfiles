--[[
Setting up sonarlint via mason or manually proved to be problematic and it's not clear why

The general setup as below is standard, but based on the issue pointed out in the link below,
not all versions of sonarlint work with the plugin equally so I'm going to lock myself to version 4.3.0
which is working fine for me
@link: https://gitlab.com/schrieveslaach/sonarlint.nvim/-/issues/14

--]]

local lspconfig = require("lspconfig")

require("sonarlint").setup({
	server = {
		cmd = {
			"java",
			"-jar",
			vim.fn.expand("$HOME/sonarlint-vscode-darwin-x64-4.3.0/extension/server/sonarlint-ls.jar"),
			-- Ensure that sonarlint-language-server uses stdio channel
			"-stdio",
			"-analyzers",
			vim.fn.expand("$HOME/sonarlint-vscode-darwin-x64-4.3.0/extension/analyzers/sonarjs.jar"),
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
