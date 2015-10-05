#!/bin/bash
export FILES=(.gitconfig .i3status.conf .vimrc .Xdefaults .ycm_extra_conf.py
              .zshrc)
export DIRS=(.i3 .oh-my-zsh)

for file in ${FILES[*]}; do
    echo "File ${file}"
    if [ -e ~/$file ]; then
        mv ~/$file{,.bak}
    fi
    cp ./$file ~/$file
done

for dir in ${DIRS[*]}; do
    if [ -e ~/$dir ]; then
        echo "Directory ${dir}"
    fi
    mv ~/$dir{,.bak}
    cp -r ./$dir ~/
done 
