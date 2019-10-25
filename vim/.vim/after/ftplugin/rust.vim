if !exists("b:undo_ftplugin")
    let b:undo_ftplugin=''
endif

" Check tests too
let b:ale_rust_cargo_check_tests=1
let b:undo_ftplugin='|unlet b:ale_rust_cargo_check_tests'

" Check examples too
let b:ale_rust_cargo_check_examples=1
let b:undo_ftplugin='|unlet b:ale_rust_cargo_check_examples'

" Use clippy if it's available instead of just cargo check
let b:ale_rust_cargo_use_clippy=executable('cargo-clippy')
let b:undo_ftplugin='|unlet b:ale_rust_cargo_use_clippy'

" Use rustfmt as ALE fixer for rust
let b:ale_fixers=[ 'rustfmt' ]
let b:undo_ftplugin.='|unlet b:ale_fixers'
