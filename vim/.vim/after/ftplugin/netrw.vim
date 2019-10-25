if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Don't show Netrw in buffer list
setlocal bufhidden=delete
let b:undo_ftplugin='|setlocal bufhidden<'
