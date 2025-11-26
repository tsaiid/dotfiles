" ==========================================
" 1. Plugin 管理 (使用 vim-plug)
" ==========================================
call plug#begin('~/.vim/plugged')

" 介面與外觀
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'

" 功能增強
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" 語言支援 (Polyglot 支援大多數語言)
let g:polyglot_disabled = ['yaml']
Plug 'sheerun/vim-polyglot'

call plug#end()

" ==========================================
" 2. 基礎設定 (Basic Settings)
" ==========================================
let mapleader = "\<Space>"

set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" --- 核心體驗優化 ---
set hidden          " 【關鍵】允許切換 Buffer 時不存檔 (Buffer workflow 必備)
set history=1000    " 增加指令歷史紀錄
set scrolloff=5     " 光標移動到邊緣時，保留 5 行視距 (防撞牆)
set backspace=indent,eol,start
set mouse=a         " 允許滑鼠點擊

" --- 顯示設定 ---
set number          " 顯示行號
set relativenumber  " 相對行號
set cursorline      " 高亮當前行
set laststatus=2
set showcmd
set signcolumn=yes  " 固定左側欄寬度，防止畫面跳動
set ch=1            " cmd line 高度

" --- 縮排與搜尋 ---
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase

" --- 剪貼簿 ---
set clipboard=unnamed

" --- 備份檔案處理 ---
set nobackup
set nowritebackup
set noswapfile      " 不產生 .swp 檔

" --- 真彩色 (True Color) ---
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" ==========================================
" 3. 快捷鍵 (Mappings)
" ==========================================

" --- Buffer 切換 (取代原本的 Tab) ---
" 使用 Tab 鍵切換下一個檔案，Shift-Tab 切換上一個
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>

" 快速關閉目前的 Buffer (不關閉視窗)
nnoremap <leader>bd :bd<CR>

" --- 視窗操作 ---
" 視窗分割後，讓游標直接切過去
set splitbelow
set splitright

" 視窗切換
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" --- 搜尋與存檔 ---
" 快速取消搜尋高亮
noremap <silent> <leader>/ :noh<CR>
" 搜尋結果維持置中
nnoremap n nzz
nnoremap N Nzz

" 快速存檔/退出
nnoremap <leader>w :w<CR>
noremap <leader>q :q<CR>
" Sudo 存檔
cnoremap w!! w !sudo tee % >/dev/null

" 移動 (處理 wrap line)
noremap <Up> gk
noremap <Down> gj

" ==========================================
" 4. 外掛設定 (Plugin Configs)
" ==========================================

" --- Theme: Tender ---
try
    colorscheme tender
catch
    colorscheme desert
endtry

" --- Airline (狀態列) ---
let g:airline_theme='tender'
let g:airline#extensions#tabline#enabled = 1
" 【關鍵】讓上方 Bar 顯示 Buffer 列表，看起來像 Tab，但其實是 Buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" --- EasyMotion ---
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <Leader>s <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ==========================================
" 5. 自定義功能
" ==========================================

" --- YAML 專用設定 ---
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" --- 手動刪除行尾空白指令 ---
" 輸入 :StripWhitespace 即可執行，不再自動觸發
command! StripWhitespace %s/\s\+$//e
