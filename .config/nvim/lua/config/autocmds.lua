-- Filetype-specific behavior, translated from vim/init.vim + vim/neovim-init.vim.
local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Per-filetype indentation overrides (2-space languages).
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "javascript", "typescript", "typescriptreact", "yaml" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "ruby", "eruby" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})

-- Filetype/syntax overrides by file pattern (Perl Mason shop conventions).
-- Mirrors the old `autocmd BufReadPost *.x set syntax=y` rules. `*.hbs`/`*.mustache`
-- map to `handlebars` so treesitter picks them up.
local syntax_by_pattern = {
	["*.comp"] = "mason",
	["*.html"] = "mason",
	["*.json"] = "json",
	["*.inc"] = "tmpl",
	["*.tmpl"] = "tmpl",
	["*.pp"] = "python",
	["*.config"] = "yaml",
	["*cpanfile"] = "perl",
	[".env*"] = "sh",
	["*.hbs"] = "handlebars",
	["*.mustache"] = "handlebars",
	["*.hql"] = "sql",
}

for pattern, syntax in pairs(syntax_by_pattern) do
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		group = augroup,
		pattern = pattern,
		callback = function()
			vim.bo.syntax = syntax
		end,
	})
end

-- Briefly highlight yanked text (small modern QoL touch).
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Preserve the custom simple-sync (save-to-remote) workflow. Classic Vim loads it
-- via vim/init.vim; Neovim no longer sources that file, so pull the script in here.
local simple_sync = vim.fn.expand("~/.dotfiles/vim/runtimes/vimrcs/simple-sync.vim")
if vim.fn.filereadable(simple_sync) == 1 then
	local ok = pcall(vim.cmd.source, simple_sync)
	if ok then
		vim.g.simple_sync_enabled = 1
		vim.g.simple_sync_logging = 1
	end
end
