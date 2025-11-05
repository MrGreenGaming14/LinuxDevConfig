" BASIC SETUP

" Don't use vi controls
set nocompatible

"Enable syntax and plugins 
syntax enable
filetype plugin on
filetype on
filetype indent on

" Auto update when file is changed externally
set autoread
au FocusGained,BufEnter * silent! checktime

" Set map leader
let mapleader = " "

" Display cursor's current position
set ruler

" Height of cmd bar
set cmdheight=1

" Configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Enable line numbers and relative numbers
set number
set relativenumber

" FINDING FILES:

" Search in subfolders and tab completion
set path+=**

" Display all matching files when tab complete
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Autocomplete by pressing C-x
" To use very basic autocomplete, press C-n
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Highlight cursor line horizontally
set cursorline

" Set settings for things like tabs and shifts
set shiftwidth=4
set tabstop=4
set expandtab " Uses space instead of tab
set smarttab

" Don't let cursor scroll below or above N lines
set scrolloff=10

" Don't wrap lines (Good for readability)
set nowrap

" Highlight matches in a search
set incsearch

" Ignore case sensitivity during search unless a capital letter is used
set ignorecase
set smartcase

" Show the last command you used
set showcmd

" Show the mode you're on
set showmode

" Highlight when doing a search
set hlsearch

" Set commands to save in history
set history=50

" Fold sections of files (Like folding a function)
set foldmethod=indent
autocmd FileType c setlocal foldmethod=syntax

" Colorscheme
colorscheme habamax

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
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

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
