-- Floaterm
local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>u',':FloatermToggle<CR>',    { noremap=true, silent=true })
keymap('t', '<Leader>u', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = true, silent = true})
keymap('n', '<Leader>n', ':FloatermNew nnn<CR>', {noremap = true, silent = true})
