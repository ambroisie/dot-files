augroup signtoggle
    autocmd!
    " Only show the sign column for the current focused buffer
    autocmd BufEnter,FocusGained,WinEnter * set signcolumn=yes
    autocmd BufLeave,FocusLost,WinLeave   * set signcolumn=no
    " Disable the sign column in terminal
    if exists('##TerminalOpen')
        autocmd TerminalOpen * setlocal signcolumn=no
    elseif has('nvim')
        autocmd TermOpen * setlocal signcolumn=no
    endif
augroup END
