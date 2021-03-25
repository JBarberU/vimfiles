" Run current python script with venv
if has('gui_running')
        nnoremap <buffer> <silent> <leader><leader>r :echo 'Not implemented for gvim'<CR><CR>
else
    nnoremap <buffer> <leader><leader>r :w !cargo run<CR>
endif
