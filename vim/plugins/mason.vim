lua <<EOF

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
    }
})

EOF
