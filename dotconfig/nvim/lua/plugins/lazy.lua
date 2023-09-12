return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Colorschemes
  'joshdick/onedark.vim',
  'jnurmine/Zenburn',
  'junegunn/seoul256.vim',
  'rebelot/kanagawa.nvim',
  'Mofiqul/dracula.nvim',

  'tpope/vim-unimpaired',
  'tpope/vim-rhubarb',
  'lambdalisue/suda.vim',
  'machakann/vim-sandwich',
  'ludovicchabant/vim-gutentags', -- Automatic tags management
  'jamessan/vim-gnupg',
  'moll/vim-bbye',
  'jkramer/vim-checkbox', -- <leader> tt to toggle
  'vim-pandoc/vim-pandoc',
  'ThePrimeagen/git-worktree.nvim',
  'simrat39/rust-tools.nvim',
  'sitiom/nvim-numbertoggle',
  {
    'GCBallesteros/jupytext.vim',
    config = function()
      vim.g.jupytext_fmt = 'py'
      vim.g.jupytext_style = 'hydrogen'
    end
  },
  -- {
  --   'jpalardy/vim-slime',
  --   config = function()
  --     -- echo &channel to get job-id of terminal
  --     vim.g.slime_target = "neovim"
  --   end
  -- },
  {
    'stevearc/oil.nvim',
    keys = {
      { '-', ':Oil --float .<CR>' },
    },
    opts = {
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-x>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["."] = "actions.toggle_hidden",
      },
    },
    -- Optional dependencies
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      'nvim-telescope/telescope.nvim',
      { 'kkharji/sqlite.lua', module = 'sqllite' }
    },
    config = function()
      require('neoclip').setup({
        enable_persistent_history = true,
      })
      require('telescope').load_extension('neoclip')
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    config = {
      toggle_key = '<C-s>',
      select_signature_key = '<C-n>',
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        python = true,
        javascript = true,
        typescript = true,
        ["*"] = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
