" line settings things
set number
set nowrap

" a tab is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" disable swapfiles
set nobackup
set nowritebackup
set noswapfile

" disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" keymappings
nnoremap <CR> :noh<return><ESC>
