set history=1000

" Text Formatting
set autoindent                                               " autoindent
set smartindent                                              " be smart about it
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set shiftround                                               " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=4                                                " actual tabs occupy 8 characters
set softtabstop=4                                            " insert mode tab and backspace use 2 spaces
set backspace=2                                              " Fix broken backspace in some setups
set expandtab                                                " expand tabs to spaces

set colorcolumn=120
setlocal textwidth=120

set number              " show line numbers

set showcmd             " show command in bottom bar

set cursorline          " highlight current line

filetype indent on      " load filetype-specific indent files

set wildmenu            " visual autocomplete for command menu

set wildmode=list:longest

set lazyredraw          " redraw only when we need to.
set title
set showmatch           " highlight matching [{()}]
set ruler
set incsearch           " search as characters are entered

set hlsearch            " highlight matches
set backspace=indent,eol,start

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader = ','
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Set font for GUI (e.g. GVim)
if has("gui_running")
    set guifont=Anonymous_Pro\ 13
endif

set ignorecase
set smartcase
set fileformat=unix
"set columns=80
"olorscheme ron

filetype plugin on
filetype indent on
:highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

set showcmd
set ofu=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
set incsearch

" tab navigation like firefox
 :nmap <C-S-tab> :tabprevious<CR>
 :nmap <C-tab> :tabnext<CR>
 :map <C-S-tab> :tabprevious<CR>
 :map <C-tab> :tabnext<CR>
 :imap <C-S-tab> <Esc>:tabprevious<CR>i
 :imap <C-tab> <Esc>:tabnext<CR>i
 :nmap <C-t> :tabnew<CR>
 :imap <C-t> <Esc>:tabnew<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neosnippet-snippets'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" Don't show seperators

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
    let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'dark'

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=1
let g:airline#extensions#syntastic#enabled = 1

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ','branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks','%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()


set modifiable
set statusline=%{fugitive#statusline()}

set laststatus=2
set encoding=utf-8
if !has('gui_running')
    set t_Co=256
endif
let g:Powerline_symbols = 'fancy'

syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256
colorscheme solarized

autocmd BufNewFile,BufRead *.tt setf tt2

"let g:indent_guides_auto_colors = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


let g:neocomplete#enable_at_startup = 1

