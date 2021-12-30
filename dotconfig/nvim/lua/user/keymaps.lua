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

-- Better window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {noremap = true, silent = true})

-- Open explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lex 30<CR>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Ssytem clipboard
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>P', '"+P', {noremap = true})
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', {noremap = true})

-- Move between buffers
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', {noremap = true, silent = true})

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
