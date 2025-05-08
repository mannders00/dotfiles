vim.o.mouse = "a"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.mapleader = ' '
-- vim.o.clipboard="unnamedplus"

vim.cmd [[
  colorscheme default
  syntax on
  set notermguicolors

  " magenta for control‐flow and other keywords
  highlight Statement cterm=bold    ctermfg=5
  highlight Keyword   ctermfg=5

  " cyan for types (struct, interface, custom types)
  highlight Type      ctermfg=6

  " bold blue for function names
  highlight Function  cterm=bold    ctermfg=4

  " yellow for literals/constants
  highlight Constant  ctermfg=3

  " green for strings
  highlight String    ctermfg=2

  " italic grey for comments (bright black)
  " highlight Comment   cterm=italic  ctermfg=lightgray
]]

