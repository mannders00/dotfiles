vim.api.nvim_set_keymap('n', '<C-b>', ':Lexplore<CR>', { noremap = true, silent = true} )

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
