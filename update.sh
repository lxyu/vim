#!/usr/bin/env bash

git pull
vim +BundleInstall! +BundleClean +qall

echo "vim config now updated."
