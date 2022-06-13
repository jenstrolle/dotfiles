" plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'takac/vim-hardtime'
call plug#end()

" colors and highlighting
syntax enable
set background=dark
colorscheme wal


" sets
set encoding=utf-8
set nu			" set numbering
set rnu			" set relative numbering
set laststatus=2	" use statusline
set noshowmode 		" remove --MODE-- from statusline
set wrap		" autowrap text
set textwidth=79	" wrap text after 79 characters

" lets
let mapleader = ' '
let g:hardtime_default_on = 1

let g:lightline = {
	\ 'colorscheme': 'wal',
	\ }

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 20

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode = 0
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode = 0

" snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="horizontal"

" auto stuff
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent
    \ fileformat=unix

autocmd BufWritePre *.py :%s/\s\+$//e


" remaps
" vimtex quickfix modes and bindings
nnoremap <leader>q :let g:vimtex_quickfix_mode=0<CR>
nnoremap <leader>Q :let g:vimtex_quickfix_mode=2<CR>
nnoremap <Leader>m :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" bind for opening snip window horizontally
nnoremap <leader>E :UltiSnipsEdit<CR>

"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum
