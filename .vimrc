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
Plugin 'Tagbar'
Plugin 'ctrlp.vim'
Plugin 'tComment'
Plugin 'vim-airline/vim-airline'
Plugin 'fugitive.vim'
"Plugin 'valloric/youcompleteme'
Plugin 'bling/vim-bufferline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

" show cmd in normal mode
set showcmd

" system clipboard
set clipboard=unnamed

" change leader
let mapleader=","
nnoremap <leader>. :CtrlPTag<CR>

" clear search highlight
nnoremap <leader><space> :noh<CR>

" regen tags
nnoremap <leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR><CR>

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
syntax on
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

" Tagbar toggle
nnoremap <F8> :TagbarToggle<CR>

" NERDTree toggle
nnoremap <F3> :NERDTreeToggle<CR>

" airline
set laststatus=2
set t_Co=256

noremap <F5> :call CompileRun()<CR>
function! CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "! ./%<"
  elseif &filetype == 'cpp'
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
augroup END " }

" ctrlp tag mode 
let g:ctrlp_extensions = ['tag']

" multiple cursors option
let g:multi_cursor_exit_from_insert_mode = 0

" set protobuf syntax
augroup filetype
    au! BufRead,BufNewFile *.proto* setfiletype proto
augroup end
