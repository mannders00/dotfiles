vim.keymap.set('n', '<M-h>', '5<C-w><', { desc = 'Resize left' })
vim.keymap.set('n', '<M-j>', '5<C-w>+', { desc = 'Resize down' })
vim.keymap.set('n', '<M-k>', '5<C-w>-', { desc = 'Resize up' })
vim.keymap.set('n', '<M-l>', '5<C-w>>', { desc = 'Resize right' })

vim.api.nvim_set_keymap('n', '<leader>ev', ':edit $MYVIMRC<CR>', { noremap = true })

-- Map Ctrl+Shift+h/j/k/l to resize panes
local builtin = require('telescope.builtin')

-- nnn
vim.api.nvim_set_keymap('n', '<C-f>', ':NnnPicker %:p:h<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-f>', '<cmd>NnnPicker %:p:h<CR>', { noremap = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>NvimTreeToggle <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeResize ', { noremap = true })

-- Telescope
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.commands, {})

-- etc
vim.keymap.set('n', '?', ':WhichKey<CR>', {})

-- zen mode
vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { silent = true })

-- Language shortcuts
vim.keymap.set('i', '<C-e>', 'if err != nil {}<Left>', { noremap = true })

vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]

-- Change Tabs 
vim.keymap.set('n', '<leader>1', '1gt', {})
vim.keymap.set('n', '<leader>2', '2gt', {})
vim.keymap.set('n', '<leader>3', '3gt', {})
vim.keymap.set('n', '<leader>4', '4gt', {})
vim.keymap.set('n', '<leader>5', '5gt', {})
vim.keymap.set('n', '<leader>6', '6gt', {})
vim.keymap.set('n', '<leader>7', '7gt', {})
vim.keymap.set('n', '<leader>8', '8gt', {})
vim.keymap.set('n', '<leader>9', '9gt', {})

-- DAP 
vim.api.nvim_set_keymap('n', '<leader>d', ':DapViewToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':DapViewWatch<cr>', { noremap = true })
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').restart() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)

-- Copilot 
vim.api.nvim_set_keymap('n', '<C-C>', ':CopilotChatToggle <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr=true, noremap = true, silent = true })
vim.keymap.set('i', '<C-H>', '<Plug>(copilot-accept-word)', { noremap=true, silent=true })
vim.keymap.set("i", "<C-U>", '<Plug>(copilot-next)', { noremap=true, silent=true })
vim.keymap.set("i", "<C-B>", '<Plug>(copilot-previous)', { noremap=true, silent=true })
vim.g.copilot_no_tab_map = true
