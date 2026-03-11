vim.o.mouse = "a"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.mapleader = ' '
vim.o.splitright = true
-- vim.o.scrolloff = 999
-- vim.o.clipboard="unnamedplus"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap linebreak",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  command = "setlocal shiftwidth=2 tabstop=2 expandtab",
})

-- Highlighting for orgmode files with highlight.nvim
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
    local sep        = vim.api.nvim_get_hl(0, { name = "WinSeparator" }).fg
                   or vim.api.nvim_get_hl(0, { name = "Comment" }).fg

    vim.api.nvim_set_hl(0, "Headline1", { bg = cursorline.bg, underline = true, sp = sep })
    vim.api.nvim_set_hl(0, "Headline2", { bg = cursorline.bg, underline = true, sp = sep })
    vim.api.nvim_set_hl(0, "Headline3", { bg = cursorline.bg, underline = true, sp = sep })
    vim.api.nvim_set_hl(0, "Headline4", { bg = cursorline.bg, underline = true, sp = sep })
  end,
})

-- Global colorscheme based on terminal colors
vim.cmd("Copilot disable")
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
