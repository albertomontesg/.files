" ----- itchyny/lightline.vim -----
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {
        \ 'buffers': 'lightline#bufferline#buffers',
        \ 'linter_checking': 'lightline#ale#checking',
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
        \ 'asyncrun_status': 'lightline#asyncrun#status',
        \ }
let g:lightline.component_type   = {
        \ 'buffers': 'tabsel',
        \ 'linter_checking': 'left',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
        \ 'linter_ok': 'left',
        \ }
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline.active = {
\ 'right': [
\ 	['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
\	['percent', 'lineinfo'],
\	['fileformat', 'fileencoding', 'filetype'],
\       ['asyncrun_status']
\ ]}
" Lightline ALE indicators
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" Lightline AsyncRun indicators
let g:lightline#asyncrun#indicator_run = "\uf110"
let g:lightline#asyncrun#indicator_none = " "

" Change buffers mapping
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
