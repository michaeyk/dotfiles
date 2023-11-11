return {
  "bfredl/nvim-ipy",
  lazy = false,
  keys = {
    { "<leader>rc", "<Plug>(IPy-RunCell)", desc = "Run cell", mode = { "n" } },
    { "<leader>ra", "<Plug>(IPy-RunAll)", desc = "Run all cells", mode = { "n" } },
    { "<leader>nc", "i# %%<ESC>", desc = "New cell", mode = { "n" } },
    { "<leader>ak", ":IPython --existing --no-window<CR>", desc = "Attach kernel", mode = { "n" } },
  },
  config = function()
    vim.g.ipy_celldef = '^# %%'
    vim.cmd([[command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")]])
  end
}
