" Create the `b:undo_ftplugin` variable if it doesn't exist
call ftplugined#check_undo_ft()

" Disable the prompt to delete whitespace
DisableStripWhitespaceOnSave
let b:undo_ftplugin.='|EnableStripWhitespaceOnSave'
