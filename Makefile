UNAME_S := $(shell uname -s | tr A-Z a-z)

# if first paramether file exists, run second shell paramether command
define ifExistsRun
ifneq ("$(wildcard $(1))","")
	$(shell $(2))
endif
endef

all: sync

sync:
	mkdir -p ~/.vim/{undos,backups,swaps,bundle,plugged}
	$(call ifExistsRun,~/.vimrc,ln -sf $(PWD)/vimrc ~/.vimrc)
	$(call ifExistsRun,~/.hyper.js,ln -sf $(PWD)/hyper.js ~/.hyper.js)
	$(call ifExistsRun,~/.gitconfig,ln -sf $(PWD)/gitconfig ~/.gitconfig)

ifeq ($(UNAME_S),linux)
	$(call ifExistsRun,~/.bashrc,ln -sf $(PWD)/bashrc ~/.bashrc)
endif
ifeq ($(UNAME_S),darwin)
	$(call ifExistsRun,~/.zshrc,ln -sf $(PWD)/zshrc ~/.zshrc)
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
	rm -f ~/.zshrc
endif

.PHONY: all sync clean
