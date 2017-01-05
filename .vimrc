"
" Vim Config file
"

" Syntax highlighting
filetype plugin on
colorscheme monokai
syntax enable
set term=screen-256color

" Basic settings
set t_Co=256
set showmatch
set title
set number
set history=50
set wildmenu
set ruler
set hlsearch
set ignorecase
set ttyfast
set ttyscroll=3
set lazyredraw
set cursorline
set viminfo="NONE"
set pastetoggle=<F2>

" enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F

" Backup files
set nobackup
set nowritebackup
set noswapfile

" Statusline
set laststatus=2
set statusline=\ [%n]\ %f\ %m%r%h\ %y\           " buffer filename flags type
set statusline+=%#error#                         " change color
set statusline+=%{TrailingSpaceWarning()}        " trailing spaces
set statusline+=%*                               " reset color
set statusline+=%=                               " goto right hand side
set statusline+=%#warningmsg#                    " change color
set statusline+=%{&ff!='unix'?'['.&ff.']':''}    " display file format if it's not unix
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''} "display encoding if it's not utf-8
set statusline+=%*\                              " reset color
set statusline+=%l/%L,\ %-4v                     " line/total lines , column

" restore cursor position (taken from the Arch Wiki)
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" recheck trailing spaces and indent when saving files
augroup vimrc
  autocmd BufWritePost * unlet! b:trailing_space_warning
augroup END

" Check trailing spaces for statusline
function! TrailingSpaceWarning()
   if !exists("b:trailing_space_warning")
      if search('\s\+$', 'nw') != 0
	let b:trailing_space_warning = '[trailing]'
      else
        let b:trailing_space_warning = ''
      endif
   endif
   return b:trailing_space_warning
endfunction

" YAML support
" ------------
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml
