require("mason").setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
})

require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = {
		-- language servers
		"bashls",
		"graphql",
		"jsonls",
		"kotlin_language_server",
		"jdtls",
		"lua_ls",
		"perlnavigator",
		"ts_ls",
		-- "bash-language-server",
		-- "graphql-language-service-cli",
		-- "java-language-server",
		-- "java_language_server",
		-- "json-lsp",
		-- "kotlin-language-server",
		-- "lua-language-server",
		-- "perlnavigator",
		-- "sonarlint-language-server",
		-- "typescript-language-server",

		-- linters
		-- "eslint_d",

		-- formatters
		-- "prettier",

		-- spell checking support
		-- "codespell",
		-- "misspell",
		-- "cspell",
	},
})
