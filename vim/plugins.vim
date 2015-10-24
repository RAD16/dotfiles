set nocompatible " use vim settings not vi 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " plugin manager

" ----- file management -------
Plugin 'scrooloose/nerdtree' " file tree. Leader-t to open/close
Plugin 'ctrlpvim/ctrlp.vim' " file finder
Plugin 'tpope/vim-fugitive' " git wrapper

" ----- coding -------
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/tComment' " gcc - comment out 


" ----- theming -------
Plugin 'bling/vim-airline' " fancy status bar
Plugin 'altercation/vim-colors-solarized' " cokor chemw for airline 

call vundle#end()
filetype on 
