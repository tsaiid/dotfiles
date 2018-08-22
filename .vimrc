set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set laststatus=2
set shiftround  " Shift to the next round tab stop.
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase  " Case Insensitivity Pattern Matching
set smartcase   " Overrides ignorecase if pattern contains upcase
set relativenumber  " Set relative number by default
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

" Search
set hlsearch    " Enable Highlight Search
set incsearch   " Highlight while search
" Press <leader> / to remove search highlights
noremap <silent> <leader>/ :noh<cr>
" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,big5,gbk,euc-jp,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8

set nobackup

set ch=2

syntax on
set nu

" Switch window
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" map the arrow keys to screen line movement instead of buffer line movement
noremap <Up> gk
noremap <Down> gj

" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt

" Easily create a new tab.
noremap <Leader>tN :tabnew<CR>
" Easily close a tab.
noremap <Leader>tc :tabclose<CR>
" Easily move a tab.
noremap <Leader>tm :tabmove<CR>
" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>
" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=tab:>-,trail:~,extends:>,precedes:<
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()
