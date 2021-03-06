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
  Plug 'tools-life/taskwiki'
  Plug 'mattn/calendar-vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'dylanaraps/wal.vim'
  Plug 'bfredl/nvim-ipy'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } 
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim'
  Plug 'voldikss/vim-floaterm'
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-cheat.sh' 

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
colo seoul256

" ctags
set tags=tags;

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

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
let g:UltiSnipsJumpForwardTrigger='<c-j>'
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

" cnext / cprev
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" w!! to write as root
cmap w!! w !sudo tee % >/dev/null

" Toggle spell checking with '<leader>s'
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

" Find files using Telescope command-line sugar
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>c <cmd>Telescope git_commits<cr>
nnoremap <leader>bc <cmd>Telescope git_bcommits<cr>

" switch to last buffer
nmap <Leader>b <C-^>

nnoremap   <silent> <leader>tt :FloatermNew<CR>
tnoremap   <silent> <leader>tt <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent> <leader>tp :FloatermPrev<CR>
tnoremap   <silent> <leader>tp <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent> <leader>tn :FloatermNext<CR>
tnoremap   <silent> <leader>tn <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent> <leader>tk :FloatermKill<CR>
tnoremap   <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent> <leader>u :FloatermToggle<CR>
tnoremap   <silent> <leader>u <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent> <leader>n :FloatermNew nnn<CR>
tnoremap   <silent> <leader>n <C-\><C-n>:FloatermNew nnn<CR>

" esc to insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
nmap <leader>gj :difget //3<CR>
nmap <leader>gf :difget //2<CR>

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

    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            mappings = {
                i = { 
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.send_to_qflist,
                }
            }
        },

        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
    }

    require('telescope').load_extension('fzy_native')
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
