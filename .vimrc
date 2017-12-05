if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" Tab-completion in searching with /
NeoBundle 'SearchComplete'
" Status line
NeoBundle 'vim-airline/vim-airline'
" Show lines for indentation level
NeoBundle 'Yggdroot/indentLine'
" Autocomplete delimiters
NeoBundle 'Raimondi/delimitMate'
" Fast folds
NeoBundle 'Konfekt/fastfold'
" Support .editorconfig files
NeoBundle 'editorconfig/editorconfig-vim'
" Rust-specific stuff
NeoBundle 'rust-lang/rust.vim'
" Asynchronous Lint Engine
NeoBundle 'w0rp/ale'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Done with the NeoBundle stuff.

" Basic configuration stuff
set nocompatible
set t_Co=256
set modeline

" Relative line numbers, and absolute line number on current line.
set rnu
set nu

colorscheme vividchalk

" Show 81 and 101-column marks
set textwidth=100
set colorcolumn=81,101

" Tab configuration
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" Fold stuff
set foldmethod=syntax

" Misc. stuff
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set history=1000
set noswapfile
set wildmenu
set title
" Show matching brackets/parens.
set showmatch
" Set backspace behavior, see :help bs
set bs=2
" Don't wrap text
set nowrap
" Maybe I don't want this?
set shiftround

" Filetype fun
filetype on
filetype plugin indent on
syntax on

au FileType python set foldmethod=indent
au FileType python set foldlevel=99
au FileType awk let b:delimitMate_quotes=""

" Keybindings
nnoremap <Leader>n :ALENextWrap<CR>
nnoremap <Leader>p :ALEPreviousWrap<CR>

" Plugin-specific options
" Bufferline
let g:bufferline_echo = 0
set statusline=%{bufferline#generate_string()}
set laststatus=2
