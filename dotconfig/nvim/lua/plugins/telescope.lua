return {
  'nvim-telescope/telescope.nvim',
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader><space>", "<cmd>Telescope buffers<cr>", mode = "n" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n" },
    { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", mode = "n" },
    { "<leader>ft", "<cmd>Telescope tags<cr>", mode = "n" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", mode = "n" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", mode = "n" },
    { "<leader>fw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", mode = "n" },
    -- <Enter> - switches to that worktree
    -- <c-d> - deletes that worktree
    -- <c-f> - toggles forcing of the next deletion
    { "<leader>cw", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", mode = "n" },
  },
  config = true,
}
