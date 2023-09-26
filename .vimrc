call plug#begin()
" visual
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline-themes'

" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" .tex
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'

" git
Plug 'tpope/vim-fugitive'

" other
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
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
set title

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
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 20

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode = 0

" split horizontal when editing snippets
let g:UltiSnipsEditSplit="horizontal"

" auto stuff
autocmd BufWritePre *.py :%s/\s\+$//e

" remaps
" vimtex quickfix modes and bindings
nnoremap <leader>q :let g:vimtex_quickfix_mode=0<CR>
nnoremap <leader>Q :let g:vimtex_quickfix_mode=2<CR>
nnoremap <Leader>m :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" bind for opening snip window horizontally
nnoremap <leader>E :UltiSnipsEdit<CR>

" open fzf buffer
nnoremap <silent><leader>b :Buffers<CR>

" open ripgrep in vim
nnoremap <C-g> :Rg <CR>

" open fzf in vim
nnoremap <leader>f :FZF<CR>

" bind for setting rnu and nornu
nnoremap <leader>N :set nonu nornu<CR>
nnoremap <leader>n :set nu rnu<CR>
nnoremap <silent> <leader>le :Lexplore<bar>vertical resize 30<CR>

" source vimrc
nnoremap <leader>x :source $MYVIMRC<cr>
nnoremap <leader>v :sp $MYVIMRC<cr>

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

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

" snippet navigation
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-K> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-J> <Plug>(coc-diagnostic-next)
"
" coc-ltex spellchecking in .tex documents
" https://valentjn.github.io/ltex/vscode-ltex/installation-usage-coc-ltex.html
" Maybe enable for checking thesis?
let g:coc_filetype_map = {'tex': 'latex'}

nnoremap <leader>c :CocList extensions <CR>

" vimsurround support for latex
augroup latexSurround
  autocmd!
  autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
  let b:surround_{char2nr("e")}
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
  let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction


" This will only work if `vim --version` includes `+clientserver`!
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif


" remove coc suggestions in tex
" consider going back to ultisnips only for tex
"autocmd FileType tex let b:coc_suggest_disable = 1

