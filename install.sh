#!/bin/bash

# backup
echo "Backing up old vim configs"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done

# clone vim
echo "Cloning vim"
/usr/bin/env git clone git://github.com/lxyu/vim.git $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

# install vundle and plugins
echo "Installing vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Installing plugins"
vim +BundleInstall! +BundleClean +qall
