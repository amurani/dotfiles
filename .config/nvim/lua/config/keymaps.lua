-- Global, plugin-independent keymaps.
--
-- Plugin-specific mappings live with their plugin spec (e.g. Telescope, buffer
-- navigation, LSP), so they load lazily alongside the plugin. LSP buffer-local
-- mappings are set on LspAttach in lua/plugins/lsp.lua.

-- Clear search highlight with <Esc> in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
