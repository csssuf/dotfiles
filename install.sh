#!/bin/bash
set -euo pipefail

export FILES=(.gitconfig .i3status.conf .vimrc .Xdefaults .zshrc)
export DIRS=(.i3 .vim)

for file in ${FILES[*]}; do
    echo "File ${file}"
    if [ -e ~/$file ]; then
        mv ~/$file{,.bak}
    fi
    cp ./$file ~/$file
done

for dir in ${DIRS[*]}; do
    if [ -e ~/$dir ]; then
        mv ~/$dir{,.bak}
    fi
    echo "Directory ${dir}"
    cp -r ./$dir ~/
done 

# Install oh my zsh.
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

# Install NeoBundle.
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall +q
