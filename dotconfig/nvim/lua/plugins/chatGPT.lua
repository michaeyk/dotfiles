return {
  "jackMort/ChatGPT.nvim",
  cmd = "ChatGPT",
  keys = {
    { "<leader>c", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = "n" },
    { "<leader>aa", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT", mode = "n" },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = true,
}
