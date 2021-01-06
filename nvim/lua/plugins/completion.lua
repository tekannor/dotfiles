vim.g.completion_confirm_key = '<Tab>'
vimp.imap({'silent'}, '<C-Space>', '<Plug>(completion_trigger)')

vim.g.UltiSnipsExpandTrigger = '<nop>'
vim.g.ultisnips_javascript = { semi = 'never' }

vim.o.completeopt = 'menuone,noinsert'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.completion_enable_snippet = 'UltiSnips'

vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]
