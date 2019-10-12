" Use shfmt as ALE fixer for sh
let b:ale_fixers=[ 'shfmt' ]

" Indent with 4 spaces, simplify the code, indent switch cases, use POSIX
let b:ale_sh_shfmt_options='-i 4 -s -ci -ln posix'

" Require explicit empty string test
let b:ale_sh_shellcheck_options='-o avoid-nullary-conditions'
