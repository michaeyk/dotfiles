return {
  "bfredl/nvim-ipy",
  lazy = false,
  keys = {
    { "<leader>jc", "<Plug>(IPy-RunCell)", mode = { "n" } },
    { "<leader>ja", "<Plug>(IPy-RunAll)", mode = { "n" } },
    { "<leader>nc", "i# %%<CR>", mode = { "n" } },
    { "<leader>jk", ":IPython --existing --no-window<CR>", mode = { "n" } },
  },
  config = function()
    vim.g.ipy_celldef = '^# %%'
    vim.cmd([[command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")]])
  end
}
