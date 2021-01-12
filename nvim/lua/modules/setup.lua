vim.cmd 'filetype plugin indent on'

vimp.tnoremap('<Esc>', '<C-\\><C-n>')
vimp.nnoremap('gB', ':bnext<CR>')
vimp.nnoremap('gb', ':bprev<CR>')
vimp.nnoremap('<M-q>', 'gwap')
vimp.nmap('<C-c>', ':bp|bd #<CR>')

vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[au CmdlineLeave : echo '']]

