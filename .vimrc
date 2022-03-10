set nocompatible              " required
filetype off                  " required

""" Vundle Setup

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


""" Plugins

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" supertab
Plugin 'ervandew/supertab'

" visual
"" - Alternative themes
"" Plugin 'jnurmine/Zenburn'
"" Plugin 'altercation/vim-colors-solarized'
"" Plugin 'dracula/vim', { 'name': 'dracula' }

Plugin 'dylanaraps/wal.vim'

" statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Devicons
Plugin 'ryanoasis/vim-devicons'

" autocomplete
Plugin 'ycm-core/YouCompleteMe'

" general syntax checking
Plugin 'scrooloose/syntastic'

" Python Plugins
"" Folding with docstrings
Plugin 'tmhedberg/SimpylFold'

"" Automatic indenting in python
Plugin 'vim-scripts/indentpython.vim'

" Explore with nerdtree
Plugin 'scrooloose/nerdtree'

" fuzzy search in vim https://bit.ly/3HI7aBS
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
"" Plugin 'ctrlpvim/ctrlp.vim' old fuzzy file finder

" LaTeX
Plugin 'lervag/vimtex'

"" better tex concealing
Plugin 'KeitaNakamura/tex-conceal.vim'

" hardmode disables multiple presses of hkjl
Plugin 'takac/vim-hardtime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""" enable hardtime
let g:hardtime_default_on = 1


""" utf-8
set encoding=utf-8


""" visuals

" linenumbering
set nu
set rnu

" general
syntax enable
set background=dark
colorscheme wal
set termguicolors

" set color of autocomplete menu https://bit.ly/3Kuq2pL
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" set wrapping and textwidth set to 79 by default
set wrap
set textwidth=79

" folding
set foldmethod=indent
set foldlevel=99

"" show folded docstring
let g:SimpylFold_docstring_preview=1

" when opening vim open explorer in left split
autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline_powerline_fonts = 1

"" ignore whitespace checks in .tex files
let g:airline#extensions#whitespace#skip_indent_check_ft =
   \  {'tex': ['mixed-indent-file', 'indent', 'trailing']}

"" new symbols in airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:airline_symbols.linenr = '  ␊:'
let g:airline_symbols.colnr = '  ℅:'
let g:airline_symbols.maxlinenr = '☰  '


""" all around binds

" Rebind C-W to C-M
nnoremap <C-M> <C-W>

" map H, L, J, K to line start, end, halfpgup and halfpgdwn
nnoremap H ^
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>


" split navigation
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" set leaders
let mapleader=","
let maplocalleader=","

" folding bind with spacebar
nnoremap <space> za


""" Python

" python highlighting
let python_highlight_all=1

" Default style for .py
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent
    \ fileformat=unix

" flag whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



""" LaTeX
" consider adding synctex capability https://bit.ly/3Gd8Br5

" default settings for .tex
au BufNewFile, BufRead *.tex
    \ set tabstop=4

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'

" set vimtex default quickfix mode 0 and add binds for toggling
let g:vimtex_quickfix_mode = 0
nnoremap <leader>q :let g:vimtex_quickfix_mode=0<CR>
nnoremap <leader>Q :let g:vimtex_quickfix_mode=2<CR>


" conceal settings

"" remove conceal highlighting
highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"" bind for toggling conceallevel
nnoremap <Leader>m :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>



""" syntastic
""" consider switching to ALE: https://bit.ly/3EBXM1b

" bind for toggling syntastic
nnoremap <leader>e :SyntasticCheck<CR>

" bind for closing loc list
nnoremap <leader>a :lclose<CR>

" binds for going to items in loc list
nnoremap <leader>z :lnext<CR>
nnoremap <leader>c :lprev<CR>

" populate location list
let g:syntastic_always_populate_loc_list = 1

" auto open location list
let g:syntastic_auto_loc_list = 1

" dont do check on open
let g:syntastic_check_on_open = 0

" check on save
let g:syntastic_check_wq = 1

" ensure syntastic starts in passive mode for all other than tex
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": ["tex"],
    \ "passive_filetypes": [] }

" syntastic python
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['flake8']

" syntastic tex
"" syntastic checkers for latex
let g:syntastic_tex_checkers = ['chktex']

" remove warnings in syntastic_tex_chktex
" n3: You should enclose the previous parenthesis with `{}'.
let g:syntastic_tex_chktex_args = '-n3, -n10'


" YouCompleteMe
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" disable ycm locationlist
let g:ycm_always_populate_location_list = 0
let g:ycm_register_as_syntastic_checker = 0

" toggle YouCompleteMe on and off with F4
function Toggle_ycm()
    if g:ycm_auto_trigger == 0
        let g:ycm_auto_trigger = 1
    elseif g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger = 0
    endif
endfunction
map <F4> :call Toggle_ycm() <CR>

" UltiSnips
"" trigger configuration <tab> cannot be used with ycm
""" default values
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" bind for opening snip window horizontally
nnoremap <leader>E :UltiSnipsEdit<CR>
let g:UltiSnipsEditSplit="horizontal"


""" spellchecking - consider whether needed
" setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""" settings for other .files
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
