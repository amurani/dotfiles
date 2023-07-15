local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    ui = {
        winblend = 10,
        border = 'rounded',
        colors = {
            normal_bg = '#002b36'
        },
        title = false,
    },
    symbol_in_winbar = {
        enable = false
    }
})

-- local diagnostic = require('lspsaga.diagnostic')
-- local opts = { noremap = true, silent = true }

-- vim.keymap.set({ 'n', 'v' }, 'K', '<Cmd>Lspsaga hover_doc<CR>')
-- vim.keymap.set({ 'n', 'v' }, '<leader>rn', '<Cmd>Lspsaga rename<CR>')


local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>rn', '<Cmd>Lspsaga rename<CR>')

-- code action
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>Lspsaga code_action<CR>")