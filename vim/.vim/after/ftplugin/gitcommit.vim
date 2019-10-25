if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Enable spell checking on commit messages
setlocal spell
let b:undo_ftplugin.='|setlocal spell<'
