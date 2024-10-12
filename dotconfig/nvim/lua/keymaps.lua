-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap kj as ESC
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true })

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Window split
vim.api.nvim_set_keymap("n", "<Leader>sh", ":topleft vnew<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>sl", ":botright vnew<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>sk", ":topleft new<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Leader>sj", ":botright new<CR>", { noremap = false })

-- Easier split navigations
-- vim.api.nvim_set_keymap('n', '<c-h>', '<c-w><c-h>', { noremap = false })
-- vim.api.nvim_set_keymap('n', '<c-j>', '<c-w><c-j>', { noremap = false })
-- vim.api.nvim_set_keymap('n', '<c-k>', '<c-w><c-k>', { noremap = false })
-- vim.api.nvim_set_keymap('n', '<c-l>', '<c-w><c-l>', { noremap = false })

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Ssytem clipboard
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>yy", '"+yy', { noremap = true })

-- Move between buffers
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

-- Previous buffer
vim.api.nvim_set_keymap("n", "<C-b>", ":bprevious<CR>", { noremap = true, silent = true })

-- Delete buffer
vim.api.nvim_set_keymap("n", "<Leader>", ":bd<CR>", { noremap = true, silent = true })

-- . to change working directory to current file directory
vim.api.nvim_set_keymap("n", "<Leader>.", ":cd %:p:h<CR>", { noremap = true, silent = true })

-- Toggle spell checking with '<Leader>s'
vim.api.nvim_set_keymap("n", "<Leader>s", ":set spell!<CR>", { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap("n", "<C-s>", ":write<CR>", { noremap = true })

-- Open vimrc in split
vim.api.nvim_set_keymap("n", "<Leader>ev", ":e $MYVIMRC<CR> :cd $HOME/.config/nvim<CR>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true })
