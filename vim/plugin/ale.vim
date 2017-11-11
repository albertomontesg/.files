" ----- w0rp/ale -----
"  Configuration
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
"  Define signs
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'
"  Define fixers for different file types
let g:ale_fixers = {
	\ 'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'json': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'css': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'tex': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'html': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'sh': ['remove_trailing_lines', 'trim_whitespace'],
\}
