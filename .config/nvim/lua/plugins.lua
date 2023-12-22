require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'hrsh7th/nvim-cmp'  -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'Jezda1337/cmp_bootstrap'
	use 'L3MON4D3/LuaSnip'  -- Snippets plugin
	use 'nvim-tree/nvim-tree.lua'
	use 'navarasu/onedark.nvim'
	use 'm4xshen/autoclose.nvim'
	use 'neovim/nvim-lspconfig'
	use 'lewis6991/gitsigns.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
end)

require("bootstrap-cmp.config").setup({
	file_types = { 'html', 'htmldjango' },
})
require("nvim-tree").setup()
require('onedark').setup {
	transparent = true,
	toggle_style_key = '<space>t',
	toggle_style_list = { 'dark', 'light' },
}
require('onedark').load()
require("autoclose").setup()
require('gitsigns').setup()
