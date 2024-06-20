local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.commands, {})
vim.keymap.set('n', '?', ':WhichKey<CR>', {})

vim.keymap.set('i', '<C-e>', 'if err != nil {}<Left>', { noremap = true })

vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]

-- Change Tabs Quickly
vim.keymap.set('n', '<leader>1', '1gt', {})
vim.keymap.set('n', '<leader>2', '2gt', {})
vim.keymap.set('n', '<leader>3', '3gt', {})
vim.keymap.set('n', '<leader>4', '4gt', {})
vim.keymap.set('n', '<leader>5', '5gt', {})
vim.keymap.set('n', '<leader>6', '6gt', {})
vim.keymap.set('n', '<leader>7', '7gt', {})
vim.keymap.set('n', '<leader>8', '8gt', {})
vim.keymap.set('n', '<leader>9', '9gt', {})
