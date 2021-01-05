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

  use 'lervag/vimtex'
  use 'justinmk/vim-dirvish'
  use 'neovim/nvim-lspconfig'
  use 'romainl/vim-qf'
  use {'nvim-lua/completion-nvim', requires = {'SirVer/ultisnips', 'vim-snippets'}}
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}

  use 'pineapplegiant/spaceduck'
end)
