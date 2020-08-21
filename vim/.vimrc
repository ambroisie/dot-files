" Basic configuraion {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't try to be compatible with Vi
set nocompatible
" Use UTF-8
set encoding=utf-8
set fileencodings=utf-8

" Allow unsaved buffers when switching windows
set hidden

" Allow command completion in command-line
set wildmenu

" Enable syntax high-lighting and file-type specific plugins
syntax on
filetype plugin indent on
" }}}

" Indentation configuration {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use space by default
set expandtab
" Indent and align to 4 spaces by default
set shiftwidth=4
" -1 means the same as shiftwidth
set softtabstop=-1
" Always indent by multiples of shiftwidth
set shiftround
" You shouldn't change the default tab width of 8 characters
set tabstop=8
" }}}

" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install with :PlugInstall

" FIXME: At some point I'll need to switch over to the native Vim 8.0 package
" feature. Either via manual git subtree management, or maybe through minpac?
"
" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    silent! execute '!mkdir -p ~/.vim/plugged'
    silent! execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    silent! execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Theming {{{
"""""""""
" Nice dark theme
Plug 'nanotech/jellybeans.vim'
" Another nice dark theme
Plug 'morhetz/gruvbox'
" Simpler gruvbox
Plug 'lifepillar/vim-gruvbox8'
" Yet another nice dark theme
Plug 'jonathanfilip/vim-lucius'
" More dark colorschemes
Plug 'joshdick/onedark.vim'
" And even more
Plug 'rakr/vim-one'
" And another one
Plug 'junegunn/seoul256.vim'
" Fancy status bar
Plug 'itchyny/lightline.vim'
" Simplistic dark theme
Plug 'axvr/photon.vim'
" Another dark theme
Plug 'haishanh/night-owl.vim'
" }}}

" Minimum viable vim config {{{
"""""""""""""""""""""""""""
" Basic default vimrc file
Plug 'tpope/vim-sensible'
" High-light trailing whitespace
Plug 'ntpeters/vim-better-whitespace'
" }}}

" Program/language specific {{{
"""""""""""""""""""""""""""
" Pandoc syntax file
Plug 'vim-pandoc/vim-pandoc-syntax'
" Pandoc commands
Plug 'vim-pandoc/vim-pandoc'
" A sane git syntax file
Plug 'tpope/vim-git'
" An awesome git wrapper
Plug 'tpope/vim-fugitive'
" Show git messages in preview window
Plug 'rhysd/git-messenger.vim'
" Pre-written functions for fzf mappings
Plug 'junegunn/fzf.vim'
" Rust syntax, folding, compiler etc...
Plug 'rust-lang/rust.vim'
" A better GNU Info reader than info
Plug 'HiPhish/info.vim', { 'on': 'Info' }
" Nix configuration files
Plug 'LnL7/vim-nix'
" TOML files
Plug 'cespare/vim-toml'
" Beancount fiels
Plug 'nathangrigg/vim-beancount'
" Jsonnet files
Plug 'google/vim-jsonnet'
" Tmux configuration file
Plug 'tmux-plugins/vim-tmux'
" }}}

" Vim facilities enhancement {{{
""""""""""""""""""""""""""""
" A better netrw
Plug 'tpope/vim-vinegar'
" Better quick-fix window
Plug 'romainl/vim-qf'
" Better folding
Plug 'Konfekt/FastFold'
" A nice little cheat-sheet
Plug 'lifepillar/vim-cheat40'
" UNIX integration
Plug 'tpope/vim-eunuch'
" Readline mappings
Plug 'tpope/vim-rsi'
" }}}

" Mappings {{{
""""""""""
" Easily delete, change and add surroundings in pairs
Plug 'tpope/vim-surround'
" Better repeatability with the '.' key
Plug 'tpope/vim-repeat'
" Some ex command mappings
Plug 'tpope/vim-unimpaired'
" Super-powered increment/decrement
Plug 'tpope/vim-speeddating'
" }}}

" Snippets {{{
""""""""""
" Snippet manager
Plug 'SirVer/ultisnips'
" Snippet files for Ulti Snips
Plug 'honza/vim-snippets'
" }}}

" LSP {{{
"""""
" Asynchronous Linting Engine
Plug 'dense-analysis/ale'
" Pre-made ALE integration with lightline
Plug 'maximbaz/lightline-ale'
" }}}

call plug#end()
" }}}

" File parameters {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable backups, we have source control for that
set nobackup
" Disable swapfiles too
set noswapfile
" }}}

" UI and UX parameters {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the minimal amount of lignes under and above the cursor for context
set scrolloff=5
" Always show status line
set laststatus=2
" Enable Doxygen highlighting
let g:load_doxygen_syntax=1
" Make backspace behave as expected
set backspace=eol,indent,start
" Use the visual bell instead of beeping
set visualbell
" Disable bell completely by resetting the visual bell's escape sequence
set t_vb=

" Color the 80th column
set colorcolumn=80
" Show whitespace
set list
" Show a tab as an arrow, trailing spaces as ¤, non-breaking spaces as dots
set listchars=tab:>─,trail:·,nbsp:¤

" Don't redraw when executing macros
set lazyredraw

" Timeout quickly on shortcuts, I can't wait two seconds to delete in visual
set timeoutlen=500

" Set dark mode by default
set background=dark

" Use onedark
silent! colorscheme onedark
" }}}

" Search parameters {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable search high-lighting while the search is on-going
set hlsearch
" Ignore case on search
set ignorecase
" Ignore case unless there is an uppercase letter in the pattern
set smartcase
" }}}

" Import settings when inside a git repository {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let git_settings=system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif
" }}}

" vim: foldmethod=marker
