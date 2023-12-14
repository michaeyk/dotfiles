return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    { "<Leader>gd", "<cmd>:Gvdiffsplit!<cr>", desc = "git diff", mode = "n" },
    { "gdh", "<cmd>:diffget //2<cr>", desc = "diffget", mode = "n" },
    { "gdl", "<cmd>:diffget //3<cr>", desc = "diffget", mode = "n" },
  },
}
