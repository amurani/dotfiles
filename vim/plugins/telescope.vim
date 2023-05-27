lua <<EOF

require("telescope").setup({
  extensions = {
    coc = { theme = 'ayu' }
  },
})

-- require('telescope').load_extension('coc')
require("telescope").load_extension("recent_files")

EOF
