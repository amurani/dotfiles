lua <<EOF

require("mason").setup()

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
