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
" Dark-powered asynchronous completions!
NeoBundle 'Shougo/deoplete.nvim'
" Asynchronous Lint Engine
NeoBundle 'dense-analysis/ale'
" Rust-specific stuff
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'sebastianmarkow/deoplete-rust'
" GLSL-specific stuff
NeoBundle 'tikhomirov/vim-glsl'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Done with the NeoBundle stuff.

" Basic configuration stuff
set nocompatible
if has('nvim')
    set termguicolors
else
    set t_Co=256
endif
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

au FileType python setlocal foldmethod=indent
au FileType python setlocal foldlevel=99
au FileType awk let b:delimitMate_quotes=""
au FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 foldmethod=indent

" Keybindings
let mapleader="\\"
nmap <Leader>n <Plug>(ale_next_wrap)
nmap <Leader>p <Plug>(ale_previous_wrap)
nmap <Leader>d :ALEGoToDefinition<CR>

au filetype rust nmap <buffer> gd <Plug>DeopleteRustGoToDefinitionSplit
au filetype rust nmap <buffer> K <Plug>DeopleteRustShowDocumentation

" Plugin-specific options
" Bufferline
let g:bufferline_echo = 0
set statusline=%{bufferline#generate_string()}
set laststatus=2
" ALE
if executable('rls')
    let g:ale_linters = { 'rust': ['rls'] }
endif
" Deoplete
let g:deoplete#enable_at_startup = 1
if executable('racer')
    let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
endif
if executable('rustc')
    let rust_sysroot = systemlist('rustc --print sysroot')[0]
    let g:deoplete#sources#rust#rust_source_path=rust_sysroot . '/lib/rustlib/src/rust/src'
endif
let g:deoplete#sources#rust#disable_keymap = 1
