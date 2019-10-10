" Use my desired ALE fixers for python
let b:ale_fixers=[ 'black', 'isort' ]
" Use my desired ALE linters for python
let b:ale_linters=[ 'flake8', 'mypy', 'pylint', 'pyls' ]

" Disable pycodestyle checks from pyls because I'm already using flake8
let b:ale_python_pyls_config={
  \     'pyls': {
  \         'plugins': {
  \             'pycodestyle': {
  \                 'enabled': v:false
  \             },
  \         },
  \     },
  \  }

" Change max length of a line to 88 for this buffer to match black's settings
setlocal colorcolumn=88
