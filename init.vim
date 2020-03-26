set number
set relativenumber
set nocompatible
set magic 
set path=.,**
set wildmenu
set wildmode=longest:list,full
set pastetoggle=<F3>

" syntax enable
syntax on
" highlight 81 column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set encoding=utf-8
set showcmd                     " display incomplete commands

filetype plugin indent on       " load file type plugins + indentation
if $TMUX == ''
  set clipboard=unnamedplus
endif

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (change this to your linking)
set expandtab                   " use spaces, not tabs (remove this if you mostly use tabs)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
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

"" Set region to US English
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
  Plug 'jamessan/vim-gnupg'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  
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

" colorscheme
colo default
" colo seoul256

" Airline
let g:airline_theme = 'tomorrow'
let g:airline#extensions#branch#enabled = 1
set laststatus=2

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

"" Keybindings 

let mapleader = ","
imap jj <Esc>

" Save a file 
nnoremap <Leader>w :w<CR> 

" fly between buffers
nnoremap <leader>l :ls<CR>:b<space>

" System clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy

" Easy window split
" window
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

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" "Refocus" folds
nnoremap <Leader>z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" fzf bindings
"
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

command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>

" coc bindings
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" cut and paste for wayland
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
