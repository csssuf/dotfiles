#!/bin/bash
export FILES=(.gitconfig .i3status.conf .vimrc .Xdefaults .ycm_extra_conf.py
              .zshrc)
export DIRS=(.i3 .oh-my-zsh)

for file in ${FILES[*]}; do
    echo "File ${file}"
    mv ~/$file{,.bak}
    cp ./$file ~/$file
done

for dir in ${DIRS[*]}; do
    echo "Directory ${dir}"
    mv ~/$dir{,.bak}
    cp -r ./$dir ~/
done 
