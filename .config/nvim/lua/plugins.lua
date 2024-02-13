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
	{ 'L3MON4D3/LuaSnip', version = 'v2.1.0' },
	-- DAP
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'mfussenegger/nvim-dap-python',
	'leoluz/nvim-dap-go',
	-- Visual
	'nvim-treesitter/nvim-treesitter',
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'navarasu/onedark.nvim',
	'lewis6991/gitsigns.nvim',
	'norcalli/nvim-colorizer.lua',
	-- Utility
	'm4xshen/autoclose.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-lua/plenary.nvim',
	'folke/which-key.nvim',
})

-- Initialize Plugins
require("mason").setup()
require("bootstrap-cmp.config").setup({
	file_types = { 'html', 'htmldjango', 'template' },
})
require('neodev').setup()
require('nvim-treesitter.configs').setup {
	ensured_installed = { "go", "python", "html", "htmldjango", "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
}
require('nvim-tree').setup()
require('onedark').setup {
	colors = {
		black = "000000F",
		bg1 = "000000F",
	},
	transparent = true,
	toggle_style_key = '<space>t',
	toggle_style_list = { 'dark', 'light' },
}
require('onedark').load()
require('gitsigns').setup()
require('colorizer').setup()
require("autoclose").setup()
require('which-key').setup()

-- DAP Setup
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require('dap-python').setup('~/venv/bin/python')
require('dap-go').setup()
