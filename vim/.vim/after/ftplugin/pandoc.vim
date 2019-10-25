if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Let ALE know that I want Markdown linters
let b:ale_linter_aliases=[ 'markdown' ]
let b:undo_ftplugin.='|unlet b:ale_linter_aliases'
