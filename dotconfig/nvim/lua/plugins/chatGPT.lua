return {
  "jackMort/ChatGPT.nvim",
  cmd = "ChatGPT",
  keys = {
    { "<leader>c", "<cmd>ChatGPT<cr>", desc = "NeoTree" },
    { "<leader>aa", "<cmd>ChatGPTActAs<cr>", desc = "NeoTree" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = true,
}
