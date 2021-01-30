set number
set relativenumber
set nocp
set magic 
set path=.,**
set noswapfile
set hidden
set wildmenu
set wildmode=longest:list,full
set pastetoggle=<F3>
set mouse=n
set scrolloff=8

" syntax enable
syntax on
set colorcolumn=80,100
" call matchadd('ColorColumn', '\%81v', 80)

set encoding=utf-8
set showcmd                     " display incomplete commands

filetype plugin indent on       " load file type plugins + indentation
if $TMUX == ''
  set clipboard=unnamedplus
endif

" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 
set shiftwidth=4                " a tab is 4 spaces
set softtabstop=4
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        
set foldlevel=1        

" netrw settings
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25

" Set region to US English
set spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Plugins will be downloaded under the specified directory.
call plug#begin()
" Declare the list of plugins.
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'jamessan/vim-gnupg'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'dylanaraps/wal.vim'
  Plug 'bfredl/nvim-ipy'
  Plug 'mcchrish/nnn.vim'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } 
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim'

  " Colorschemes
  Plug 'jnurmine/Zenburn'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'romainl/Apprentice'
  Plug 'nanotech/jellybeans.vim'
  Plug 'sjl/badwolf'
  Plug 'w0ng/vim-hybrid'
  Plug 'endel/vim-github-colorscheme'
  Plug 'junegunn/seoul256.vim'

  Plug 'morhetz/gruvbox'
  let g:gruvbox_invert_selection = 0

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Airline
let g:airline_theme = 'tomorrow'
let g:airline#extensions#branch#enabled = 1
set laststatus=2

" colorscheme
set t_Co=256
" colo wal
colo gruvbox

" ctags
set tags=tags;

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

" Keybindings 

let mapleader = " "
inoremap kj <Esc>
inoremap jk <Esc>

" Save a file 
nnoremap <Leader>w :w<CR> 

" Write encypted file
command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>

" System clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy

" Ultisnips
let g:UltiSnipsExpandTrigger='<c-l>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Easy window split
set splitbelow splitright

nmap <leader>sh :topleft  vnew<CR>
nmap <leader>sl :botright vnew<CR>
nmap <leader>sk :topleft  new<CR>
nmap <leader>sj :botright new<CR>

" Use hjkl-movement between rows when soft wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" cnext / cprev
map <f1> :cprev<CR>
map <f2> :cnext<CR>

" w!! to write as root
cmap w!! w !sudo tee % >/dev/null

" Toggle spell checking with ',s'
nmap <silent> <leader>s :set spell!<CR>

" calendar-vim
let g:calendar_options = 'nornu'

" ,cd to change working directory to current file directory
nmap <silent> <Leader>cd :cd %:p:h<CR>

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" "Refocus" folds
nnoremap <Leader>z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" fzf bindings
fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

" nnoremap <silent> <Leader>f. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>ll :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>

let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>

" switch to last buffer
nmap <Leader>b <C-^>

" nnn
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

" terminal in a new tab
" nmap <Leader>t :terminal<CR>
nmap <Leader>t :tabnew +terminal<CR>

" esc to insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

" init.vim
function! ConnectToPipenvKernel()
  let l:kernel = system('echo "ipykernel_$(basename "$(pwd)")" | tr -d "\n"')
  call IPython('--kernel', l:kernel, '--no-window')
endfunction

let g:ipy_celldef = '^# %%' " regex for cell start and end

nmap <silent> <leader>jqt :RunQtConsole<Enter>
nmap <silent> <leader>jk :ConnectToPipenvKernel<Enter>
nmap <silent> <leader>jc <Plug>(IPy-RunCell)
nmap <silent> <leader>ja <Plug>(IPy-RunAll)

" cut and paste for wayland
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" -------------------- LSP ---------------------------------
:lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        require('lspconfig').util.nvim_multiline_command [[
        :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
    end
  end

  local servers = {'pyright', 'gopls', 'rust_analyzer'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_enable_auto_popup = 0

let g:completion_enable_snippet = 'UltiSnips'

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
