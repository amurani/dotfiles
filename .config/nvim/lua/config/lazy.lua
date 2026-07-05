-- Bootstrap and configure lazy.nvim (the plugin manager).
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- All plugin specs live in lua/plugins/*.lua and are auto-imported.
-- Versions are pinned in lazy-lock.json (committed to the repo) — the actual fix
-- for cross-machine drift. Run `:Lazy restore` to reproduce the locked versions,
-- or `:Lazy sync` to update and refresh the lockfile.
require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "catppuccin-macchiato" } },
	checker = { enabled = false }, -- no background update checks; we pin via the lockfile
	change_detection = { notify = false },
	rocks = { enabled = false }, -- avoid the luarocks dependency; nothing here needs it
})
