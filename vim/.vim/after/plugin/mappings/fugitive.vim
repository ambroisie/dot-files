" Visual bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

" Git add current file
nnoremap <Leader>ga :Git add %:p<CR><CR>
" Open status window
nnoremap <Leader>gs :Gstatus<CR>
" Open diff view of current buffer: the up/left window is the current index
nnoremap <Leader>gd :Gdiffsplit!<CR>
" Open current file log in new tab, populate its location list with history
nnoremap <Leader>gl :sp<CR><C-w>T:Gllog --follow -- %:p<CR>
" Open a buffer to the left with blame information
nnoremap <Leader>gb :Gblame<CR>
" Commit staged changes, open a new tab just for it
nnoremap <Leader>gc :Gcommit -v -q<CR>
