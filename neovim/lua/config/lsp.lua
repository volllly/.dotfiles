local utils = require'utils'

local lspconfig = require'lspconfig'
local completion = require'completion'
lspconfig.rust_analyzer.setup{ on_attach = completion.on_attach }

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = false,
--     signs = true,
--     update_in_insert = true,
--   }
-- )
-- vim.cmd[[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics{}]]

utils.key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
utils.key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
utils.key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
utils.key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
utils.key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
utils.key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
utils.key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
vim.cmd[[imap <silent> <c-space> <Plug>(completion_trigger)]]

vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"


