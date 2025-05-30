require("conform").setup({
    formatters_by_ft = {
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { 'prettier' },
        lua = { "stylua" },
        perl = { 'perltidy' },
        java = { 'google-java-format' },
        kotlin = { 'ktlint' }
    },
    format_on_save = true
})
