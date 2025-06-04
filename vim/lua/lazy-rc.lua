-- modern plugin manager for Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- install lazy nvim  if we don't have it already
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- init
-- vim.opt.rtp:prepend(lazypath)
vim.opt.runtimepath:append("," .. lazypath)

-- register plugins to install
-- require("lazy").setup({
--     -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
--     {
--         'akinsho/bufferline.nvim',
--         version = "*",
--         dependencies = 'nvim-tree/nvim-web-devicons',
--         config = function()
--             require("bufferline").setup{}
--         end
--     }
--
-- })
