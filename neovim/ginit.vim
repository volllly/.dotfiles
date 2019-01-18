" vim-plug
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'gabenespoli/vim-cider-vinegar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

call plug#end()

" gruvbox theme config
colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" editor config
set number      " show number line
set fcs=eob:\   " remove tilde on eob
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
GuiFont! PragmataPro Mono Liga
GuiTabline 0
set clipboard^=unnamedplus " use system clipboard
cd ~/
NERDTree
