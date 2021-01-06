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
  use 'mhinz/vim-signify'
  use 'justinmk/vim-sneak'
  use 'romainl/vim-cool'

  -- buffer management
  use 'justinmk/vim-dirvish'
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
  use 'airblade/vim-rooter'
  use {'junegunn/fzf', requires = {'junegunn/fzf.vim'}, run = 'fzf#install'}

  -- language support
  use 'lervag/vimtex'
  use 'nvim-treesitter/nvim-treesitter'
  use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'neovim/nvim-lspconfig'
  -- use {'nvim-lua/completion-nvim', requires = {'SirVer/ultisnips', 'honza/vim-snippets'}}
  -- use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}

  -- eyecandy
  use 'pineapplegiant/spaceduck'
end)
