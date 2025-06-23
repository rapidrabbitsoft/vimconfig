" ============================================================================
" Vim Configuration - Clean & Minimalist
" ============================================================================

" ============================================================================
" Basic Settings
" ============================================================================

" Enable syntax highlighting
syntax on

" Enable file type detection and indentation
filetype plugin indent on

" Set encoding
set encoding=utf-8

" Set line numbers
set number

" Show relative line numbers
set relativenumber

" Highlight current line
set cursorline

" Show matching brackets
set showmatch

" Enable mouse support
set mouse=a

" Set clipboard to use system clipboard
set clipboard=unnamed

" Enable backspace in insert mode
set backspace=indent,eol,start

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Auto indent
set autoindent
set smartindent

" Show status line
set laststatus=2

" Show command in status line
set showcmd

" Enable incremental search
set incsearch
set hlsearch

" Ignore case in search
set ignorecase
set smartcase

" Set leader key to space
let mapleader=" "

" ============================================================================
" Package Manager - vim-plug
" ============================================================================

" Auto-install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ============================================================================
" Plugins
" ============================================================================

call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Commenting
Plug 'tpope/vim-commentary'

" Surround
Plug 'tpope/vim-surround'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Syntax highlighting for various languages
Plug 'sheerun/vim-polyglot'

call plug#end()

" ============================================================================
" Plugin Settings
" ============================================================================

" Color scheme - only load if plugin is available
set background=dark
if has('packages') && isdirectory(expand('~/.vim/plugged/gruvbox'))
  colorscheme gruvbox
else
  " Fallback to a built-in color scheme
  colorscheme desert
endif

" NERDTree settings
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '\.pyc$', '__pycache__']

" FZF settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

" Airline settings
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0

" ============================================================================
" Key Mappings
" ============================================================================

" Quick save
nnoremap <leader>w :w<CR>

" Quick quit
nnoremap <leader>q :q<CR>

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Fuzzy find files
nnoremap <leader>f :Files<CR>

" Fuzzy find in files
nnoremap <leader>g :Rg<CR>

" Toggle search highlighting
nnoremap <leader>h :set hlsearch!<CR>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <leader>< <C-w><
nnoremap <leader>> <C-w>>

" ============================================================================
" Auto Commands
" ============================================================================

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Auto close NERDTree when it's the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto-switch to Gruvbox when it becomes available
autocmd VimEnter * if isdirectory(expand('~/.vim/plugged/gruvbox')) | colorscheme gruvbox | endif

" ============================================================================
" Commands
" ============================================================================

" Command to switch to Gruvbox (useful after installing plugins)
command! Gruvbox if isdirectory(expand('~/.vim/plugged/gruvbox')) | colorscheme gruvbox | else | echo "Gruvbox not installed. Run :PlugInstall first." | endif

" ============================================================================
" Status Line
" ============================================================================

" Show current mode, file name, and line info
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} 