help:
	@echo 'Makefile for vim                              '
	@echo '                                              '
	@echo 'Usage:                                        '
	@echo '   make install      init installation        '
	@echo '   make update       update to newest version '

init:
	git clone http://github.com/gmarik/vundle.git bundle/vundle

gitupdate:
	git checkout master && git fetch && git rebase origin/master

vimupdate:
	vim +BundleInstall! +BundleClean +qall

update: gitupdate vimupdate

ycm_compile:
	echo 'compiling youcompleteme...'
	cd bundle/YouCompleteMe; bash install.sh

install: init update ycm_compile

.PHONY: update ycm_compile install
