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
    'folke/neodev.nvim',
    'qvalentin/helm-ls.nvim',
    { 'L3MON4D3/LuaSnip', version = 'v2.1.0' },
    -- DAP
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
    -- 'mfussenegger/nvim-dap-python',
    -- Visual
    'nvim-treesitter/nvim-treesitter',
    'luukvbaal/nnn.nvim',
    'nvim-tree/nvim-tree.lua',
    'lewis6991/gitsigns.nvim',
    'mhartington/formatter.nvim',
    {
        'folke/zen-mode.nvim',
        opts = {
            window = {
                width = 0.5,
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    linebreak = true,
                    wrap = true,
                }
            },
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        },
        build = "make tiktoken",      -- Only on MacOS or Linux
        opts = {
            model = 'claude-sonnet-4.5',
            window = {
                layout = 'replace',
            },
            mappings = {
                accept_diff = false, -- disables the default <C-y> “accept nearest diff”
            },
        },
    },
    -- Utility
    'windwp/nvim-autopairs',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/plenary.nvim',
    -- 'folke/which-key.nvim',
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/org/**/*',
                org_default_notes_file = '~/org/scratch.org',
                org_startup_indented = true,
                org_deadline_warning_days = 0,
                org_agenda_custom_commands = {
                    w = {
                        description = "Work",
                        types = {
                            {
                                type = 'agenda',
                                org_agenda_tag_filter_preset = 'work'
                            }
                        }
                    },
                    p = {
                        description = "Personal",
                        types = {
                            {
                                type = 'agenda',
                                org_agenda_tag_filter_preset = 'personal'
                            }
                        }
                    },
                }
            })
        end,
    },
    -- Study
    {
        "kawre/leetcode.nvim",
        dependencies = {
            -- include a picker of your choice, see picker section for more details
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lang = "python3"
        },
    }
})

-- Initialize Plugins
require("mason").setup()
require('neodev').setup()
require('nvim-treesitter.configs').setup {
    ensured_installed = { "go", "bash", "javascript", "html", "lua", "org" },
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
    vim.keymap.set("n", "<M-h>", function() api.tree.resize({ relative = -5 }) end, { buffer = bufnr })
    vim.keymap.set("n", "<M-l>", function() api.tree.resize({ relative = 5 }) end, { buffer = bufnr })
end
require('nvim-tree').setup({
    on_attach = tree_on_attach,
    tab = {
        sync = {
            open  = true,
            close = true,
        },
    },
})
-- require('gitsigns').setup()
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
require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.DS_Store",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        },
    },
})
require("telescope").load_extension("ui-select")
require('nvim-autopairs').setup()
-- require('which-key').setup()

-- DAP Setup
-- require('dap-python').setup('~/venv/bin/python')
require('dap-go').setup()
