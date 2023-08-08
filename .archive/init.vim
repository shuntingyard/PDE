" ----------------------------------------------------------------------------
"  General
" ----------------------------------------------------------------------------

set nocompatible                            " be iMproved
set undofile                                " see undodir
let g:python3_host_prog = '/usr/bin/python3' " for deoplete etc.


" ----------------------------------------------------------------------------
"  Plugins
" ----------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')   " begin

" Color scheme
Plug 'rainux/vim-desert-warm-256'
Plug 'jacoborus/tender.vim'
Plug 'navarasu/onedark.nvim'
Plug 'shaunsingh/solarized.nvim'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI
Plug 'junegunn/fzf'

" (Optional) Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" From the minimal rust nvim config in same dir.
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()                             " end


" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set autoindent                              " make sure these two are on
set smartindent

set tabstop=8                               " spaces per tab in file
set shiftwidth=4                            " spaces per [auto]indent step
set softtabstop=4                           " spaces per tab when editing
set expandtab                               " insert/ indent DO use spaces
set shiftround
set nowrap
set formatoptions=n                         " no comment on newline


" ----------------------------------------------------------------------------
"  Language Server Protocol (LSP)
" ----------------------------------------------------------------------------

" Startup
"let g:LanguageClient_autoStart = 0
let g:deoplete#enable_at_startup = 1

" Configure languages
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'python': ['pylsp'],
    \ 'rust': ['rust-analyzer'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }

"nnoremap <F2> :call LanguageClient_contextMenu()<CR>
" respectively, more modern:
nmap <F2> <Plug>(lcn-menu)
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" For deoplete tab completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" For debugging
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile = stdpath('data') . '/LanguageClient.log'
let g:LanguageClient_serverStderr = stdpath('data') . '/LanguageServer.log'


" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set wildmenu                                " enhanced cmdline completion
set wildmode=list:longest,full              " longest common, then complete

set cursorline                              " use cursorline

" Make vertical split bar character a space
set fillchars+=vert:\ 

" Options for [v]splitting
set splitbelow splitright

" Colors for working long (including cursorline)
set t_Co=256
"colorscheme desert-warm-256
"colorscheme tender
colorscheme onedark
"colorscheme solarized

" Backgrounds transparent
"hi Normal guibg=NONE ctermbg=NONE

"highlight clear SignColumn
"highlight CursorLine term=NONE cterm=NONE ctermbg=236

" For punching cards :p
"set colorcolumn=80
"highlight ColorColumn ctermbg=236

" Relative numbers
set number relativenumber


" ----------------------------------------------------------------------------
"  Status Line
" ----------------------------------------------------------------------------

" Enable it all the time
set laststatus=2

" Format
set statusline=%f                           " path
set statusline+=%m%r%h%w                    " flags
set statusline+=\ %y                        " filetype
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}   " encoding
set statusline+=\[%{&fileformat}\]          " format
set statusline+=\ %l\/%L,%c                 " line/maxline,column

" Color respective to bg
"hi StatusLine ctermfg=Black ctermbg=White
"hi StatusLineNC ctermfg=Black ctermbg=Grey

" Change color in insert mode
"au InsertEnter * hi StatusLine ctermbg=Yellow
"au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White


" ----------------------------------------------------------------------------
"  Function Keys
" ----------------------------------------------------------------------------

" Toggle numbers
noremap <F3> :set nu! rnu!<CR>

" Toggle search highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>

" Toggle display of tabs and trailing spaces
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅"
noremap <F5> :set list! list?<CR>

" Prevent ugly insertions/ insertion of comments etc.
set pastetoggle=<F6>


" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------

" Mapleader to comma
let mapleader = ","

" Make ',V' go to visual block mode
map <Leader>V <C-v>

" Don't toggle dark/ light while we use a custom scheme
"map <Leader>bg :let &bg = ( &bg == "dark"? "light" : "dark" ) <CR>

" Search options 
set ignorecase
set smartcase
set incsearch
set showmatch

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz


" ----------------------------------------------------------------------------
"  Directories
" ----------------------------------------------------------------------------

"set directory=./.vim-swap,~/tmp/vim,~/.tmp,~/tmp,/tmp
"set backupdir=./.vim-backup,~/tmp/vim,~/.tmp,~/tmp,/tmp
set undodir=./.vim-undo,~/tmp/vim,~/.tmp,~/tmp,/tmp


" ----------------------------------------------------------------------------
"  Misc
" ----------------------------------------------------------------------------

" Jump to last known position in a file if you can (code from neovim help).
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" Reload config file after write
autocmd bufwritepost $MYVIMRC source %
