return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  lazy = false,
  keys = {
    { "<leader>lg", "<cmd>TermExec cmd=\"lazygit\"<cr>", desc = "lazygit", mode = "n" },
  },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]),
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    -- direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
}
