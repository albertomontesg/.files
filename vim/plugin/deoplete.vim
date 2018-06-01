" ----- Shougo/deoplete.nvim -----
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=2
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Markers
call deoplete#custom#source('jedi', 'mark', '')
call deoplete#custom#source('file', 'mark', '')
call deoplete#custom#source('vim', 'mark', '')
call deoplete#custom#source('utilsnips', 'mark', '') 

" Set sources
let g:deoplete#sources = {}
let g:deoplete#sources.python = ['jedi', 'file', 'utilsnips']
let g:deoplete#sources.python3 = ['jedi', 'file', 'utilsnips']
let g:deoplete#sources.c = ['clang', 'file', 'utilsnips']
let g:deoplete#sources.cpp = ['clang', 'file', 'utilsnips']
let g:deoplete#sources.vim = ['vim', 'utilsnips']
