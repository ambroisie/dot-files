if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Makefiles should use tabs to indent
setlocal noexpandtab
let b:undo_ftplugin.='|setlocal noexpandtab<'
