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

call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'skywind3000/vim-dict'
Plug 'skywind3000/vim-terminal-help'
Plug 'machakann/vim-sandwich'
Plug 'lervag/vimtex'
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

nmap <leader>i :PlugInstall<cr>
nmap <leader>c :PlugClean<cr>

"----------------------------------------------------------------------
" coc.vim
"----------------------------------------------------------------------
" Complement.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_next = '<S-Tab>'

" Skip.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Diagnosis.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" CocList.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

nmap <leader>ch :CocCommand clangd.switchSourceHeader<cr>

"----------------------------------------------------------------------
" vim-dict
"----------------------------------------------------------------------
let g:vim_dict_config = {'markdown':'text', 'c':'text', 'vim':'text'}

"----------------------------------------------------------------------
" vim-terminal-help
"----------------------------------------------------------------------
"set winaltkeys=no
"let g:terminal_shell = 'pwsh'
let g:terminal_kill = 1
let g:terminal_close = 1
let g:terminal_list = 0
let g:terminal_fixheight =1

"----------------------------------------------------------------------
" sandwich
"----------------------------------------------------------------------
map <F9>k saiwtkbd<CR>
map <F9> saiwt
map <leader>s saiw

"----------------------------------------------------------------------
" vimtex
"----------------------------------------------------------------------
let g:tex_flavor = 'latex'

"----------------------------------------------------------------------
" Autoformat
"----------------------------------------------------------------------
map <F7> :Autoformat<CR>

"----------------------------------------------------------------------
" fzf + rg
"----------------------------------------------------------------------
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


"----------------------------------------------------------------------
" Theme
"----------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" WSL yank support
" No need of cliboard support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif
