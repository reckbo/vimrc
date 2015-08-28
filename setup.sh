#!/bin/bash

mkdir -p ~/.vim/bundle

[ -f ~/.vimrc ] || ln -s vimrc ~/.vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    cd ~/.vim/bundle/Vundle.vim && git pull origin
fi

vim +PluginInstall +qall
