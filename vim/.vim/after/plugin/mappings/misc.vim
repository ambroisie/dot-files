" Yank until the end of line with Y, to be more consistent with D and C
nnoremap Y y$

" Edit my vimrc in the current buffer
nnoremap <Leader>ev :edit $MYVIMRC<CR>
" Source my vimrc
nnoremap <Leader>es :source $MYVIMRC<CR>
" Source the current buffer
nnoremap <Leader>et :source %<CR>

" Easier escape from insert mode
inoremap jkj <Esc>
inoremap kjk <Esc>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <Leader>m :silent! :make! \| :redraw!<CR>

" Remove search-highlighting
noremap <Leader><Leader> :nohls<CR>
