help:
	@echo 'Makefile for vim                              '
	@echo '                                              '
	@echo 'Usage:                                        '
	@echo '   make install      init installation        '
	@echo '   make update       update to newest version '

init:
	git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim

gitupdate:
	git checkout master && git fetch && git rebase origin/master

vimupdate:
	vim +PluginInstall! +PluginClean +qall

nvimupdate:
	nvim +PluginInstall! +PluginClean +qall

update: gitupdate vimupdate nvimupdate

install: init update

.PHONY: install update
