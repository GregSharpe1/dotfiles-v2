" Make sure NERDTree is showing "Hidden" files
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=40

" If vim is opened with a file don't show NERDTree else, do show
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Make sure nerdtree closes on the end of the last file close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
