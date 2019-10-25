if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Use my desired ALE fixer for D
let b:ale_fixers=[ 'dfmt' ]
let b:undo_ftplugin.='|unlet b:ale_fixers'
