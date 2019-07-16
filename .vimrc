
set autoindent
set cindent

set ts=4 " Tab 너비
set shiftwidth=4 " 자동 인덴트할 때 너비
set softtabstop=4
set smartindent
set smarttab
set expandtab
set hlsearch
set encoding=utf-8

set nu

set tags=./tags,tags;$HOME


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/home/steven/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
