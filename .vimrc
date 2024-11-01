"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set encoding=UTF-8


" █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █
" █                                                                    █
" █                           PLUGINS SECTION                          █
" █                                                                    █
" █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'


call plug#end()

" ██████████████████████████████████████████████████████████████████████
" █                                                                    █
" █                        VIMSCRIPT SECTION                           █
" █                                                                    █
" ██████████████████████████████████████████████████████████████████████

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

syntax enable
set background=dark
colorscheme gruvbox

let g:startify_custom_header = [
    \ '    ███████╗ █████╗ ██████╗  ██████╗       ██╗  ██╗██╗   ██╗███╗   ██╗',
    \ '    ██╔════╝██╔══██╗██╔══██╗██╔═══██╗      ██║ ██╔╝██║   ██║████╗  ██║',
    \ '    ███████╗███████║██████╔╝██║   ██║█████╗█████╔╝ ██║   ██║██╔██╗ ██║',
    \ '    ╚════██║██╔══██║██╔══██╗██║   ██║╚════╝██╔═██╗ ██║   ██║██║╚██╗██║',
    \ '    ███████║██║  ██║██║  ██║╚██████╔╝      ██║  ██╗╚██████╔╝██║ ╚████║',
    \ '    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝       ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝',
    \ '',
    \ '                          [ SARO-KUN VIM SETUP ]                         ',
    \ '',
    \]

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent Files']   },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinPos = "right"

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

nmap <F8> :TagbarToggle<CR>

let g:blamer_enabled = 1
let g:blamer_delay = 500

let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)

let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let mapleader = " "

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>t :split term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePre * %s/\s\+$//e

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ██████████████████████████████████████████████████████████████████████
" █                                                                    █
" █                         STATUS LINE SECTION                        █
" █                                                                    █
" ██████████████████████████████████████████████████████████████████████

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='tomorrow'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

