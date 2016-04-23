" hide gui menu
set guioptions-=T

" vi related
set nobackup
set nocompatible

" Vundle
filetype off " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'ZoomWin'
Plugin 'majutsushi/tagbar'

Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'moll/vim-bbye'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jlanzarotta/bufexplorer'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'

Plugin 'tpope/vim-surround'

call vundle#end()

" set folding
set foldmethod=syntax
set foldlevel=3

" enable project specific config
set exrc

" nowrap
set nowrap

" show cmd in normal mode
" set showcmd

" system clipboard
set clipboard=unnamed

" change leader
let mapleader=","

" show tags
nnoremap <leader>. :CtrlPTag<CR>

" clear search highlight
nnoremap <leader><space> :noh<CR>

" regen tags
nnoremap <leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR><CR>

" next buffer
nnoremap <leader>n :bn!<CR>
nnoremap <leader>p :bp!<CR>
nnoremap <leader>d :Bdelete<CR>

" save
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a

" smart search
set hlsearch
set incsearch
set ignorecase
set smartcase

" highlight
set cursorline

" ex command menu
set wildmenu

" synatx 
syntax enable
set smartindent
set autoindent

" color scheme
set background=dark
colorscheme solarized

" match bracket
set showmatch
set matchtime=1

" auto read when modified
set autoread

" filetype
filetype plugin indent on

" line number
set relativenumber
set number

" find path
set path=.,**

" expand tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab

" mouse support in all mode
set mouse=a

" MBE explorer
nnoremap <F4> :MBEToggle<CR>

" Tagbar toggle
nnoremap <F8> :TagbarToggle<CR>

" NERDTree toggle
nnoremap <F3> :NERDTreeToggle<CR>

" airline
set laststatus=2
" set t_Co=256

noremap <F5> :call CompileRun()<CR>
function! CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!rm ./%<"
    exec "!gcc % -o %<"
    exec "! ./%<"
  elseif &filetype == 'cpp'
    exec "!rm ./%<"
    exec "!g++ % -o %<"
    exec "! ./%<"
  elseif &filetype == 'java'
    exec "!javac %c"
    exec "!java %<"
  elseif &filetype == 'sh'
    :!./%
  elseif &filetype == 'python'
    exec "!python %"
  endif
endfunc

" auto save when make
set autowrite

" auto source vimrc 
augroup reload_vimrc " {
    au!
    au BufWritePost ~/.vimrc source ~/.vimrc
    au BufWritePost .vimrc source .vimrc
augroup END " }

" ctrlp tag mode 
let g:ctrlp_extensions = ['tag']
" set wildignore+=distribute/*

" multiple cursors option
let g:multi_cursor_exit_from_insert_mode = 0

" set protobuf syntax
augroup filetype
    au! BufRead,BufNewFile *.proto* setfiletype proto
augroup end

" YCM
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-E>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" solarized
let g:solarized_termcolors=256

