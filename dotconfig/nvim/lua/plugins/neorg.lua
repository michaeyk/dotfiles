return {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = { "luarocks.nvim", "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
  lazy = false,
  version = "*",
  cmd = "Neorg",
  keys = {
    { "<leader>mm", "<cmd>Neorg toggle-concealer<cr>", mode = { "n" } },
    { "<leader>n", "<cmd>Neorg workspace notes<cr>", mode = { "n" } },
    { "<leader>j", "<cmd>Neorg journal today<cr>", mode = { "n" } },
    { "<leader>J", "<cmd>Neorg journal yesterday<cr>", mode = { "n" } },
    { "<leader>M", "<cmd>Neorg inject-metadata<cr>", mode = { "n" } },
    { "<leader>toc", "<cmd>Neorg generate-workspace-summary<cr>", mode = { "n" } },
    { "<leader>fl", "<cmd>Telescope neorg find_linkable<cr>", mode = { "n" } },
    { "<C-f>", "<cmd>Telescope neorg insert_file_link<cr>", mode = { "i" } },
    { "<C-l>", "<cmd>Telescope neorg insert_link<cr>", mode = { "i" } },
  },
  config = function()
    require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/documents/notes",
              },
              default_workspace = "notes",
            }
          },
          -- ["core.tempus"] = {}, -- need nvim 10.0 or greater
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.integrations.telescope"] = {
            config = {
              insert_file_link = {
                show_title_preview = false,
              },
            }
          },
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {
            config = {
              folds = false,
              icon_preset = "diamond",
            }
          },
          ["core.summary"] = {},
          ["core.export"] = {},
          ["core.keybinds"] = {
            -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader>",
            },
          },
        },
      }
    vim.opt.conceallevel = 2
  end,
}

