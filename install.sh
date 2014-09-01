#!/usr/bin/env bash

# backup
echo "Backing up old vim configs"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done

# clone vim
echo "Cloning vim"
/usr/bin/env git clone git://github.com/lxyu/vim.git $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.nvimrc
touch $HOME/.vimrc_local

# install
cd $HOME/.vim && make install || echo "Installation ERROR! Report issue at https://github.com/lxyu/vim"

echo "Installation complete"
echo "1. You can write your customize configs at ~/.vimrc_local"
echo "2. You may use `cd ~/.vim; make update` to update vim config to newest version."
