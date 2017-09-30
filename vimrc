let loaded_matchparen = 1
" NoMatchParen
" DoMatchParen

" use gpg1 on archlinux
let g:GPGExecutable = "gpg1"

set hlsearch
set noincsearch
set ruler
set history=5000
set undolevels=5000
set nomodeline
set cpo+=v$

set bg=light

" http://vimhelp.appspot.com/filetype.txt.html#filetypes
" (plugin, indent, plugin indent)
filetype off
"set noautoindent
"set nocindent
"set nosmartindent

" maybe a way to run "nohl" instead
nnoremap <F2> :set hls!<bar>set hls?<CR>
nnoremap <F3> :set nu!<bar>set nu?<CR>
nnoremap <F5> :set invrelativenumber<CR>
nnoremap <silent> <F7> :if exists("g:syntax_on")<bar>syntax off<bar>else<bar>syntax enable<bar>endif<CR>

" turn off 'insert what was last inserted' key, as I hit it by accident.
noremap! <C-A> <Nop>

" ctermfg=black ctermbg=magenta
hi Search term=reverse ctermfg=yellow ctermbg=black guibg=Yellow

" use ':syntax enable' to enable
if exists("vimpager")
  syntax enable
else
  syntax off
endif
"set syntax=OFF
