-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https:github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'jamessan/vim-gnupg'
  use 'voldikss/vim-floaterm'
  use 'vimwiki/vimwiki'
  use 'mattn/calendar-vim'

  -- Interact with Jupyter notebooks
  use 'goerz/jupytext.vim'
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

  -- Colorschemes
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'jnurmine/Zenburn'
  use 'NLKNguyen/papercolor-theme'
  use 'romainl/Apprentice'
  use 'nanotech/jellybeans.vim'
  use 'sjl/badwolf'
  use 'w0ng/vim-hybrid'
  use 'endel/vim-github-colorscheme'
  use 'junegunn/seoul256.vim'
  use {'folke/tokyonight.nvim', branch = 'main'}

  use 'itchyny/lightline.vim' -- Fancier statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind-nvim'  -- icons for LSP
  -- Snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
end)

-- Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.relativenumber = true

-- Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't scroll all the way to the top/bottom
vim.o.scrolloff = 8

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- highlight column
vim.o.colorcolumn = '100'

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]

-- Set statusbar
vim.g.lightline = {
  colorscheme = 'onedark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

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

-- Floaterm
vim.api.nvim_set_keymap('n', '<Leader>u', ':FloatermToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Leader>u', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':FloatermNew nnn<CR>', {noremap = true, silent = true})

-- " fugitive git bindings
-- nnoremap <leader>ga :Git add %:p<CR><CR>
-- nnoremap <leader>gs :Gstatus<CR>
-- nnoremap <leader>gc :Gcommit -v -q<CR>
-- nnoremap <leader>gt :Gcommit -v -q %:p<CR>
-- nnoremap <leader>gd :Gdiff<CR>
-- nnoremap <leader>ge :Gedit<CR>
-- nnoremap <leader>gr :Gread<CR>
-- nnoremap <leader>gw :Gwrite<CR><CR>
-- nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
-- nnoremap <leader>gp :Ggrep<Space>
-- nnoremap <leader>gm :Gmove<Space>
-- nnoremap <leader>gb :Git branch<Space>
-- nnoremap <leader>go :Git checkout<Space>
-- nnoremap <leader>gps :Dispatch! git push<CR>
-- nnoremap <leader>gpl :Dispatch! git pull<CR>
-- nmap <leader>gj :difget //3<CR>
-- nmap <leader>gf :difget //2<CR>

-- Write encrypted file
vim.cmd [[ 
command! -nargs=1 WriteEncrypted w !gpg -c -o <q-args>
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-- vimwiki
vim.g.vimwiki_list = {{path = '~/documents/vimwiki', syntax = 'markdown', ext = '.md', auto_generate_tags = 1, auto_generated_links = 1}}
vim.g.calendar_options = 'nornu'
-- vim.cmd [[command! Diary VimwikiDiaryIndex]] 
-- augroup vimwikigroup
--     autocmd!
--     " automatically update links on read diary
--     autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
-- augroup end

-- python
vim.g.python3_host_prog = '~/dev/neovim/bin/python'

-- jupytext
vim.g.jupytext_fmt = 'py'
    
-- Magma
vim.api.nvim_set_keymap('n', '<LocalLeader>m', ':MagmaInit<CR>', {noremap = true, silent = true})
-- nnoremap <silent><expr> <LocalLeader>j  :MagmaEvaluateOperator<CR>
vim.api.nvim_set_keymap('n', '<LocalLeader>jj', ':MagmaEvaluateLine<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>j', ':MagmaReevaluateCell<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<LocalLeader>j', ':<C-u>MagmaReevaluateVisual<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>j', ':MagmaReevaluateVisual<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jc', ':MagmaReevaluateCell<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jd', ':MagmaDelete<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<LocalLeader>jo', ':MagmaShowOutput<CR>', {noremap = true, silent = true})

vim.g.magma_automatically_open_output = 'v:false'

-- Telescope
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
}
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
-- lspconfig
require('lsp')

