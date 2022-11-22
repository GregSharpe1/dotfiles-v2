call plug#begin('~/.config/.nvim/plugged')

" Utility stuff init
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'stsewd/fzf-checkout.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'wfxr/minimap.vim'
" https://github.com/wesQ3/vim-windowswap
Plug 'wesQ3/vim-windowswap'

" Some Intellisense w/ LSP servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Some git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Show us what File we're in
Plug 'vim-airline/vim-airline'

" Let's install a theme or two
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'

" Terraform
Plug 'hashivim/vim-terraform'

" Apparently this has to be loaded last
Plug 'ryanoasis/vim-devicons'

" Rusty
Plug 'rust-lang/rust.vim'

" Kubernetes stuff
Plug 'andrewstuart/vim-kubernetes'

Plug 'itspriddle/vim-shellcheck'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'andviro/flake8-vim'

" Writing
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

" Let's get good at Vim
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Arduino
Plug 'stevearc/vim-arduino'

call plug#end()
