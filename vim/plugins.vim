set nocompatible " use vim settings not vi 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/tComment'


Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype on 
