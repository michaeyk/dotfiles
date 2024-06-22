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

  -- mini.nvim
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.cursorword").setup()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.tabline").setup()
      require("mini.jump").setup()
      require("mini.jump2d").setup({
        mappings = {
          start_jumping = 'S',
        },
      })
      require("mini.bracketed").setup()
      require("mini.files").setup()
      -- require("mini.pick").setup()
      -- require("mini.extra").setup()

      vim.keymap.set("n", "-", function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local _ = require("mini.files").close()
        or require("mini.files").open(bufname, false)
      end,
        { desc = "File explorer" }
      )
    end
  },

  'lambdalisue/suda.vim',
  'jamessan/vim-gnupg',
  'moll/vim-bbye',
  'jkramer/vim-checkbox', -- <leader> tt to toggle
  'theprimeagen/git-worktree.nvim',
  'simrat39/rust-tools.nvim',
  'sitiom/nvim-numbertoggle',
  {
    "vhyrro/luarocks.nvim",
    dependencies = {
      "muniftanjim/nui.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neorg/lua-utils.nvim",
      "nvim-lua/plenary.nvim"
    },
    priority = 1000, -- we'd like this plugin to load first out of the rest
    config = true, -- this automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "gcballesteros/jupytext.nvim",
    config = function()
      require('neoclip').setup({
        style = "percent",
      })
      -- depending on your nvim distro or config you may need to make the loading not lazy
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
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
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
