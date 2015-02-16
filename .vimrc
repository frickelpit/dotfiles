"
" Vim Config file
"

" Syntax highlighting
filetype plugin on
syntax on

" Basic settings
set title
set number
set history=50
set wildmenu
set wrapscan
set ruler
set hlsearch
set ignorecase
set ttyfast
set ttyscroll=3
set lazyredraw

" Backup files
set nobackup
set nowritebackup
set noswapfile
" setting for mutt
au BufRead /tmp/mutt-* set tw=72
" restore cursor position (taken from the Arch Wiki)
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
