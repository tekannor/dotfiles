vim.o.updatetime = 100

vim.g.signify_sign_add = '▌'
vim.g.signify_sign_delete = '▁'
vim.g.signify_sign_delete_first_line = '▔'
vim.g.signify_sign_change = '▌'

vim.g.signify_sign_show_count = false


vim.cmd 'autocmd ColorScheme * hi SignColumn guibg=none'
vim.cmd 'autocmd ColorScheme * hi DiffAdd guibg=none gui=none'
vim.cmd 'autocmd ColorScheme * hi DiffChange guibg=none gui=none'
vim.cmd 'autocmd ColorScheme * hi DiffRemove guibg=none gui=none'
vim.cmd 'autocmd ColorScheme * hi SignifySignDelete guibg=none gui=none'
