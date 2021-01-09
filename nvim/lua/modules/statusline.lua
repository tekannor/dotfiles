vim.o.showmode = false
vim.o.laststatus = 2
vim.o.ruler = false

local function mode()
  local modes = {
    i = 'INSERT',
    n = 'NORMAL',
    r = "REPLACE",
    v = "VISUAL",
    V = "VISUAL",
    c = "COMMAND",
    t = "TERMINAL",
  }
  return modes[vim.fn.mode()]
end

local function git()
  local branch = vim.fn.FugitiveHead()
  return branch ~= '' and ' ' .. branch or ''
end

local function diagnostics()
  local info = vim.b.coc_diagnostic_info or {error = 0, warning = 0, hint = 0, information = 0}
  local errors = info.error
  local others = info.warning + info.hint + info.information

  local error_tag = errors > 0 and ('%#LspError#% ' .. errors .. ' ●%*') or ''
  local warning_tag = others > 0 and '%#LspWarning#% ' .. others ..  ' ●%*' or ''

  return error_tag .. (others > 0 and ' ' or '') .. warning_tag .. ' '
end

function _G.build_statusline()
  local space = ' '
  local filename = vim.fn.expand('%:t')
  local modified = vim.bo.modified and '+' or space
  local big_space = '%='
  local filetype = vim.bo.filetype
  local filepath = vim.fn.expand('%f')
  local position = vim.fn.line('.') .. ':' .. vim.fn.col('.')

  local components = {
    space,
    mode(), filename .. modified, git(),
    big_space,
    diagnostics(), filetype, filepath, position,
    space
  }

  return table.concat(components, space)
end

vim.cmd 'set statusline=%!v:lua.build_statusline()'
