local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.commands, {})
vim.keymap.set('n', '<C-o>', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '?', ':WhichKey<CR>', {})
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
