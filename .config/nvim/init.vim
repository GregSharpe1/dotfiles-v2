"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

source $HOME/.config/nvim/config/general.vim
" Plugins init
source $HOME/.config/nvim/config/plugins.vim
" Vim is nothing without keybindings
source $HOME/.config/nvim/config/keybindings.vim
" NerdTree goodness
source $HOME/.config/nvim/config/nerdtree.vim
" " Coc goodness
source $HOME/.config/nvim/config/coc.vim
" Airline magic
source $HOME/.config/nvim/config/airline.vim
" Flake 8 baby
source $HOME/.config/nvim/config/flake8.vim
" fzf stuff
source $HOME/.config/nvim/config/fzf.vim
" Let's call that lovely theme
source $HOME/.config/nvim/config/theme.vim
" Settings the colour scheme
source $HOME/.config/nvim/config/gitgutter.vim
" Minimap settings
source $HOME/.config/nvim/config/minimap.vim

