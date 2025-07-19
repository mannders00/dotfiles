vim.o.mouse = "a"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.wrap = false
vim.o.scrolloff = 999
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.mapleader = ' '
vim.o.splitright = true
-- vim.o.clipboard="unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap linebreak",
})

vim.cmd([[
  autocmd ColorScheme * highlight Statement cterm=bold    ctermfg=5
  autocmd ColorScheme * highlight Keyword   ctermfg=5
  autocmd ColorScheme * highlight Type      ctermfg=6
  autocmd ColorScheme * highlight Function  cterm=bold    ctermfg=4
  autocmd ColorScheme * highlight Constant  ctermfg=3
  autocmd ColorScheme * highlight String    ctermfg=2
  " autocmd ColorScheme * highlight Comment   cterm=italic  ctermfg=lightgray

  syntax on
  set notermguicolors
  colorscheme default
]])

