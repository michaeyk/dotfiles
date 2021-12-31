-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
augroup Packer
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'jamessan/vim-gnupg'
  use { 'voldikss/vim-floaterm', config = [[ require('user.floaterm') ]] }
  use 'mcchrish/nnn.vim'

  -- vimwiki
  use { 'vimwiki/vimwiki', config = [[ require('user.vimwiki') ]] }
  use 'mattn/calendar-vim'

  -- Interact with Jupyter notebooks
  use { 'bfredl/nvim-ipy', config = [[ require('user.nvim-ipy') ]] }

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- completion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-emoji'
  use 'f3fora/cmp-spell'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim' -- formatters and linters

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'p00f/nvim-ts-rainbow'

  -- Colorschemes
  use 'joshdick/onedark.vim'
  use 'jnurmine/Zenburn'
  use 'junegunn/seoul256.vim'
  use {'folke/tokyonight.nvim', branch = 'main'}
  use 'rebelot/kanagawa.nvim'

	if packer_bootstrap then
    require('packer').sync()
  end
end)

