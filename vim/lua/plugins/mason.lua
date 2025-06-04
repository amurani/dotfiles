require("mason").setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
})

require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {
		-- language servers
		"bashls",
		"graphql",
		"jdtls",
		"jsonls",
		"kotlin_language_server",
		"lua_ls",
		"perlnavigator",
		"ts_ls",

		-- linters
		"eslint_d",
		"ktlint",
		"sonarlint-language-server",
		"stylua",
		"yamllint",

		-- formatters
		"prettier",

		-- spell checking
		"typos_lsp",
	},
})
