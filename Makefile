UNAME_S := $(shell uname -s | tr A-Z a-z)

all: sync

sync:
	mkdir -p ~/.vim/{undos,backups,swaps,bundle,plugged}
	mkdir -p ~/.config/fish
	[ -f ~/.vimrc ] || ln -sf $(PWD)/vimrc ~/.vimrc
	[ -f ~/.hyper.js ] || ln -sf $(PWD)/hyper.js ~/.hyper.js
	[ -f ~/.gitconfig ] || ln -sf $(PWD)/gitconfig ~/.gitconfig
ifeq ($(UNAME_S),linux)
	[ -f ~/.bashrc ] || ln -sf $(PWD)/bashrc ~/.bashrc
endif
ifeq ($(UNAME_S),darwin)
	[ -f ~/.config/fish/config.fish ] || ln -sf $(PWD)/config.fish ~/.config/fish/config.fish
	[ -d ~/.config/fish/functions/ ] || ln -s $(PWD)/fish/functions ~/.config/fish/functions
endif

clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
	rm -f ~/.gitconfig
	rm -f ~/.hyper.js

ifeq ($(UNAME_S),linux)
	rm -f ~/.bashrc
endif
ifeq ($(UNAME_S),darwin)
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/fish/functions
endif

.PHONY: all sync clean
