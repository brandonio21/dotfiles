" ~/.nvimrc
" Brandon Milton
" https://github.com/brandonio21
" http://brandonio21.com

" ******************************************************************************
" * VARIABLES SECTION
" ******************************************************************************
set nocompatible        " get rid of strict vi compatibility!
filetype off

" Start plugin loading using vim-plug
call plug#begin('~/.vim/plugged') 

Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/bling/vim-bufferline'
Plug 'https://github.com/ClaudiaJ/lightline-molokai.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ervandew/supertab.git' " Tab completion
Plug 'https://github.com/rust-lang/rust.vim' "Rust syntax highlighting
Plug 'https://github.com/wincent/command-t'
Plug 'https://github.com/brandonio21/molokai' "Molokai coloscheme with VTE sup
Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/nvie/vim-flake8'
Plug 'https://github.com/jlanzarotta/bufexplorer'

" Plug 'https://github.com/flazz/vim-colorschemes.git' " Colorschemes plugin

call plug#end()
filetype plugin indent on


set autoindent          " autoindent on
set background=dark
set backspace=indent,eol,start  " backspace over everything
set bs=2                " fix backspacing in insert mode
set colorcolumn=81	" Draws a red line at 80 character limit
set encoding=utf-8	" moar symbols
set exrc  	        " open local config files
set fileformats=unix,dos,mac    " open files from mac/dos
set hidden
set ignorecase          " search without regards to case
set incsearch           " incremental searching
set laststatus=2	" Always have statusbar showing
set modeline            " show what I'm doing
set noerrorbells        " bye bye bells :)
set nohlsearch          " Removes permanent highlights after searching
set nojoinspaces        " don't add white space when I don't tell you to
set nowrap          	" no wrapping!
set nu              	" line numbering on
set ruler           	" which line am I on?
set showcmd
set showmatch           " ensure Dyck language
set showmode            " show the mode on the dedicated line (see above)
set termencoding=utf-8	" ALlow for symbols
set t_Co=256
set wildmenu
set wildmode=longest:full,full
set cursorline

" vim-airline settings
" ---------------------
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1	"Make powerline symbols show
let g:airline#extensions#tabline#enabled=1 "Make tabline show up
let g:netrw_liststyle=3

if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

if has('gui_running')
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif


set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab


" Change tabs in certain source files to spaces. This list should constantly
" be changing.
"au BufRead,BufNewFile *.{c,h,java,php,cpp,jsp,pp,hpp,js,rs} set expandtab
"au BufRead,BufNewFile *.{c,h,java,php,cpp,jsp,pp,hpp,js,rs} set shiftwidth=2
"au BufRead,BufNewFile *.{c,h,java,php,cpp,jsp,pp,hpp,js,rs} set tabstop=2

" Python rules
au BufRead,BufNewFile *.py set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

" Be sure to set the syntax for markdown files
au BufRead,BufNewfile *.md set syntax=mkd
au BufRead,BufNewfile *.screepsjs set syntax=screeps

" Show syntax
syntax on

" This is my prefered colorscheme.
colorscheme molokai

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-l> :bn <CR>
map <C-h> :bp <CR>


" Spelling toggle via F10 and F11
map <F3> :setlocal spell spelllang=en_us<CR>
map <F4> :setlocal nospell<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! OpenNERDTree()
  if IsNERDTreeOpen()
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfunction

" NERD Tree keybindings
map <C-n> :call OpenNERDTree()<CR>
map <leader>f :NERDTreeFocus<CR>
map <leader>F :NERDTreeFind<CR>
map <C-t> :CommandT<CR>

" Taglist Toggle
" map <C-t> :TlistToggle<CR>

" Make it so F2 toggles paste
set pastetoggle=<F2>

syn match tab display "\t"
hi link tab Error

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_sign_column_always=1

let g:CommandTFileScanner='watchman'

" Make trailing whitespace visible
set list
set listchars=tab:>-,trail:-

"Quickfix window shortcuts
map <C-j> :cn<CR>
map <C-k> :cp<CR>

syn match tab display "\t"
hi link tab error

command Flake call Flake8()

nnoremap <leader>v <C-w><C-s>:e $MYVIMRC<CR>

set showtabline=2
let g:bufferline_echo=0
let g:bufferline_fname_mod = ':t'
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'tabline': {
      \   'left': [ ['bufferline'] ]
      \ },
      \ 'component_expand': {
      \   'bufferline': 'LightlineBufferline',
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'relativepath', 'modified' ] ],
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filename', 'modified' ] ],
      \ },
      \ }

function! LightlineBufferline()
    call bufferline#refresh_status()
      return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
    endfunction

map ,b <leader>bs

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
