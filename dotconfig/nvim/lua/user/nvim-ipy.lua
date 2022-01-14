vim.cmd [[
  command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True --style=gruvbox-light")
]]

vim.g.ipy_celldef = '^# %%'

vim.api.nvim_set_keymap('n', '<Leader>jqt',':RunQtConsole<Enter>', { noremap=true })
vim.api.nvim_set_keymap('n', '<Leader>jk', ':IPython<Space>--existing<Space>--no-window<Enter>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>jc','<Plug>(IPy-RunCell)', { noremap=false })
vim.api.nvim_set_keymap('n', '<Leader>ja','<Plug>(IPy-RunAll)', { noremap=false })
