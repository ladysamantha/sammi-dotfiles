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
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'

" Individual language settings
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'docker/docker', { 'for': ['Dockerfile', 'docker'], 'rtp': '/contrib/syntax/vim/' }
Plug 'mattn/emmet-vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'tpope/vim-haml'
Plug 'elmcast/elm-vim'

" Completion
Plug 'valloric/youcompleteme'

" Airline/Powerline/"I'm just sitting here looking at pretty colors"
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

" Testing
Plug 'tpope/vim-dispatch'

call plug#end()

let g:airline_powerline_fonts=1
let g:airline_theme='luna'

syntax on
set number
filetype plugin on
filetype indent on
colorscheme OceanicNext

" key bindings
" and other things ripped from amix/vimrc
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Should only be used when editing the Vim config
nmap <leader>ws :w!<cr> :source %<cr>

" vim-plug
nmap <leader>pi :PlugInstall<cr>

" NERDTree
nmap <leader>nt :NERDTreeToggle<cr>

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
