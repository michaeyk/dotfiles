return     {
  "nvim-neorg/neorg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.integrations.telescope"] = {},
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  keys = {
    { "<leader>fl", "<cmd>Telescope neorg find_linkable<cr>", mode = { "n" } },
    { "<C-f>", "<cmd>Telescope neorg insert_file_link<cr>", mode = { "i" } },
    { "<C-l>", "<cmd>Telescope neorg insert_link<cr>", mode = { "i" } },
  }
}

