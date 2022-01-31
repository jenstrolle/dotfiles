set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lervag/vimtex'

" like powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" original powerline if needed
" Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}


Plugin 'davidhalter/jedi-vim' 
Plugin 'nvie/vim-flake8'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Plugin 'valloric/YouCompleteMe'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" split navigation
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","
let maplocalleader=","

" set wrapping and textwidth set to 79 by default because of PEP8 limit
set wrap
set textwidth=79

" enable folding
set foldmethod=indent
set foldlevel=99

" folding bind with spacebar
nnoremap <space> za

" when opening vim open explorer in left split
autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1

" show folded docstring
let g:SimpylFold_docstring_preview=1

" PEP8 in python
au BufNewFile,BufRead *.py
    \ set tabstop=4 
    \ softtabstop=4 
    \ shiftwidth=4 
    \ expandtab 
    \ autoindent 
    \ fileformat=unix

" run flake8 on python save
autocmd BufWritePost *.py call flake8#Flake8()

" settings for other .files
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile, BufRead *.tex
    \ set tabstop=8


" flag whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" airline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#whitespace#skip_indent_check_ft =
   \  {'tex': ['mixed-indent-file']}


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:airline_symbols.linenr = '  ␊:'
let g:airline_symbols.colnr = '  ℅:'
let g:airline_symbols.maxlinenr = '☰  '

syntax enable
set background=dark
colorscheme solarized
set termguicolors

" utf-8
set encoding=utf-8

" " YouCompleteMe settings
" let g:ycm_autoclose_preview_window_after_completion=1
" "map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 
" " Turn off YCM
" nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
" " Turn on YCM
" nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>
" 
" " ycm settings for vim
" if !exists('g:ycm_semantic_triggers')
"   let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers.tex = [
"       \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"       \ 're!\\hyperref\[[^]]*',
"       \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"       \ 're!\\(include(only)?|input){[^}]*',
"       \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
"       \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
"       \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
"       \ ]

" syntastic settings
" overvej at skifte til ALE jf https://bit.ly/3EBXM1b
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['pylint', 'python'] 

" ensure syntastic starts in passive mode for all other than tex
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": ["tex"],	
	\ "passive_filetypes": [] }
nnoremap <leader>e :SyntasticCheck<CR>

" syntastic checkers for latex
let g:syntastic_tex_checkers = ['chktex']

" remove warning 3 in syntastic_tex_chktex:A
" warning 3: You should enclose the previous parenthesis with `{}'.
let g:syntastic_tex_chktex_args = '-n3'

" I think this checks on save?
" let g:syntastic_check_on_wq = 1


" python highlighting
let python_highlight_all=1

" linenumbering
set nu
set rnu


" Trigger configuration. You need to change this to something other 
" than <tab> if you use one of the following:
" 
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"" default values
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" latex settings
"
" consider adding synctex capability https://bit.ly/3Gd8Br5
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode = 0
let g:tex_conceal='abdmg'

" Toggle conceallevel
nnoremap <Leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>
