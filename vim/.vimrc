" FIXME: put all this in .vim folder and import them on a per-file basis

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic configuraion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't try to be compatible with Vi
set nocompatible
" Use UTF-8
set encoding=utf-8
set fileencodings=utf-8

" Use space by default
set expandtab
" Indent and align to 4 spaces by default
set shiftwidth=4
" -1 means the same as shitwidth
set softtabstop=-1
" Always indent by multiples of shiftwidth
set shiftround
" You shouldn't change the default tab width of 8 characters
set tabstop=8
" Makefiles should use tabs to indent
autocmd Filetype make setlocal noexpandtab

" Enable search high-lighting while the search is on-going
set hlsearch
" Color the 80th column
set colorcolumn=80
" Show whitespace
set list listchars=tab:»·,trail:·

" Enable syntax high-lighting
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install with :PlugInstall

" FIXME: At some point I'll need to switch over to the native Vim 8.0 package
" feature. Either via manual git subtree management, or maybe through minpac?
"
" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Theming
"""""""""
" Nice dark theme
Plug 'nanotech/jellybeans.vim'
" Another nice dark theme
Plug 'morhetz/gruvbox'
" Fancy status bar
Plug 'vim-airline/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'

" Minimum viable vim config
"""""""""""""""""""""""""""
" Basic default vimrc file
Plug 'tpope/vim-sensible'
" High-light trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Program specific plug-ins
"""""""""""""""""""""""""""
" Pandoc syntax file
Plug 'vim-pandoc/vim-pandoc-syntax'
" Pandoc commands
Plug 'vim-pandoc/vim-pandoc'
" A sane git syntax file
Plug 'tpope/vim-git'
" An awesome git wrapper
Plug 'tpope/vim-fugitive'
" Tag management
Plug 'ludovicchabant/vim-gutentags'
" Handling multiple cscopes for gutentags
Plug 'skywind3000/gutentags_plus'
" Fuzzy file finder (installs zfz system-wide)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Pre-written functions for fzf mappings
Plug 'junegunn/fzf.vim'

" Vim facilities enhancement
""""""""""""""""""""""""""""
" Relative numbers only on focused buffer
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" A better netrw
Plug 'tpope/vim-vinegar'
" Better quick-fix window
Plug 'romainl/vim-qf'

" Mappings
""""""""""
" Easily delete, change and add surroundings in pairs
Plug 'tpope/vim-surround'
" Better repeatability with the '.' key
Plug 'tpope/vim-repeat'
" Some ex command mappings
Plug 'tpope/vim-unimpaired'

" Snippets
""""""""""
" Snippet manager
Plug 'SirVer/ultisnips'
" Snippet files for Ulti Snips
Plug 'honza/vim-snippets'

call plug#end()
-
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File parameters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable backups, we have source control for that
set nobackup
" Disable swapfiles too
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI and UX parameters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the minimal amount of lignes under and above the cursor for context
set scrolloff=5
" Show line number (needed for number toggle)
set number
" Always show status line
set laststatus=2
" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

" Make backspace behave as expected
set backspace=eol,indent,start
" Disable bell completely
set visualbell
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search parameters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case on search
set ignorecase
" Ignore case unless there is an uppercase letter in the pattern
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin parameters
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BetterWhitespace settings
"""""""""""""""""""""""""""
" Enable trailing whitespace high-lighting
let g:better_whitespace_enabled=1
" Strip trailing whitespace on file-save
let g:strip_whitespace_on_save=1

" GutenTags settings
""""""""""""""""""""
" Enable gutentags
let g:gutentags_enabled=1
" enable gtags module
let g:gutentags_modules=['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root=['.root', 'Makefile']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir=expand('~/.cache/tags')
" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope=0

" Theme settings
""""""""""""""""
" Use a slightly darker background color to differentiate with the status line
let g:jellybeans_background_color_256='232'
" colorscheme jellybeans
" colorscheme jellybeans

" Set dark mode by default
set background=dark
let g:gruvbox_contrast_dark='(hard)'
" Enable italics because urxvt supports them
let g:gruvbox_italic=1
colorscheme gruvbox

" UltiSnips settings
""""""""""""""""""""
" Insert mode trigger for expansion
let g:UltiSnipsExpandTrigger="<Tab>"
" Jump forward and backwards in place-holder list with Ctrl-f and Ctrl-b
let g:UltiSnipsJumpBackwardTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
" Split the windowd vertically when callin :UltiSnipsEdits
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous mappings
""""""""""""""""""""""""
" Yank until the end of line with Y, to be more consistent with D and C
nnoremap Y y$

" Map leader to space (needs the noremap trick)
nnoremap <Space> <Nop>
let mapleader=" "

" Mappings for working with this file.
map <Leader>ev :edit $MYVIMRC<CR>
map <Leader>es :source $MYVIMRC<CR>

" Run make silently, then skip the 'Press ENTER to continue'
noremap <Leader>m :silent! :make! \| :redraw!<CR>

" Mapping for quickfix bindings
"""""""""""""""""""""""""""""""
" Next and previous in quick-fix list
nmap <Leader>fn <Plug>(qf_qf_next)
nmap <Leader>fp <Plug>(qf_qf_previous)
" Next and previous in location list
nmap <Leader>ln <Plug>(qf_loc_next)
nmap <Leader>lp <Plug>(qf_loc_previous)
" Toggle quick-fix and location lists
nmap <Leader>tf <Plug>(qf_qf_toggle)
nmap <Leader>tl <Plug>(qf_loc_toggle)

" Fuzzy file finder bindings
""""""""""""""""""""""""""""
" Only git-tracked files, Vim needs to be in a Git repository
nmap <Leader>fg :GFiles<CR>
" All files
nmap <Leader>ff :Files<CR>
" Currently open buffers
nmap <Leader>fb :Buffers<CR>
" Buffer history
nmap <Leader>fh :History<CR>
" Tags in buffer
nmap <Leader>ft :BTags<CR>
" Tags in all project files
nmap <Leader>fT :Tags<CR>

" Git and diff mappings
"""""""""""""""""""""""
" Visual bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>
" Git add current file
nnoremap <Leader>ga :Git add %:p<CR><CR>
" Open status window
nnoremap <Leader>gs :Gstatus<CR>
" Open diff view of current buffer: the up/left window is the current index
nnoremap <Leader>gd :Gdiffsplit!<CR>
" Open current file log in new tab, populate its location list with history
nnoremap <Leader>gl :sp<CR><C-w>T:Gllog --follow -- %:p<CR>
" Use git-mv and rename the buffer, backspace and add '!' to use the '-f' flag
nnoremap <Leader>gm :Gmove<Space>
" Open a buffer to the left with blame information
nnoremap <Leader>gb :Gblame<CR>
" Commit staged changes, open a new tab just for it
nnoremap <Leader>gc :Gcommit -v -q<CR>
" Invoke git-push with arguments, populate quick-fix list
nnoremap <Leader>gpu :Gpush<Space>
" Invoke git-pull with arguments, populate quick-fix list
nnoremap <Leader>gpl :Gpull<Space>
" Invoke git-merge with arguments, populate quick-fix list
nnoremap <Leader>gm :Gmerge<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show ctags and cscopes generation in status line
set statusline+=%{gutentags#statusline()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Import settings when inside a git repository
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let git_settings=system("git config --get vim.settings")
if strlen(git_settings)
    exe "set" git_settings
endif
