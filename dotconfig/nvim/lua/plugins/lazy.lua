return {
  {
    -- 'rebelot/kanagawa.nvim',
    -- 'joshdick/onedark.vim',
    -- 'Mofiqul/vscode.nvim',
    -- 'projekt0n/caret.nvim',
    -- "ellisonleao/gruvbox.nvim",
    -- "folke/tokyonight.nvim",
    -- 'sainnhe/gruvbox-material',
    "catppuccin/nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- Colorschemes
  'folke/tokyonight.nvim',
  'joshdick/onedark.vim',
  'jnurmine/Zenburn',
  'junegunn/seoul256.vim',
  'rebelot/kanagawa.nvim',
  'Mofiqul/dracula.nvim',
  'Mofiqul/vscode.nvim',
  'projekt0n/caret.nvim',
  'sainnhe/gruvbox-material',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  'tpope/vim-unimpaired',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'lambdalisue/suda.vim',
  'machakann/vim-sandwich',
  'ludovicchabant/vim-gutentags', -- Automatic tags management
  'jamessan/vim-gnupg',
  'moll/vim-bbye',
  'jkramer/vim-checkbox', -- <leader> tt to toggle
  'ThePrimeagen/git-worktree.nvim',
  'simrat39/rust-tools.nvim',
  'sitiom/nvim-numbertoggle',
  {
    "vhyrro/luarocks.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neorg/lua-utils.nvim",
      "nvim-lua/plenary.nvim"
    },
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require('neoclip').setup({
        style = "percent",
      })
      -- Depending on your nvim distro or config you may need to make the loading not lazy
      -- lazy=false,
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    'preservim/vim-markdown',
    dependencies = "godlygeek/tabular",
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
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "luukvbaal/nnn.nvim",
    keys = {
      { "<leader>e", "<cmd>NnnPicker<cr>", mode = { "n" } },
      { "<leader>E", "<cmd>NnnExplorer<cr>", mode = { "n" } },
    },
    config = function() require("nnn").setup() end
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
    opts = {
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
        "norg",
      },
    },
    config = function()
      require("wrapping").setup()
    end,
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
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   build = ':TSUpdate',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter-textobjects',
  --     'p00f/nvim-ts-rainbow',
  --   },
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighing = { "typst" },
        },
        indent = {
          enable = true,
        },
      })
    end,
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
