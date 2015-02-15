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


" disable ~/.viminfo
set viminfo=""

" Backup files
set nobackup
set nowritebackup
set noswapfile

if has("autocmd")
	" restore Cursor position
	au BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
	au BufRead /tmp/mutt-* set tw=72
endif
