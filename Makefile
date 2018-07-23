.PHONY: all zsh vim

all: zsh vim

zsh:
	git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

vim:
	@mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	vim +NeoBundleInstall +q
