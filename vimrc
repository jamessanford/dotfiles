let loaded_matchparen = 1
" NoMatchParen
" DoMatchParen

set hlsearch
set ruler
set history=5000
set undolevels=5000
set nomodeline
set cpo+=v$

" use ':syntax enable' to enable
syntax off
"set syntax=OFF

" http://vimhelp.appspot.com/filetype.txt.html#filetypes
" (plugin, indent, plugin indent)
filetype off
"set noautoindent
"set nocindent
"set nosmartindent

" maybe a way to run "nohl" instead
nnoremap <F2> :set hls!<bar>set hls?<CR>
nnoremap <F3> :set nu!<bar>set nu?<CR>
nnoremap <silent> <F7> :if exists("g:syntax_on")<bar>syntax off<bar>else<bar>syntax enable<bar>endif<CR>

" turn off 'insert what was last inserted' key, as I hit it by accident.
noremap! <C-A> <Nop>

" ctermfg=black ctermbg=magenta
hi Search term=reverse ctermfg=yellow ctermbg=black guibg=Yellow
