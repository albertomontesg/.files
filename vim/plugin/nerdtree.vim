" ----- scrooloose/nerdtree -----
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

augroup cursor_off_nerdtree
	autocmd!
        autocmd FileType nerdtree setlocal signcolumn=no
	autocmd WinLeave * set nocursorline
	autocmd WinEnter * set cursorline 
augroup END
