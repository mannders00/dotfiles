local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-b>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', builtin.find_files, {})
vim.keymap.set('n', '<C-k>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.commands, {})
vim.keymap.set('n', '?', ':WhichKey<CR>', {})

vim.keymap.set('i', '<C-e>', 'if err != nil {}<Left>', { noremap = true })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = "Center cursor",
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  callback = function()
    local mode = vim.fn.mode(1)
    if mode == "i" then
      return
    end
    vim.cmd "normal! zz"
  end,
})
