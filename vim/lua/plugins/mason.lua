require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})

require('mason-lspconfig').setup({
    settings = {
      perlnavigator = {
          perlPath = 'perl',
          enableWarnings = true,
          perltidyProfile = '',
          perlcriticProfile = '',
          perlcriticEnabled = true,
      }
    },
    ensure_installed = {
        -- language servers
        "bash-language-server",
        "graphql-language-service-cli",
        "java-language-server",
        "kotlin-language-server",
        "lua-language-server",
        "json-lsp",
        "perlnavigator",
        "typescript-language-server",

        -- linters
        "eslint_d",

        -- formatters
        "prettier",

        -- spell checking support
        "codespell",
        "misspell",
        "cspell",

    },
})
