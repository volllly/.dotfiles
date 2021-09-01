local utils = require'utils'

vim.o.shell = 'pwsh'
vim.o.shellcmdflag = '-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

utils.key_mapper('t', '<C-`>', [[<C-\><C-n>:lua NTGlobal["terminal"]:toggle()<cr>]])
utils.key_mapper('t', '<esc>', [[<C-\><C-n>]])
utils.key_mapper( 't', '<C-h>', [[<C-\><C-n><C-W>h]])
utils.key_mapper( 't', '<C-j>', [[<C-\><C-n><C-W>j]])
utils.key_mapper( 't', '<C-k>', [[<C-\><C-n><C-W>k]])
utils.key_mapper( 't', '<C-l>', [[<C-\><C-n><C-W>l]])

require'nvim-terminal'.setup {
	toggle_keymap = '<C-`>'
}

