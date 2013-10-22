"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the personal vim config used by LxYu.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle "gmarik/vundle"

" Enable plugins
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'SirVer/ultisnips'
Bundle 'Townk/vim-autoclose'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'kien/ctrlp.vim'
Bundle 'lxyu/snipmate-snippets'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/zencoding-vim'
Bundle 'mileszs/ack.vim'
Bundle 'othree/html5.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'saltstack/salt-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sprsquish/thrift.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/nagios-syntax'
Bundle 'vim-scripts/nginx.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
set nocompatible               " must be first line
set background=dark            " Assume a dark background

" General
syntax on                      " syntax highlighting
set fencs=utf-8,gb2312,gbk     " Sets the default encoding
set background=dark            " Assume a dark background
filetype plugin indent on      " Automatically detect file types.
set autochdir                  " always switch to the current file directory.
set clipboard=unnamed          " use system clipboard

set nospell                    " spell checking off
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore        " allow for cursor beyond last character
set history=1000               " Store a ton of history (default is 20)

set noswapfile
set backup                     " backups are nice ...
set backupdir=~/.vim/backup
set undofile                   " persistent undo
set undolevels=1000            " maximum number of changes that can be undone
set undoreload=10000           " maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif"


" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    if filereadable(expand("~/.vim/bundle/vim-colorschemes/colors/jellybeans.vim"))
        colorscheme jellybeans
    endif
    set guifont=Monaco:h12     " set gui font
    set guioptions-=T          " remove the toolbar
    set guioptions-=L          " remove the left scrollbar
    set guioptions-=r          " remove the right scrollbar
else
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        color solarized                    " load a colorscheme
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
    endif
    set term=builtin_xterm         " Make terminal stuff works
    set t_Co=256
endif

set tabpagemax=15              " only show 15 tabs
set showmode                   " display the current mode
set showcmd                    " show partial commands in status line and selected characters/lines in visual mode

set ruler                      " show the ruler
set cursorline                 " highlight current line
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor

set laststatus=2               " always show statusline
set backspace=indent,eol,start " Backspace for dummys
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present

set wildmenu                   " Show a navigable menu for tab completion
set wildmode=longest,list,full

set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set nofoldenable               " Disable fold code
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change

set list                                         " Show trailing whitespace
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap          " wrap long lines
set lbr           " set linebreak
set tw=0          " sets the text width
set ai            " Auto indent
set si            " Smart indent
set expandtab     " tabs are spaces, not tabs
set shiftwidth=4  " use indents of 4 spaces
set tabstop=4     " an indentation every four columns
set softtabstop=4 " let backspace delete indent
" Remove trailing whitespaces and ^M chars
"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','

" Fast editing of the .vimrc
map <leader>v :e ~/.vimrc<cr>

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Remap VIM 0
map 0 ^

" lazy press <ESC>
inoremap jk <Esc>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Paste mode toggle
map <leader>pp :setlocal paste!<cr>

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" Close the current buffer
map <leader>d :Bclose<cr>

" Close all the buffers
map <leader>D :1,300 bd<cr>:q<cr>

" Use the arrows to something usefull
map <right> :bn!<cr>
map <left> :bp!<cr>

map <C-right> :tabnext<cr>
map <C-left> :tabprevious<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" The following two lines conflict with moving to top and bottom of the
" screen
" If you prefer that functionality, comment them out.
map <S-H> gT
map <S-L> gt

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map  [F $
imap [F $
map  [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Save and return to normal mode on FocusLost
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
    let g:NERDShutUp=1
    let b:match_ignorecase = 1

" OmniComplete
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
    endif

    hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Ack.vim
    nmap <leader>a :Ack
    if executable('ag')
        let g:ackprg = 'ag --nogroup --column'

        " Use Ag over Grep
        set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif

" Ctags
    set tags=./tags;/,~/.vimtags

" NerdTree
    map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    "let NERDTreeShowBookmarks=1
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store', '__pycache__', '\.egg-info$']
    let NERDTreeShowHidden=1

" UltiSnips
    au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"

" Tabularize {
    if exists(":Tabularize")
      nmap <leader>a= :Tabularize /=<CR>
      vmap <leader>a= :Tabularize /=<CR>
      nmap <leader>a: :Tabularize /:<CR>
      vmap <leader>a: :Tabularize /:<CR>
      nmap <leader>a:: :Tabularize /:\zs<CR>
      vmap <leader>a:: :Tabularize /:\zs<CR>
      nmap <leader>a, :Tabularize /,<CR>
      vmap <leader>a, :Tabularize /,<CR>
      nmap <leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <leader>a<Bar> :Tabularize /<Bar><CR>

      " The following function automatically aligns when typing a
      " supported character
      inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

      function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
              let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
              let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
              Tabularize/|/l1
              normal! 0
              call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
      endfunction

    endif

" Session List
    set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>

" Ctrlp
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <CR> :CtrlPBuffer<CR>
    nnoremap <C-u> :CtrlPMRU<CR>
    nnoremap <C-e> :CtrlPClearCache<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|build$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.DS_Store$\|\.pyc$\|__pycache__' }

" Tagbar
    nnoremap <silent> <leader>t :TagbarToggle<CR>

" Fugitive
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>

" Gitgutter
    nmap <leader>g :GitGutterToggle<CR>
    let g:gitgutter_enabled = 0

" Syntastic
    let g:syntastic_check_on_open=1
    let g:syntastic_auto_jump=1

" Powerline
    let g:Powerline_symbols = 'fancy'

" YCM
    " Show completion menu even when typing inside comments
    let g:ycm_complete_in_comments = 1
    " Add preview string to vim's completeopt option
    let g:ycm_add_preview_to_completeopt = 1
    " Auto close preview window after user accepts the offered completion string
    let g:ycm_autoclose_preview_window_after_completion = 1
    nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nginx
    autocmd BufRead,BufNewFile /etc/nginx/* set filetype=nginx
    autocmd BufRead,BufNewFile /usr/local/etc/nginx/* set filetype=nginx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Fixes
    autocmd FileType css,less,javascript,php,puppet,yaml set shiftwidth=2
    autocmd FileType css,less,javascript,php,puppet,yaml set tabstop=2
    autocmd FileType css,less,javascript,php,puppet,yaml set softtabstop=2

" Python
    " Highlight 80 column
    autocmd FileType python set cc=80

" Less
    autocmd BufRead,BufNewFile *.less set filetype=less

" Thrift
    autocmd BufRead,BufNewFile *.thrift set filetype=thrift

" Puppet
    autocmd BufRead,BufNewFile *.pp set filetype=puppet

" Jinja
    autocmd BufRead,BufNewFile *.jinja set filetype=jinja


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Funtion define
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search selection
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Close buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Get paste status
function! HasPaste()
  if &paste
      return 'PASTE MODE  '
  else
      return ''
  endif
endfunction

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END

" UltiSnips Complete
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif
