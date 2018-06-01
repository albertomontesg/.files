" ----- lervag/vimtex -----
"  Continuous compilation
if has('nvim')
        let g:vimtex_compiler_progname = 'nvr'
endif
" let g:vimtex_compiler_latexmk = {
"         \ 'callback' : 1,
"         \ 'continuous' : 1,
"         \ 'executable' : 'latexmk',
" \}
let g:vimtex_latexmk_continuous = 1
let g:vimtex_fold_enable = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_method = 'pulp'
