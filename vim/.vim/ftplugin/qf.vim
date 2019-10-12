" Use h/l to go to the previous/next non-empty quickfix or location list
nnoremap <silent> <buffer> h :call quickfixed#older()<CR>
nnoremap <silent> <buffer> l :call quickfixed#newer()<CR>

" Use left/right to go to the previous/next non-empty quickfix or location list
nnoremap <silent> <buffer> <Left> :call quickfixed#older()<CR>
nnoremap <silent> <buffer> <Right> :call quickfixed#newer()<CR>
