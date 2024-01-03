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
	-- Core
	'williamboman/mason.nvim',
	-- LSP
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'Jezda1337/cmp_bootstrap',
	'folke/neodev.nvim',
	{ 'L3MON4D3/LuaSnip', version = 'v2.0.0' },
	-- DAP
	-- Visual
	'nvim-tree/nvim-tree.lua',
	'navarasu/onedark.nvim',
	'lewis6991/gitsigns.nvim',
	-- Utility
	'm4xshen/autoclose.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-lua/plenary.nvim',
	'folke/which-key.nvim',
})

-- Initialize Plugins
require("mason").setup()
require("bootstrap-cmp.config").setup({
	file_types = { 'html', 'htmldjango' },
})
require('neodev').setup()
require("nvim-tree").setup()
require('onedark').setup {
	transparent = true,
	toggle_style_key = '<space>t',
	toggle_style_list = { 'dark', 'light' },
}
require('onedark').load()
require('gitsigns').setup()
require("autoclose").setup()
require('which-key').setup()
