vim.o.showmode = false
vim.o.laststatus = 2
vim.o.ruler = false

vim.cmd [[
function! Status()
  if mode() == 'n'
    return " NORMAL "
  elseif mode() == 'i'
    return " INSERT "
  elseif mode() == 'R'
    return " REPLACE "
  elseif mode() ==# 'v'
    return " VISUAL "
  elseif mode() ==# 'V'
    return " VISUAL "
  elseif mode() ==# ''
    return " VISUAL "
  elseif mode() ==# 'c'
    return " COMMAND "
  elseif mode() ==# 't'
    return " TERMINAL "
  elseif mode() == 'v' || mode() == 'V' || mode() == '^V' || mode() == 's' || mode() == 'S' || mode() == '^S'
    return " VISUAL "
  endif
endfunction

set statusline=
set statusline+=\ %{Status()}
set statusline+=%{bufnr('%')}\ 
set statusline+=%{expand('%:t')}
set statusline+=%{&mod==1?'\ +\ ':'\ '}

set statusline+=%{FugitiveHead()!=''?'\ ':''}
set statusline+=%{FugitiveHead()!=''?FugitiveHead():''}

set statusline+=%=
function! Diagnostics() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let errors = get(info, 'error', 0)
  let warnings = get(info, 'warning', 0)
  return {'errors': errors, 'warnings': warnings}
endfunction

set statusline+=%#LspError#%{Diagnostics().errors?Diagnostics().errors:''}
set statusline+=%{Diagnostics().errors?'\ ●\ ':''}%*
set statusline+=%#LspWarning#%{Diagnostics().warnings?Diagnostics().warnings:''}
set statusline+=%{Diagnostics().warnings?'\ ●\ ':''}%*

set statusline+=%{expand(&filetype)}\ 
set statusline+=%f
set statusline+=\ %l:%c\ 

]]

-- function! Diagnostics() abort
--   let errors = luaeval("vim.lsp.diagnostic.get_count(0, 'LspError')")
--   let warnings = luaeval("vim.lsp.diagnostic.get_count(0, 'LspWarning')")
--   return {'errors': errors, 'warnings': warnings}
-- endfunction

