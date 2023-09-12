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
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Neorg]" } },
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
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
M.opts = {
  load = plugins,
}
return M
