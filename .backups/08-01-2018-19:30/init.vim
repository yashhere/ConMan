" custom keys
let mapleader=" "

"Reload vimrc without quitting
map <leader>s :source ~/.config/nvim/init.vim<CR>

" ================ General Config ====================
set encoding=utf-8
set nocompatible                "vim-specific settings, non-vi-compatible
set backspace=indent,eol,start 	"Allow backspace in insert mode
set number                      "Line numbers are good
set history=1000                "Store lots of :cmdline history
set mouse=nv                    " Allow mouse usage in normal and visual modes"
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set t_vb=
set autoread                    "Reload files changed outside vim
set lazyredraw                  "redraw only when we need to.
set showmatch                   "highlight matching [{()}]
set title                       "Set the terminal title
set ruler                       "Enable limited line numbering

"set spell spelllang=en_us

set modeline                    " Turn on modeline"

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set guioptions=a                "hide scrollbars/menu/tabs"
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
    let myUndoDir = expand('~'.'/.vim/backups')
    call system('mkdir -p' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set relativenumber      " relative numbering (Current line in line 0)"

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap                "Wrap lines
set linebreak           "Wrap lines at convenient points
set textwidth=0					"Prevent Vim from automatically inserting line breaks
set wrapmargin=0
set formatoptions-=t		"Don't change wrapping on existing lines
set formatoptions+=l		"Black magic

" ================ Folds ============================

set foldmethod=syntax   "fold based on indent
set foldlevel=9999      " Keep folds open by default"
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "don't fold by default

" enable folding with the spacebar
nnoremap <space> za

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
noremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>       " Cancel a search with escape

" Install Plugins
call plug#begin('~/.local/share/nvim/plugged')
	" Themes
	Plug 'vim-airline/vim-airline-themes'
  Plug 'alessandroyorba/despacio'
  Plug 'chriskempson/base16-vim'

	" Markdown
	Plug 'tpope/vim-markdown'
  Plug 'junegunn/goyo.vim'
  Plug 'shime/vim-livedown'

	" Other Tools
	Plug 'vim-airline/vim-airline'					          " Airline bar
	Plug 'w0rp/ale'           						            " syntax info
	Plug 'Raimondi/delimitmate'						            " smart completion of delimiters
  Plug 'vim-scripts/indentpython.vim'
  Plug 'nvie/vim-flake8'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  Plug 'flazz/vim-colorschemes'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'godlygeek/tabular'
  Plug 'thanthese/Tortoise-Typing'
  Plug 'kh3phr3n/python-syntax'
  Plug 'dietsche/vim-lastplace'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'davidhalter/jedi-vim'

  Plug 'chrisbra/Colorizer'
call plug#end()

nnoremap ,; ;
nnoremap ; :

" # Plugin Settings
set laststatus=2		                            " Make airline status bar appear all the time
let g:airline#extensions#wordcount#enabled = 1	" Show word count

" Get rid of pointless Airline separators because I don't want to install a
" patched font to make them look right
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1                         " Show buffers above"

" Remove existing autocommands to avoid duplicates
:autocmd!

"Force Airline to refresh after setup so settings work
:autocmd VimEnter * :AirlineRefresh

"turn on syntax highlighting
set background=dark
let python_highlight_all=1
syntax on
syntax enable
set t_Co=256
colorscheme woju

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remove whitespaces on exit
autocmd BufWritePre * :%s/\s\+$//e

"NerdTree Configuration
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.DS_Store', '\~$', '\.swp']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NerdCommenter
let g:NERDSpaceDelims = 1                 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1             " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1           " Allow commenting and inverting empty lines
let g:NERDTrimTrailingWhitespace = 1      " Enable trimming of trailing whitespace when uncommenting

" Highlight markdown
let g:markdown_fenced_languages = ['c', 'html', 'vim', 'python', 'bash=sh']

" LiveMarkdown Toggle Binding remap
nmap gm :LivedownToggle<CR>

" Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab |
    \ set autoindent  |
    \ set fileformat=unix

"---------------------------HABIT--BREAKING----------------------------"
inoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
nnoremap <down> <nop>

" comment current line with //
nmap // <leader>ci
" comment current selection with //
vmap // <leader>ci

" w!! force write with sudo even if forgot sudo vim
cmap w!! w !sudo tee > /dev/null %<CR>:e!<CR><CR>

" Easy Motion shortcut. Try it!
nmap ,, <leader><leader>s<Paste>

" Switch buffers with Tab and Shift-Tabnoremap
inoremap jk <Esc>
nnoremap <CR> o<Esc>
nnoremap  <silent>   <tab>  mq:bnext<CR>`q
nnoremap  <silent> <s-tab>  mq:bprevious<CR>`

if argc() > 1
  silent blast " load last buffer
  silent bfirst " switch back to the first
endif

" spell checking and automatic wrapping at the recommended 72 columns to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

