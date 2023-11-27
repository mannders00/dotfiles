vim.api.nvim_set_keymap('n', '<C-b>', ':Lexplore<CR>', { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', 'H', '5<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '5<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '5<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '5<C-w>>', { noremap = true, silent = true })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
