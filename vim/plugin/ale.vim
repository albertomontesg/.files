" ----- w0rp/ale -----
"  Configuration
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
"  Define signs
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
"  Define fixers for different file types
let g:ale_fixers = {
        \ 'bash': ['shfmt', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'json': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'css': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
        \ 'coffee': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'tex': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'html': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'sh': ['shfmt', 'remove_trailing_lines', 'trim_whitespace'],
\}

" Customize error sign
highlight clear ALEErrorSign
highlight ALEErrorSign ctermfg=1 ctermbg=18 guifg=#EC5F67 guibg=#2C393F

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" nnoremap <silent> ld :ALEGoToDefinition<CR>
