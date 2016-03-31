set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" GIT wrapper
Plugin 'tpope/vim-fugitive'
" theme
Plugin 'andrwb/vim-lapis256'
" Scala Syntax Highlighting
Plugin 'derekwyatt/vim-scala'
" solarized theme
Plugin 'altercation/vim-colors-solarized'
" Snippet Engine
Plugin 'SirVer/ultisnips'
" Snippets
Plugin 'honza/vim-snippets'
" Super Tab
Plugin 'ervandew/supertab'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Easy commenting
Plugin 'scrooloose/nerdcommenter'
" Status bar
Plugin 'bling/vim-airline'
" Leverage the power of Vim's compiler plugins without being bound by synchronicity
Plugin 'tpope/vim-dispatch'
" Full path fuzzy file finder
Plugin 'kien/ctrlp.vim'
" Latex Tool Box"
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Closing of quotes and brackets
Plugin 'Raimondi/delimitMate'
" Auto complete
Plugin 'Valloric/YouCompleteMe'
" Build in split plugin
Plugin 'thinca/vim-quickrun'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
syntax enable " enable syntax highlightning
set t_Co=16
set background=dark
colorscheme lapis256

" This option forces vim to source .vimrc file if it present in working
" directory
set exrc

"This option will restrict usage of some commands in non-default .vimrc files; commands that write to file or execute shell commands are not allowed and map commands are displayed.
"set secure

"set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set relativenumber        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set t_Co=256      " Setting Colors to 256
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set noerrorbells         " don't beep
set visualbell t_vb=
set nobackup " i will handle backup on my own
set noswapfile " No swap pls
"set list" HIghlight whitespace
set listchars=trail:.,extends:#,nbsp:.
set foldmethod=indent
set foldlevel=99
set linebreak
" Key Definitions
let mapleader = ","

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
set encoding=utf-8
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
set linespace=0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Making ECLIM play nice with YCM
let g:EclimCompletionMethod = 'omnifunc'

"change cursor on different modes
if &term =~ 'rxvt'
  " solid underscore
  let &t_SI .= "\<Esc>[5 q"
  " solid block
  let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

"Change directory to current open file
autocmd BufEnter * silent! lcd %:p:h

" Supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" discover space errors
let c_space_errors = 1
let java_space_errors = 1
let c_no_tab_space_error = 1
let java_no_tab_space_error = 1

" Snippets
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Close Buffer
nmap <leader>w :bw<cr>
" Move Between Buffers
nmap <C-h> :bp<cr>
nmap <C-l> :bn<cr>

"#Eclim"
set nocompatible

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ce :e $MYVIMRC<CR>
nmap <silent> <leader>cr :so $MYVIMRC<CR>

nnoremap j gj
nnoremap k gk

"Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

nmap <F5> :w <CR> :!javac Program.java <CR> :!java Program <CR>

"Make file keybinding
" nmap <f9> :make <cr>
map <f9> :wa<bar>silent make<bar>cwindow<cr>
