vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
-- vim.lsp.handlers['textDocument/rename'] = require'lsputil.locations'.rename_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

vimp.nnoremap('<Space>ca', vim.lsp.buf.code_action)
vimp.nnoremap('<Space>cn', vim.lsp.buf.rename)
vimp.nnoremap('<Space>cr', vim.lsp.buf.references)
vimp.nnoremap('<Space>cd', vim.lsp.buf.definition)
vimp.nnoremap('<Space>ci', vim.lsp.buf.implementation)
