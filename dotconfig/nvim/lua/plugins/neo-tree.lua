return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = "n" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}
