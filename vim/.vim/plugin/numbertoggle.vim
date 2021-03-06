" Idea for toggling taken from jeffkreeftmeijer

" Show line numbers
set number

augroup numbertoggle
    autocmd!
    " Toggle numbers between relative and absolute when changing buffers
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
    " Disable line numbers and relative line numbers in terminal
    if exists('##TerminalOpen')
        autocmd TerminalOpen * setlocal nonu nornu
    elseif has('nvim')
        autocmd TermOpen * setlocal nonu nornu
    endif
augroup END
