" Fully profit from vim's ftplugin system
"
" ( If ever you care to override stuff from it,
"   please do so in
"   	.vim/after/ftplugin/language.vim
" )
"
" 4o, Sep 6, 2016
"
filetype plugin indent on
set autoindent

set softtabstop=4
set shiftwidth=4
set expandtab
set formatoptions-=cro

" Hilite
syntax on

" Readability
set background=dark
set hlsearch

" Change curser when inserting/ replacing
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Behave nicely when splitting
set splitbelow
set splitright

" Keys
noremap <F3> :set number! number?<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅"
noremap <F5> :set list! list?<CR>
set pastetoggle=<F6>
let mapleader=','
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" ) <CR>
" Make ',V' go to visual block mode
map <Leader>V <C-v>

" UI specific
if has("gui_running")
	set guifont=xos4\ Terminus\ Bold\ 15
	set background=light
	set lines=36 columns=90
else
	set background=dark
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Reload config file after write
autocmd bufwritepost $MYVIMRC source %
