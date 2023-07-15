-- Installation
-- $ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- $ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline').setup() end
    }

end)
