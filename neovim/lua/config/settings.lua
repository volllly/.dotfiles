local utils = require'utils'

vim.o.guifont = 'PragmataPro Liga:h15'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.g.gruvbox_material_palette = 'original'
vim.cmd[[colorscheme gruvbox-material]]
vim.g.neovide_remember_window_size = true

vim.g.mapleader = ' '
utils.key_mapper('', '<up>', '<nop>')
utils.key_mapper('', '<down>', '<nop>')
utils.key_mapper('', '<left>', '<nop>')
utils.key_mapper('', '<right>', '<nop>')

utils.key_mapper('n', '<C-j>', ':tabprev<CR>')
utils.key_mapper('n', '<C-k>', ':tabnext<CR>')

vim.o.hidden = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true

vim.o.number = true

vim.o.clipboard = "unnamed"