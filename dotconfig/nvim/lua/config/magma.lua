-- Magma
vim.api.nvim_set_keymap('n', '<Leader>m', ':MagmaInit<CR>', {noremap = true, silent = true})
-- nnoremap <silent><expr> <LocalLeader>j  :MagmaEvaluateOperator<CR>
vim.api.nvim_set_keymap('n', '<LocalLeader>jj', ':MagmaEvaluateLine<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>j', ':MagmaReevaluateCell<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<LocalLeader>j', ':<C-u>MagmaReevaluateVisual<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>j', ':MagmaReevaluateVisual<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jc', ':MagmaReevaluateCell<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jd', ':MagmaDelete<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jo', ':MagmaShowOutput<CR>', {noremap = true, silent = true})

vim.g.magma_automatically_open_output = 'v:false'

