require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.jsonls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}

require'lspconfig'.diagnosticls.setup({
  on_attach=require'completion'.on_attach,
  filetypes={
    'markdown',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'css',
    'scss',
    'sass'
  },
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
         security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      stylelint = {
        command = './node_modules/.bin/stylelint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--formatter',
          'json',
          '--stdin-filename',
          '%filepath'
        },
        sourceName = 'stylelint',
        parseJson = {
          errorsRoot = '[0].warnings',
          line = 'line',
          column = 'column',
          message = '${text}',
          security = 'severity'
        },
        securities = {
          error = 'error',
          warning = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        isStderr = true,
        debounce = 100,
        args = { '--stdin' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        formatLines = 1,
        formatPattern = {
          '^.*?:\\s+(\\d+):\\s+(.*)(\\r|\\n)*$',
          {
            line = 1,
            column = -1,
            message = 2
          }
        }
      }
    },
    filetypes = {
      markdown = 'markdownlint',
      javascript = {'eslint', 'stylelint'},
      typescript = {'eslint', 'stylelint'},
      javascriptreact = {'eslint', 'stylelint'},
      typescriptreact = {'eslint', 'stylelint'},
      css = 'stylelint',
      scss = 'stylelint',
      sass = 'stylelint'
    },
    formatters = {
      prettier = {
        command = './node_modules/.bin/prettier',
        -- args = {
        --   '--stdin-filepath',
        --   '%filepath',
        --   '--single-quote',
        --   '--print-width 120'
        -- }
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      typescript = 'prettier',
      javascriptreact = 'prettier',
      typescriptreact = 'prettier'
    },
  }
})

local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim', 'use', 'vimp'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

local default_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, method, result, client_id)
  default_handler(err, method, result, client_id)
  if result and result.diagnostics then
    for _, v in ipairs(result.diagnostics) do
      v.bufnr = vim.uri_to_bufnr(result.uri)
      v.lnum = v.range.start.line + 1
      v.col = v.range.start.character + 1
      v.text = v.message
    end
  vim.lsp.util.set_qflist(result.diagnostics, 'a')
  end
end
