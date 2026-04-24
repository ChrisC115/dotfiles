" ============================================================================
" 1. THE DRILL SERGEANT (Hard Mode & Arrows)
" ============================================================================
let g:hardtime_default_on = 1
let g:hardtime_timeout = 1000
let g:hardtime_maxcount = 1
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1

" Disable Arrow Keys in all modes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" ============================================================================
" 2. PLUGIN MANAGEMENT (Vim-Plug)
" ============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'takac/vim-hardtime'         " The Training Rules
    Plug 'tpope/vim-surround'         " Fast quote/bracket management
    Plug 'tpope/vim-commentary'       " Quick commenting with 'gcc'
    Plug 'vim-airline/vim-airline'    " Professional status bar
    Plug 'jiangmiao/auto-pairs'       " Auto-closes brackets
    Plug 'vim-python/python-syntax'   " Better Python highlighting
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelligence Engine
call plug#end()

" ============================================================================
" 3. SYSTEM SETTINGS & UI
" ============================================================================
syntax on
set nocompatible
set relativenumber      " For jumping with {num}j or {num}k
set number              " Show current line number
set clipboard=unnamedplus
set expandtab           " Use spaces instead of tabs
set shiftwidth=4
set tabstop=4
set ignorecase          " Smart searching
set smartcase
set scrolloff=8         " Keep cursor centered
set hidden              " Switch buffers without saving

" ============================================================================
" 4. LANGUAGE SPECIFIC & RUNNER
" ============================================================================
let mapleader = " "
let g:coc_global_extensions = ['coc-pyright', 'coc-json']

" The Master Runner: Save and Run with Space + r
autocmd FileType python nnoremap <leader>r :w<CR>:!python3 %<CR>
autocmd FileType javascript nnoremap <leader>r :w<CR>:!node %<CR>
autocmd FileType sh nnoremap <leader>r :w<CR>:!bash %<CR>
autocmd FileType java nnoremap <leader>r :w<CR>:!javac % && java %:r<CR>

" ============================================================================
" 5. NAVIGATION SHORTCUTS
" ============================================================================
nnoremap H ^
nnoremap L $
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :HardTimeToggle<CR>

" CoC Tab Completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
