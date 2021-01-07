vim.g.coc_global_extensions = {
  'coc-snippets',
  'coc-pairs',
  'coc-tsserver',
  'coc-emmet',
  'coc-prettier',
  'coc-json',
  'coc-eslint',
  'coc-highlight',
  'coc-svelte',
  'coc-lua',
  'coc-vimtex',
}

vim.o.backup = false
vim.o.writebackup = false
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = 'menuone,noinsert'

vim.cmd [[
augroup Coc
  au! User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]]

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local function show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. cw)
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? coc#_select_confirm() : '<C-g>u<CR><c-r>=coc#on_enter()<CR>']])

vimp.nmap({'silent'}, '[g', '<Plug>(coc-diagnostic-prev)')
vimp.nmap({'silent'}, ']g', '<Plug>(coc-diagnostic-next)')
vimp.nmap({'silent'}, 'gd', '<Plug>(coc-definition)')
vimp.nmap({'silent'}, 'gD', '<Plug>(coc-declaration)')
vimp.nmap({'silent'}, 'gy', '<Plug>(coc-type-definition)')
vimp.nmap({'silent'}, 'gI', '<Plug>(coc-implementation)')
vimp.nmap({'silent'}, 'gr', '<Plug>(coc-references)')
vimp.nmap({'silent'}, '<Space>rn', '<Plug>(coc-rename)')
vimp.nmap({'silent'}, '<Space>fa', ':CocAction<CR>')

vimp.nnoremap({'silent'}, 'K', show_docs)
vimp.nmap({'silent'}, '<Esc>', ':call coc#float#close_all()<CR>')
vimp.nnoremap({'silent'}, '<Space>a', ':<C-u>CocList diagnostics<CR>')
vimp.nnoremap({'silent'}, '<Space>fm', [[:call CocAction('format')<CR>]])
vimp.nnoremap({'silent'}, '<Space>fo', [[:call CocAction('runCommand', 'editor.action.organizeImport')<CR>]])
