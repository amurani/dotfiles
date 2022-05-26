lua <<EOF
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "tsx",
    "typescript",
    "vim",
    "yaml"
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  }
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.tsx = { "javascript", "typescript.tsx" }
EOF
