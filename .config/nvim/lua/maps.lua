vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.commands, {})

vim.keymap.set('n', '?', ':WhichKey<CR>', {})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
