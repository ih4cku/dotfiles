filetype off " required by Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ZoomWin'
Plugin 'Tagbar'
Plugin 'ctrlp.vim'
Plugin 'tComment'
Plugin 'vim-airline/vim-airline'
Plugin 'fugitive.vim'
Plugin 'valloric/youcompleteme'

call vundle#end()

" vi related
set nocompatible
set nobackup

" smart search
set hlsearch
set incsearch
set ignorecase
set smartcase

" synatx 
syntax on
set smartindent
set autoindent

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

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
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


