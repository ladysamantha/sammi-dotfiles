" Vim to NeoVim specific settings
if !has('nvim')
    set ttymouse=xterm2
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Plugin settings
call plug#begin()

" General editing
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'

" Individual language settings
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Completion
Plug 'w0rp/ale'

" Airline/Powerline/"I'm just sitting here looking at pretty colors"
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'ryanoasis/vim-devicons'

" Testing
Plug 'tpope/vim-dispatch'

call plug#end()

let g:airline_powerline_fonts=1
let g:airline_theme='luna'

" from amix/vimrc
syntax on
set number
filetype plugin on
filetype indent on
set autoread

try
    color dracula
catch
endtry

" key bindings
" and other things ripped from amix/vimrc
let mapleader = ","
let g:mapleader = ","

" Ale configuration
let g:ale_linters = {
\  'bash': ['shellcheck'],
\  'rust': ['cargo'],
\  'javascript': ['eslint'],
\  'haskell': ['brittany', 'stack-build'],
\  'typescript': ['tslint'],
\  'go': ['gofmt', 'golint']
\}

let g:ale_fixers = {
\ 'typescript': ['tslint'],
\ 'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>

" Tab navigation like Firefox.
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l   :tabnext<CR>
nnoremap <leader>t     :tabnew<CR>
inoremap <c-S-tab> <Esc>:tabprevious<CR>i
inoremap <c-tab>   <Esc>:tabnext<CR>i
inoremap <c-t>     <Esc>:tabnew<CR>

" Should only be used when editing the Vim config
nmap <leader>ws :w!<cr> :source %<cr>

" vim-plug
nmap <leader>pi :PlugInstall<cr>

" NERDTree
nmap <leader>nt :NERDTreeToggle<cr>

let NERDTreeShowHidden=1

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set number
set ruler

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

