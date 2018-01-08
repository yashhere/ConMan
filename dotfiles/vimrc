"custom keys
let mapleader=" "

"Reload vimrc without quitting
map <leader>s :source ~/.vimrc<CR>

" ================ General Config ====================
set encoding=utf-8
set nocompatible                "vim-specific settings, non-vi-compatible
set backspace=indent,eol,start 	"Allow backspace in insert mode
set number                      "Line numbers are good
set history=1000                "Store lots of :cmdline history
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
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
  set backupdir=~/.vim/backups
  set directory=~/.vim/backups
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

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

set foldmethod=indent   "fold based on indent
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
"noremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>       " Cancel a search with escape

" Use Arrows insted of standard keys
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

" # Install Plugins
call plug#begin('~/.vim/plugged')
	" ## Themes
  "	Plug 'https://github.com/chriskempson/vim-tomorrow-theme'
	Plug 'vim-airline/vim-airline-themes'
  Plug 'alessandroyorba/despacio'
  Plug 'chriskempson/base16-vim'

	" ## Markdown
	" Plug 'nelstrom/vim-markdown-folding'
	" Plug 'tpope/vim-markdown'

	" ## Other Tools
	" Plug 'https://github.com/sirtaj/vim-openscad'	    " OpenSCAD syntax hilighting
	Plug 'vim-airline/vim-airline'					          " Airline bar
	Plug 'scrooloose/syntastic'						            " syntax info
	Plug 'Raimondi/delimitmate'						            " smart completion of delimiters
  Plug 'benmills/vimux'
  " Plug 'tmhedberg/SimpylFold'
  Plug 'vim-scripts/indentpython.vim'
  " Plug 'Valloric/YouCompleteMe'
  Plug 'nvie/vim-flake8'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  " Plug 'tpope/vim-fugitive'
  " Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" # Plugin Settings
set laststatus=2		                            " Make airline status bar appear all the time
"set foldenable			                            " Enable markdown folding
let g:airline#extensions#wordcount#enabled = 1	" Show word count

" Get rid of pointless Airline separators because I don't want to install a
" patched font to make them look right
let g:airline_left_sep=''
let g:airline_right_sep=''

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"

" Remove existing autocommands to avoid duplicates
:autocmd!

"Force Airline to refresh after setup so settings work
:autocmd VimEnter * :AirlineRefresh

"turn on syntax highlighting
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
let python_highlight_all=1
syntax on
syntax enable
"set t_Co=256
"colorscheme Tomorrow-Night
let g:despacio_Campfire = 1
"colorscheme despacio

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remove whitespaces on exit
autocmd BufWritePre * :%s/\s\+$//e


"NerdTree Configuration
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NerdCommenter
let g:NERDSpaceDelims = 1                 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1             " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1           " Allow commenting and inverting empty lines
let g:NERDTrimTrailingWhitespace = 1      " Enable trimming of trailing whitespace when uncommenting

" Highlight markdown
let g:markdown_fenced_languages = ['c', 'html', 'vim', 'python', 'bash=sh']
