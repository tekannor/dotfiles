vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'svermeulen/vimpeccable'

  -- editing tools
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'mhinz/vim-signify'
  use 'unblevable/quick-scope'
  use 'romainl/vim-cool'

  -- buffer management
  use 'airblade/vim-rooter'
  use {'junegunn/fzf', requires = {'junegunn/fzf.vim'}, run = 'fzf#install'}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  -- use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
  -- use 'justinmk/vim-dirvish'

  -- language support
  use 'sheerun/vim-polyglot'
  use 'lervag/vimtex'
  use 'jonsmithers/vim-html-template-literals'
  use {'SirVer/ultisnips', requires = 'honza/vim-snippets'}
  use {'neoclide/coc.nvim', branch = 'release'}
  -- use {'nvim-treesitter/nvim-treesitter', run = 'TSUpdate'}
  -- use 'neovim/nvim-lspconfig'
  -- use {'nvim-lua/completion-nvim', requires = {'SirVer/ultisnips', 'honza/vim-snippets'}}
  -- use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}

  -- eyecandy
  use 'Yggdroot/indentLine'
  use 'tekannor/ayu-vim'
end)
