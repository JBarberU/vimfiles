" Run current python script with venv
if has('gui_running')
        nnoremap <buffer> <silent> <leader><leader>r :w !call venv\Scripts\activate.bat & python -<CR><CR>
else
    nnoremap <buffer> <leader><leader>r :w !source venv/bin/activate; python -<CR>
endif
