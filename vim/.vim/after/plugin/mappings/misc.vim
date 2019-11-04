" Yank until the end of line with Y, to be more consistent with D and C
nnoremap Y y$

" Mappings for working with vimrc
nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>es :source $MYVIMRC<CR>
nnoremap <Leader>et :source %<CR>

" Easier escape from insert mode
inoremap jkj <Esc>
inoremap kjk <Esc>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <Leader>m :silent! :make! \| :redraw!<CR>

" Remove search-highlighting
noremap <Leader><Leader> :nohls<CR>

" Explicit map for vim-cheat40 which seems to fail because of my <Nop> map
map <Leader>? :<C-u>Cheat40<CR>
