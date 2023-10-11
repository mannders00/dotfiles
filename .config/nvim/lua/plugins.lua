require('onedark').setup {
    transparent = true
}
require('onedark').load()

require("autoclose").setup()

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'navarasu/onedark.nvim'
	use 'm4xshen/autoclose.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

