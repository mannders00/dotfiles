-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

-- Install Plugins
require('lazy').setup({
	'williamboman/mason.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'Jezda1337/cmp_bootstrap',
	'nvim-tree/nvim-tree.lua',
	{'L3MON4D3/LuaSnip', version = 'v2.0.0'},
	'navarasu/onedark.nvim',
	'm4xshen/autoclose.nvim',
	'neovim/nvim-lspconfig',
	'lewis6991/gitsigns.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-lua/plenary.nvim',
})

-- Initialize Plugins
require("mason").setup()
require("nvim-tree").setup()
require("bootstrap-cmp.config").setup({
	file_types = { 'html', 'htmldjango' },
})
require('onedark').setup {
	transparent = true,
	toggle_style_key = '<space>t',
	toggle_style_list = { 'dark', 'light' },
}
require('onedark').load()
require("autoclose").setup()
require('gitsigns').setup()
