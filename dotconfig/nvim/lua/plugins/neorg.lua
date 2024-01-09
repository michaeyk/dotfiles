-- lazy.nvim spec
local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
  keys = {
    { "<leader>mm", "<cmd>Neorg toggle-concealer<cr>", mode = { "n" } },
    { "<leader>n", "<cmd>Neorg workspace notes<cr>", mode = { "n" } },
    { "<leader>j", "<cmd>Neorg journal today<cr>", mode = { "n" } },
    { "<leader>J", "<cmd>Neorg journal yesterday<cr>", mode = { "n" } },
    { "<leader>M", "<cmd>Neorg inject-metadata<cr>", mode = { "n" } },
    { "<leader>toc", "<cmd>Neorg generate-workspace-summary<cr>", mode = { "n" } },
  },
}
local plugins = {
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
  ["core.concealer"] = { config = { icon_preset = "varied" } },
  ["core.summary"] = {},
  ["core.export"] = {},
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<Leader>",
    },
  },
}

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})

M.opts = {
  load = plugins,
}
return M
