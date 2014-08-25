LxYu's Vim Config
=================

.. image:: https://d2weczhvl823v0.cloudfront.net/lxyu/vim/trend.png
   :alt: Bitdeli badge
   :target: https://bitdeli.com/free

LxYu's vim config files.

Inspired by `spf13 <http://spf13.com>`_ and `amix <http://amix.dk>`_.


Basic
-----

Install
~~~~~~~

Install it by a one-line command

::

    $ curl https://raw.githubusercontent.com/lxyu/vim/go/INSTALL -o - | sh


Update
~~~~~~

::

    $ cd $HOME/.vim
    $ bash update.sh


Plugins and How to
------------------

Plugin Manager
~~~~~~~~~~~~~~

`Vundle <https://github.com/gmarik/vundle>`_ is used as plugin manager here.

Plugin manager makes life easier. These lines on the top of `vimrc` config enable vundle.

::

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle "gmarik/vundle"


Vundle manage vundle itself, and all the plugins below:

::

    Bundle 'Lokaltog/vim-powerline'
    Bundle 'MarcWeber/vim-addon-mw-utils'
    Bundle 'Shougo/neocomplcache'
    Bundle 'Townk/vim-autoclose'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'flazz/vim-colorschemes'
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/snipmate-snippets'
    Bundle 'jistr/vim-nerdtree-tabs'
    Bundle 'kien/ctrlp.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'mileszs/ack.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/syntastic'
    Bundle 'tomtom/tlib_vim'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
    Bundle 'vim-scripts/sessionman.vim'
    Bundle 'fholgado/minibufexpl.vim'
    Bundle 'groenewege/vim-less'
    Bundle 'tpope/vim-rails'


To enable a new plugin, simplily add a new line and run `:BundleInstall` from vim or run the following command in shell:

::

    $ vim +BundleInstall! +BundleClean +qall
