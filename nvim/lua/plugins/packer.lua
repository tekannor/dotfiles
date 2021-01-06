vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'svermeulen/vimpeccable'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'justinmk/vim-sneak'
  use 'airblade/vim-rooter'
  use 'romainl/vim-cool'
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'
  use 'aymericbeaumet/vim-symlink'

  use 'justinmk/vim-dirvish'
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
  use {'prettier/vim-prettier', run = 'yarn install'}

  use 'lervag/vimtex'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'romainl/vim-qf'
  use {'nvim-lua/completion-nvim', requires = {'SirVer/ultisnips', 'honza/vim-snippets'}}
  use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}

  use 'pineapplegiant/spaceduck'
end)
