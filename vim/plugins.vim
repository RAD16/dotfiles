set nocompatible " use vim settings not vi 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
" Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'


call vundle#end()
filetype on 
