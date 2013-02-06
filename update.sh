#!/usr/bin/env bash

git fetch; git rebase origin/master
vim +BundleInstall! +BundleClean +qall

echo "vim config now updated."
