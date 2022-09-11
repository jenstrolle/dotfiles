call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

call plug#end()

" colors and highlighting
syntax enable
set background=dark
colorscheme wal
filetype plugin indent on


" sets
set encoding=utf-8
set nu			        " set numbering
set rnu			        " set relative numbering
set laststatus=2	    " use statusline
set wrap		        " autowrap text
set textwidth=79        " wrap text after 79 characters
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set splitbelow
set splitright

" examples from coc.nvim
set hidden
set nobackup
set nowritebackup
set updatetime=300

" lets
let mapleader = ' '
let maplocalleader = ' '
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

" snippets
let g:UltiSnipsEditSplit="horizontal"
let g:UltisnipsExpandTrigger=""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

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

" bind for setting rnu and nornu
nnoremap <leader>N :set nonu nornu<CR>
nnoremap <leader>n :set nu rnu<CR>

" source vimrc
nnoremap <leader>x :source $MYVIMRC<cr>

" set tab to coc-expand --- https://github.com/neoclide/coc-snippets
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
