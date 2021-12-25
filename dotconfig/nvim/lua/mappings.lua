-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap kj as ESC
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Window split
-- vim.api.nvim_set_keymap('n', '<Leader>sh', ':topleft vnew<CR>', {noremap = false})  -- used by telescope
vim.api.nvim_set_keymap('n', '<Leader>sl', ':botright vnew<CR>', {noremap = false})
vim.api.nvim_set_keymap('n', '<Leader>sk', ':topleft new<CR>', {noremap = false})
vim.api.nvim_set_keymap('n', '<Leader>sj', ':botright new<CR>', {noremap = false})

-- Ssytem clipboard
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>P', '"+P', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', {noremap = true})

-- Last buffer
vim.api.nvim_set_keymap('n', '<Leader>b', '<C-^>', {noremap = true})

-- ,cd to change working directory to current file directory
vim.api.nvim_set_keymap('n', '<Leader>cd', ':cd %:p:h<CR>', {noremap = true, silent = true})

-- Toggle spell checking with '<Leader>s'
vim.api.nvim_set_keymap('n', '<Leader>s', ':set spell!<CR>', {noremap = true, silent = true})

-- Save
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', {noremap = true})

-- ESC to insert mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- Open vimrc in split
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsp $MYVIMRC<CR> | :cd ~/.config/nvim<CR>', {noremap = true})
