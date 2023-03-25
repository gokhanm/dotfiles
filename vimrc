" VIM Configuration File
"
" -----------------------------------------------------------------
" |   General                                                     |
"  ----------------------------------------------------------------
set nocompatible          " Disable vi compatibility ( Be IMproved)
set encoding=utf-8        " Encoding UTF-8
set smartcase             " Sensitive with uppercase
set ignorecase            " Use case insensitive search, except when using capital letters

if has("gui_running")
        set mouse=a       " Enable use of the mouse for only gui
endif

" ----------------------------------------------------------------
" |   Files                                                      |
" ----------------------------------------------------------------

set autochdir                       " Always use current dir.
set autoread                        " Refresh if changed
set confirm                         " Confirm changed files
set nobackup                        " Disable backups
set noautowrite                     " Never autowrite
set undodir=~/.vim/undos            " Set directory for undo files
set undofile                        " Automatically save undo history
set backupdir=~/.vim/backups        " Store backups under ~/.vim/backup
if !strlen($SUDO_USER)              " Swap files, unless vim is invoked using sudo
        set directory=~/.vim/swaps  " Set directory for swap files
        set swapfile                " Enable swap files
else
        set noswapfile              " Do not create swap files, we're using git after all
endif

"-----------------------------------------------------------------
"|    Styling                                                    |
"-----------------------------------------------------------------
syntax on                   " Turn syntax highlighting on
set number                  " Display line numbers on the left
set autoindent              " align the new line indent with the previous line
set textwidth=79            " lines longer than 79 columns will be broken
set guifont=Monospace\ 16
set showcmd                 " Show partial commands in the last line of the screen
set showmatch               " Highlight matching braces
set shiftround              " round indent to multiple of 'shiftwidth'
set hidden                  " Allow unsaved background buffers and remember marks/undo for them
set laststatus=2            " Always show status line
set backspace=indent        " ┐
set backspace+=eol          " │ Allow `backspace`
set backspace+=start        " ┘ in insert mode
set listchars=tab:▸\        " ┐
set listchars+=trail:·      " │ Use custom symbols to
set listchars+=eol:↴        " │ represent invisible characters
set listchars+=nbsp:_       " ┘
set laststatus=2            " Always show status line


"----------------------------------------------------------------
"|    Tabs, Spaces                                              |
"----------------------------------------------------------------
set ts=4                     " Tab width is 4 spaces
set shiftwidth=4             " Indent also with 4 spaces
set expandtab                " insert spaces when hitting TABs
set smarttab                 " tab to 0,4,8 etc
set softtabstop=4            " insert/delete 4 spaces when hitting a TAB/BACKSPACE


"----------------------------------------------------------------
"|    Plugins                                                   |
"----------------------------------------------------------------

filetype off                " Disable file type detection, required by Vundle
filetype plugin indent on   " Also load indent files, to automatically do language-dependent indenting
"     │     │    └──── Enable file type detection
"     │     └───────── Enable loading of indent file
"     └─────────────── Enable loading of plugin files

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'            
Plug 'scrooloose/nerdtree'        
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'         
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'plasticboy/vim-markdown'


call plug#end()



"----------------------------------------------------------------
"|    Tag Bar                                                   |
"----------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>             " Tagbar (toggle)

" ---------------------------------------------------------------
" | Graphical                                                   |
" ---------------------------------------------------------------
if has("gui_running")
        colorscheme darcula              " Use custom color scheme if gui running
endif
