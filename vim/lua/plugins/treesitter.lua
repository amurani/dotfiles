require'nvim-treesitter.configs'.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "c",
        "cpp",
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

-- vim.treesitter.language.register('typescript.tsx', 'tsx')
-- vim.treesitter.language.register('javascript', 'tsx')
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }