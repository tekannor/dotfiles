call plug#begin()

" Editor tools {{{
Plug 'justinmk/vim-sneak'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/tagalong.vim'
" }}}

" Language tools {{{
Plug 'tpope/vim-repeat'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" }}}

" Workspace management {{{
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'aymericbeaumet/vim-symlink'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
" }}}

" Buffer management {{{
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
" }}}

" Extra {{{
Plug 'romainl/vim-cool'
Plug 'ntk148v/vim-horizon'
Plug 'pineapplegiant/spaceduck'
" }}}

call plug#end()

" coc.nvim {{{
source ~/.config/nvim/coc.vim
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-stylelintplus',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-vimlsp', 
      \ 'coc-prettier', 
      \ 'coc-json', 
      \ 'coc-eslint',
      \ 'coc-vimtex',
      \ 'coc-highlight',
      \ 'coc-styled-components'
      \]
" }}}

" general {{{
set syntax
set number relativenumber
set expandtab
set smartcase
set ignorecase
set cursorline
set title
set hidden
set splitbelow
set splitright
set termguicolors
set undofile
set textwidth=120
set shiftwidth=2
set signcolumn=yes
set fillchars+=vert:\
set fcs=eob:\ 

filetype plugin  on

let mapleader = ','

nnoremap <silent>gB :bprev<CR>
nnoremap <silent>gb :bnext<CR>

augroup Startup
  " Replace last cursor position on reopen
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Clear command line output
  autocmd CmdlineLeave : echo ''
augroup END
" }}}

" syntax {{{
colorscheme spaceduck
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
hi VertSplit guibg=none
hi StatusLineNC guibg=none
hi LineNr guibg=none
hi SignColumn guibg=none
" }}}

" coc-git {{{
hi DiffAdd guibg=none
hi DiffChange guibg=none
hi DiffDelete guibg=none
" }}}

" fern.vim {{{
nnoremap <silent>- :Fern . -drawer -width=40 -toggle<CR>

let g:fern#renderer#default#collapsed_symbol = '▸ '
let g:fern#renderer#default#expanded_symbol = '▾ '
let g:fern#renderer#default#leaf_symbol = ''
let g:fern#disable_default_mappings = 1
let g:fern#smart_cursor = 'hide'
let g:fern#renderer = "nerdfont"

let normal = execute('hi Normal')
let guibg = matchstr(normal, 'guibg=\zs\S*')
execute 'hi FernGitStatusBracket guifg=' . guibg

function! s:init_fern() abort
  nmap <buffer>dd <Plug>(fern-action-trash)
  nmap <buffer>x <Plug>(fern-action-mark:toggle)
  nmap <buffer>o <Plug>(fern-action-open:vsplit)
  nmap <buffer>O <Plug>(fern-action-open:split)
  nmap <buffer>r <Plug>(fern-action-rename)
  nmap <buffer>c <Plug>(fern-action-copy)
  nmap <buffer>n <Plug>(fern-action-new-file)
  nmap <buffer>N <Plug>(fern-action-new-dir)
  nmap <buffer><CR> <Plug>(fern-open-or-expand-or-collapse)
  nmap <buffer><Backspace> <Plug>(fern-action-collapse)

  nmap <buffer><expr>
        \ <Plug>(fern-open-or-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
endfunction

augroup Fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
" }}}

" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = { enable = true },
    indent = { enable = true },
  }
EOF
" }}}

" fzf {{{
nnoremap <silent><Space>p :GitFiles<CR>
nnoremap <silent><Leader>p :Files<CR>
nnoremap <silent><Leader>l :Lines<CR>
nnoremap <silent><Leader>m :History<CR>
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>g :Rg<CR>
" }}}

" vimtex {{{
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk = { 'build_dir' : './bin' }

augroup Vimtex
  autocmd User VimtexEventInitPost VimtexCompile
augroup end
" }}}

" python {{{
let g:python3_host_prog = expand('/Users/alexdiaz/.pyenv/versions/3.8.6/bin/python')
" }}}

" vim-rooter {{{
let g:rooter_silent_chdir = 1
" }}}
