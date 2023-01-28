return {
  'nvim-telescope/telescope.nvim',
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader><space>", "<cmd>Telescope buffers<cr>", mode = { "n", "i", "v" } },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = { "n", "i", "v" } },
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = { "n", "i", "v" } },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = { "n", "i", "v" } },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", mode = { "n", "i", "v" } },
    { "<leader>ft", "<cmd>Telescope tags<cr>", mode = { "n", "i", "v" } },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = { "n", "i", "v" } },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", mode = { "n", "i", "v" } },
  },
  config = true,
}



