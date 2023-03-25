UNAME_S := $(shell uname -s | tr A-Z a-z)

all: sync

sync:
mkdir -p ~/.vim/{undos,backups,swaps,bundle}

[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
[ -f ~/.hyper.js ] || ln -s $(PWD)/hyper.js ~/.hyper.js
[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

ifeq ($(UNAME_S),linux)
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
endif
ifeq ($(UNAME_S),darwin)
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
endif

clean:
rm -f ~/.vimrc 
rm -f ~/.vim
rm -f ~/.gitconfig

ifeq ($(UNAME_S),linux)
	rm -f ~/.bashrc
endif
ifeq ($(UNAME_S),darwin)
	rm -f ~/.zshrc
endif

.PHONY: all sync clean
