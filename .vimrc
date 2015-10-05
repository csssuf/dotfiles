"Neovundle----------------------------------------------
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'SearchComplete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'kevinw/pyflakes-vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Valloric/YouCompleteMe', {
	\ 'build' : {
	\	'mac' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
	\	'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
	\	'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
	\	'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
	\}
\}
call neobundle#end()

"------------------------------------------------------
set t_Co=256

filetype off
syntax on
filetype plugin indent on
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set foldmethod=indent
au FileType python set foldlevel=99
au FileType python set textwidth=79
au FileType ruby set foldlevel=99
"autocmd BufWritePost *.py call Flake8()
filetype plugin indent on
set foldmethod=syntax
set rnu
set nu
syntax on
filetype on

"Show 80 column mark
set textwidth=80
set colorcolumn=+1
"let &colorcolumn=join(range(81,999),",")

set nocompatible 
set undodir=~/.vim/undo
set undofile
set noswapfile
set hidden
set modeline
colorscheme vividchalk
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a
" other than the (hard)tabstop
set softtabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
set showmatch
"Something Something backspace
set bs=2
" Autoindent
set ai
"Pep8, yay
set shiftround
set nowrap
"Cool menu
set wildmenu
"python magic"
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
set title
set undolevels=1000
set history=1000
map <leader> <b> :call BufferList()<CR> Commands, my typing is rather bad
command! WQ wq
command! Wq wq
command! W w
command! Q q
"autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
autocmd BufRead *\.txt map  j gj
autocmd BufRead *\.txt  map  k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.spell setlocal spell spelllang=en_us
map <leader> <b> :call BufferList()<CR>
autocmd FileType java map <F9> :w <bar> !clear && crk "%"<CR> 
autocmd FileType python map <F9> :w <bar> !clear && python "%" && read -p "Press enter to continue:"<CR> 
autocmd FileType java set number " show numbers in java
let g:SuperTabDefaultCompletionType = "context"
let g:miniBufExplMaxSize = 0
let g:yankring_history_dir = "~/.vim/undo/YankRing/history/"

"Buffline stuff
let g:bufferline_echo=0
set statusline=%{bufferline#generate_string()}
set laststatus=2
"Neocomplete stuff---------------------------------------------------
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"  endif
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
""autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
""autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"  endif
"--------------------------------------------------------------------------
"
"Unite Stuff---------------------------------------------------------------

let g:ycm_confirm_extra_conf = 0
inoremap <C-Space> <C-x><C-o>
au FileType awk let b:delimitMate_quotes=""

