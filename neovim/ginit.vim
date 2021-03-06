" vim-plug
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'PProvost/vim-ps1'

call plug#end()

" gruvbox theme config
colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'

" editor config
set number      " show number line
set fcs=eob:\   " remove tilde on eob
set noshowmode
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
GuiFont! PragmataPro Mono Liga
GuiTabline 0
set clipboard^=unnamed,unnamedplus " use system clipboard

set shell=C:/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe
set shellpipe=|
set shellquote="
set shellxquote="
set shellredir=>
set shellcmdflag=\ -NoLogo\ -NoProfile\ -NonInteractive\ -Command

let g:deoplete#enable_at_startup=1

:command WQ wq
:command Wq wq
:command W w
:command Q q

let NERDTreeMinimalUI=1
cd ~/
map <silent> - :NERDTree<return>
NERDTree

