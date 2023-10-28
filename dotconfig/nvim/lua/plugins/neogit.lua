return {
  "NeogitOrg/neogit",
  keys = {
    { "<leader>g", "<cmd>Neogit --kind=split<CR>", desc = "neogit", mode = "n" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true,
}
