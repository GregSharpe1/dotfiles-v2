"syntax on
" Let's set some useful things here:
set encoding=UTF-8
set number relativenumber
"set nowrap
set undodir=~/.config/nvim/undodir
set undofile
set cursorline
set clipboard=unnamedplus
set nobackup
set nowritebackup
set noswapfile
set cmdheight=2
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
filetype plugin indent on

" Make sure windows are opened properly
set splitright
set splitbelow

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Syntax highlighting in Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy
