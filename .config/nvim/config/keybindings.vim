:let mapleader="\<Space>"

nnoremap <silent> <leader>w :w<CR>
" nnoremap <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <silent> <leader>Q :qall!<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <leader>e :e
" Remove highlighted text when using "/" to search
nnoremap <silent> <leader>/ :noh<CR>

nnoremap <leader>m :set mouse=a<CR>
" Let's try some NERDTree to start
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>nv :NERDTreeFind<CR>

" nvim editing helpers
nnoremap <silent> <leader>ss :source ~/.config/nvim/init.vim<CR>

" Launch a terminal
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>ttv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>tth :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q

" Lets make moving between windows easier
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>L :vnew<CR>
nnoremap <silent> <leader>H :new<CR>

nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>vh :split<CR>

" Swapping windows
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <leader>W :call WindowSwap#EasyWindowSwap()<CR>

" Plug manager
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>

" Disable arrow movement, resize splits instead.
let g:elite_mode=1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif

" fzf
nnoremap <silent> <leader>f :Files<CR>

" Some Git alias
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gP :Gpush<CR>
nnoremap <silent> <leader>gp :Gpull<CR>
nnoremap <silent> <leader>gdm :Gdiffsplit master<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <leader>gck :GCheckout<CR>


" Search with :Ag
nnoremap <leader>se :NERDTreeClose<CR>:Ag
nnoremap <leader>ag :NERDTreeClose<CR>:Ag

nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
" Coc stuff
nnoremap <leader>clm :CocList marketplace<CR>
nnoremap <leader>cl :CocList<CR>

" Rename the currently selected var
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>cs :CocSearch

vnoremap <c-f> y<ESC>/<c-r>"<CR>
nmap <silent>e[ <Plug>(coc-diagnostic-prev)
nmap <silent>e] <Plug>(coc-diagnostic-next)

nnoremap <leader>ee :e $HOME/.config/nvim<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Flake8 magic
nnoremap <silent> <leader>pf :PyFlake<CR>
nnoremap <silent> <leader>pfa :PyFlakeAuto<CR>
