return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
  {
    'jpalardy/vim-slime',
    config = function()
      -- echo &channel to get job-id of terminal
      vim.g.slime_target = "neovim"
    end
  },
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
    'numToStr/Navigator.nvim',
    lazy = false,
    keys = {
      { "<c-h>", "<CMD>:NavigatorLeft<CR>" },
      { "<c-j>", "<CMD>:NavigatorDown<CR>" },
      { "<c-k>", "<CMD>:NavigatorUp<CR>" },
      { "<c-l>", "<CMD>:NavigatorRight<CR>" },
    },
    config = true,
  },
  {
    'glacambre/firenvim',
    build = function() vim.fn['firenvim#install'](0) end,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
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
        ["*"] = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "zbirenbaum/copilot.lua",
    opts = {
      method = "getCompletionsCycling",
    },
  },
}
