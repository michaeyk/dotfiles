-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
augroup Packer
autocmd!
autocmd BufWritePost plugins.lua PackerCompile
augroup end
]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use 'jamessan/vim-gnupg'
  use { 'voldikss/vim-floaterm', config = [[ require('config.floaterm') ]] }

  use { 'vimwiki/vimwiki', config = [[ require('config.vimwiki') ]] }
  use 'mattn/calendar-vim'

  -- Interact with Jupyter notebooks
  use { 'goerz/jupytext.vim', config = [[ vim.g.jupytext_fmt = 'py' ]] }
  use { 
    'dccsillag/magma-nvim', 
    config = [[ require('config.magma') ]],
    run = ':UpdateRemotePlugins' 
  }

  -- Colorschemes
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'jnurmine/Zenburn'
  use 'romainl/Apprentice'
  use 'nanotech/jellybeans.vim'
  use 'sjl/badwolf'
  use 'w0ng/vim-hybrid'
  use 'junegunn/seoul256.vim'
  use {'folke/tokyonight.nvim', branch = 'main'}

  use 'itchyny/lightline.vim' -- Fancier statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[ require('config.gitsigns') ]],
  }

  use { 'neovim/nvim-lspconfig', requires = { 'onsails/lspkind-nvim' } }

  -- highligting
  use { 
    'nvim-treesitter/nvim-treesitter',
    requires = { 
      'nvim-treesitter/nvim-treesitter-textobjects', 
    },
    run = ':TSUdate',
    config = [[ require('config.treesitter') ]]
  }
  
  -- fuzzy find
  use { 
	  'nvim-telescope/telescope.nvim', 
	  requires = { 'nvim-lua/plenary.nvim' }, 
	  config = [[ require('config.telescope') ]] 
  }

  -- completions 
  use { 
    'hrsh7th/nvim-cmp', 
    requires = {
      "hrsh7th/cmp-nvim-lsp",           -- nvim-cmp source for neovim builtin LSP client
      "hrsh7th/cmp-nvim-lua",           -- nvim-cmp source for nvim lua
      "hrsh7th/cmp-buffer",             -- nvim-cmp source for buffer words.
      "hrsh7th/cmp-path",               -- nvim-cmp source for filesystem paths.
      "hrsh7th/cmp-cmdline",               -- nvim-cmp source for filesystem paths.
      "hrsh7th/cmp-emoji",               -- nvim-cmp source for filesystem paths.
      "f3fora/cmp-spell",               -- nvim-cmp source for filesystem paths.
      "hrsh7th/cmp-calc",               -- nvim-cmp source for math calculation.
      "saadparwaiz1/cmp_luasnip",       -- luasnip completion source for nvim-cmp
    },
    config = [[ require('config.cmp') ]]
  }

  -- snippets
  use { 
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets",   -- Snippets collection for a set of different programming languages for faster development.
    },
    config = [[ require('config.luasnip') ]],
  }

	if packer_bootstrap then
    require('packer').sync()
  end

end)

