-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.relativenumber = true
-- Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true
-- Disable swap files

-- cmp option
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
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
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0
vim.o.expandtab = true

-- highlight column
vim.o.colorcolumn = '100'

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
-- vim.g.onedark_terminal_italics = 2

-- Set statusbar
vim.g.lightline = {
  colorscheme = 'tokyonight',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Set spelling
vim.cmd [[ autocmd FileType latex,tex,text,mail,markdown setlocal spell ]]

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

-- Write encrypted file
vim.cmd [[ 
command! -nargs=1 WriteEncrypted w !gpg -c -o <q-args>
]]

-- python
vim.g.python3_host_prog = '~/dev/neovim/bin/python'

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

