require'lspconfig'.tsserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.svelte.setup{}

require'lspconfig'.diagnosticls.setup({
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
        requiredFiles = {
          '.eslintrc.json',
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
        },
        requiredFiles = {
          '.stylelintrc.json',
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
        args = {
          '--write',
          '%filepath',
        },
        requiredFiles = {
          '.prettierrc.json',
        }
      },
      stylelint = {
        command = './node_modules/.bin/stylelint',
        args = {
          '--fix',
          '%filepath',
        },
        requiredFiles = {
          '.stylelintrc.json',
        }
      }
    },
    formatFiletypes = {
      javascript = {'prettier', 'stylelint'},
      typescript = {'prettier', 'stylelint'},
      javascriptreact = {'prettier', 'stylelint'},
      typescriptreact = {'prettier', 'stylelint'},
      html = {'prettier', 'stylelint'},
      css = {'prettier', 'stylelint'},
      scss = {'prettier', 'stylelint'},
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
