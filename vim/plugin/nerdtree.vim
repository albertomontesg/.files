" ----- scrooloose/nerdtree -----
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^.git$', '^.DS_Store$', '^\..*cache.*$', '^.eggs$', '^.*\.egg-info$']
let g:NERDTreeShowHidden = 1

augroup cursor_off_nerdtree
	autocmd!
        autocmd FileType nerdtree setlocal signcolumn=no
	autocmd WinLeave * set nocursorline
	autocmd WinEnter * set cursorline
augroup END
