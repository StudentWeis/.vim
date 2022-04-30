set nocompatible
set number
set ruler
set cursorlineopt=number cursorline
set cursorcolumn
set wrap
set mouse=a
set clipboard=unnamed
syntax on

set wildmenu
set wildignore=*.dll,*.exe,*.jpg,*.gif,*.png

" 文本编排
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=dos,unix
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set backspace=indent,eol,start

" 键盘映射
let mapleader = ";"
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>so :w<cr>:so %<cr>
nmap <leader>vs :vs<cr>

"----------------------------------------------------------------------
" netrw
"----------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrm_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <F6> :Lexplore<CR>

"----------------------------------------------------------------------
" Theme
"----------------------------------------------------------------------
set t_Co=256

" WSL yank support
" No need of cliboard support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif
