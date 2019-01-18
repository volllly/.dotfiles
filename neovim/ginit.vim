" vim-plug
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'gabenespoli/vim-cider-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
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

" Project Drawer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup ENDNERDTree
