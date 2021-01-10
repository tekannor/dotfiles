vim.cmd 'filetype plugin indent on'

vimp.tnoremap('<Esc>', '<C-\\><C-n>')
vimp.nnoremap('gB', ':bnext<CR>')
vimp.nnoremap('gb', ':bprev<CR>')
vimp.nnoremap('<M-q>', 'gwap')
vimp.nmap('<C-c>', ':bp|bd #<CR>')

vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[au CmdlineLeave : echo '']]

vim.cmd [[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q''))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]

