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
    	{ 'mfussenegger/nvim-dap',
        	dependencies = {
            		{ "igorlfs/nvim-dap-view" },
        	}
	},
    	'leoluz/nvim-dap-go',
   	 -- 'rcarriga/nvim-dap-ui',
    	-- 'nvim-neotest/nvim-nio',
    	-- 'mfussenegger/nvim-dap-python',
	-- Visual
	'navarasu/onedark.nvim',
	'nvim-treesitter/nvim-treesitter',
	'luukvbaal/nnn.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'lewis6991/gitsigns.nvim',
	'norcalli/nvim-colorizer.lua',
	'mhartington/formatter.nvim',
	-- Utility
	'windwp/nvim-autopairs',
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
require('nnn').setup({
	picker = {
		cmd = "nnn -C",
		style = { border = "rounded" },
		fullscreen = false,
	},
})
local function tree_on_attach(bufnr)
	local api = require('nvim-tree.api')
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.del('n', '<C-e>', { buffer = bufnr })
end
require('nvim-tree').setup({
	on_attach = tree_on_attach,
	view = {
		side = "left"
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
	tab = {
		sync = {
			open  = true,
			close = true,
		},
	},
})
require('gitsigns').setup()
require('colorizer').setup()
require('formatter').setup({
	filetype = {
		python = {
			function()
				return {
					exe = "black",
					args = { "--quiet", "-" },
					stdin = true
				}
			end
		}
	}
})
require('telescope').setup({})
require('nvim-autopairs').setup()
require('which-key').setup()
require('onedark').setup {
	colors = {
		black = "#000000",
		bg1 = "#000000",
	},
	transparent = true,
	toggle_style_key = '<space>t',
	toggle_style_list = { 'dark', 'light' },
}
require('onedark').load()

-- DAP Setup
require('dap-go').setup()

local dap = require('dap')
dap.adapters.go = {
  type = "server",
  host = "127.0.0.1",
  port = 1234,
}
dap.configurations.go = {
  {
    type = "go",
    name = "Attach to Running Delve",
    request = "attach",
    mode = "remote",
    host = "127.0.0.1",
    port = 1234,
  },
}

require("dap-view").setup({
  windows = {
    terminal = {
      -- Hide the terminal for adapters that don’t use it
      hide = { "go" },
      -- Optionally, start the terminal hidden on session start
      start_hidden = true,
    },
  },
})
