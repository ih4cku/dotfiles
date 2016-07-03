" The struture of this file follows the order of vim options list :options

" important {{{
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
" }}}

" moving around, searching and patterns {{{
set path=.,**
set incsearch
set magic
set ignorecase
set smartcase
" }}}

" displaying text {{{
set scrolloff=3
set number
set relativenumber
set linebreak
set foldenable
set foldmethod=marker
set lazyredraw
set nowrap
highlight ColorColumn ctermbg=gray
set colorcolumn=81
" }}}

" syntax, highlighting and spelling {{{
filetype plugin indent on
syntax enable
set hlsearch
set cursorline
set background=dark
" }}}

" gui and mouse {{{
if has('win32')
    set guifont=Consolas:h10
endif
set mouse=a
set guioptions-=T
set guioptions-=m
" }}}

" editing {{{
set nobackup
set clipboard=unnamed
set textwidth=80
set backspace=indent,eol,start
set showmatch
set autowrite " auto save when make
" }}}

" tabs and indenting {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set nosmartindent
set autoindent
" no expand in Makefile
autocmd FileType make setlocal noexpandtab
" }}}

" encoding {{{
set encoding=utf-8
set fileencoding=utf-8
" }}}

" command line {{{
set wildmenu
" }}}

" mapping {{{
let mapleader=","
let maplocalleader="\\"

" remap begin/end of line
nnoremap B ^
nnoremap E $

" save file
nnoremap <leader>s :w<CR> 

" format paragraph
nnoremap <leader>f :normal gwip<CR>

" toggle folding
nnoremap <space> za

" clear highlight
nnoremap <leader><space> :noh<CR>

" edit vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>

" buffers
nnoremap <leader>n :bn!<CR>
nnoremap <leader>p :bp!<CR>
nnoremap <leader>d :Bdelete<CR>

" Ag
nnoremap <leader>a :Ag!
" }}}

" plugins {{{
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" file navigation
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" tags
Plugin 'majutsushi/tagbar'

" completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" coding
Plugin 'xuhdev/SingleCompile'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/visual-increment'

" writing
Plugin 'lervag/vimtex'
Plugin 'plasticboy/vim-markdown'

" status line
Plugin 'vim-airline/vim-airline'

" buffer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'moll/vim-bbye'
Plugin 'BufOnly.vim'

" colorscheme
Plugin 'sickill/vim-monokai'

call vundle#end()
filetype on
" }}}

" plugin settings {{{

" airline
set laststatus=2
set t_Co=256

" vim-multiple-cursors
let g:multi_cursor_exit_from_insert_mode=0

" MBE explorer
nnoremap <F4> :MBEToggle<CR>

" Tagbar 
nnoremap <F8> :TagbarToggle<CR>

" NERDTree
nnoremap <F3> :NERDTreeToggle<CR>

" SingleCompile
nnoremap <F7> :SCCompile<CR>
nnoremap <F5> :SCCompileRun<CR>

" YCM
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" set completeopt-=preview
" let g:ycm_preview_to_completeopt=0
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_confirm_extra_conf=0
" nnoremap <leader>j :YcmCompleter GoToDefinition<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" vimtex
nnoremap <localleader>lb :VimtexCompile<CR>:VimtexView<CR>
let g:vimtex_latexmk_continuous=0
let g:vimtex_latexmk_options='-xelatex -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
if has("win32")
    let g:vimtex_view_general_viewer='SumatraPDF'
    let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk='-reuse-instance'
elseif has("unix")
    let g:vimtex_view_general_viewer='qpdfview'
    let g:vimtex_view_general_options='--unique @pdf\#src:@tex:@line:@col'
    let g:vimtex_view_general_options_latexmk='--unique'
endif

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ ]

" }}}

" other functions {{{ 

" solve ESC delay
set timeoutlen=1000 ttimeoutlen=0

" auto source vimrc
augroup ReloadVimrc " {
    au!
    au BufWritePost ~/.vimrc source ~/.vimrc
    au BufWritePost .vimrc source .vimrc
augroup END " }

" hard text wrap in Tex
au FileType tex :setlocal formatoptions+=amB

" }}}
