local fn = vim.fn

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
  local col = fn.col('.') - 1
  return col == 0 or fn.getline('.'):sub(col, col):match('%s')
end

vimp.inoremap({'expr'}, '<Tab>', function()
  if fn.pumvisible() ~= 0 then
    return '<C-n>'
  elseif check_back_space() then
    return '<Tab>'
  end
  fn['coc#refresh']()
end)

vimp.inoremap({'expr'}, '<S-Tab>', function()
  if fn.pumvisible() ~= 0 then
    return '<C-p>'
  end
  return '<C-h>'
end)

vimp.nnoremap('K', function()
  if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. fn.expand('<cword>'))
  elseif fn['coc#rpc#ready']() then
    fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. fn.expand('<cword>'))
  end
end)

vimp.inoremap({'expr'}, '<CR>', function()
  if tonumber(fn.complete_info()['selected']) >= 0  then
    return '<C-y>'
  end
  return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
end)

vimp.inoremap({'expr'}, '<C-Space>', fn['coc#refresh'])

vimp.nmap('<Space>p', '<Plug>(coc-diagnostic-prev)')
vimp.nmap('<Space>n', '<Plug>(coc-diagnostic-next)')
vimp.nmap('<Space>d', '<Plug>(coc-definition)')
vimp.nmap('<Space>D', '<Plug>(coc-declaration)')
vimp.nmap('<Space>t', '<Plug>(coc-type-definition)')
vimp.nmap('<Space>i', '<Plug>(coc-implementation)')
vimp.nmap('<Space>r', '<Plug>(coc-references)')
vimp.nmap('<Space>2', '<Plug>(coc-rename)')

vimp.nnoremap('<Esc>', fn['coc#float#close_all'])
vimp.nnoremap('<Space>e', ':<C-u>CocList diagnostics<CR>')
vimp.nnoremap('<Space>a', function() vim.cmd 'CocAction' end)
vimp.nnoremap('<Space>f', function() fn.CocActionAsync('format') end)
vimp.nnoremap('<Space>o', function() fn.CocActionAsync('runCommand', 'editor.action.organizeImport') end)

