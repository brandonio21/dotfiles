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

Plug 'https://github.com/bling/vim-airline.git' " Statusbar plugin
Plug 'https://github.com/vim-airline/vim-airline-themes.git' "Themes for airline
Plug 'https://github.com/flazz/vim-colorschemes.git' " Colorschemes plugin
Plug 'https://github.com/scrooloose/nerdtree.git', {'on' : 'NERDTreeToggle' } 
         " ^ NERD Tree to browse files. Setup to load on demand.
Plug 'https://github.com/ervandew/supertab.git' " Tab completion
Plug 'https://github.com/terryma/vim-multiple-cursors.git' "Sublime like cursors
Plug 'https://github.com/rust-lang/rust.vim' "Rust syntax highlighting
Plug 'https://github.com/kien/ctrlp.vim' "Fuzzy file searcher
Plug 'https://github.com/brandonio21/vim-async-flake8'
Plug 'https://github.com/wincent/command-t'

call plug#end()
filetype plugin indent on


set nu              	" line numbering on
set autoindent          " autoindent on
set noerrorbells        " bye bye bells :)
set modeline            " show what I'm doing
set showmode            " show the mode on the dedicated line (see above)
set nowrap          	" no wrapping!
set ignorecase          " search without regards to case
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set colorcolumn=81	" Draws a red line at 80 character limit
set exrc  	        " open local config files
set nojoinspaces        " don't add white space when I don't tell you to
set ruler           	" which line am I on?
set showmatch           " ensure Dyck language
set incsearch           " incremental searching
set nohlsearch          " Removes permanent highlights after searching
set bs=2                " fix backspacing in insert mode
set laststatus=2	" Always have statusbar showing
set termencoding=utf-8	" ALlow for symbols
set encoding=utf-8	" moar symbols
set background=dark
set cursorline

set t_Co=256

" vim-airline settings
" ---------------------
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
"au BufRead,BufNewFile *.py set tabstop=8 expandtab shiftwidth=4 softtabstop=4

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
map <C-L> :next <CR>
map <C-H> :prev <CR>

" Tab Mappings
"map <C-t> :tabnew <CR>


" Spelling toggle via F10 and F11
map <F3> :setlocal spell spelllang=en_us<CR>
map <F4> :setlocal nospell<CR>

" NERD Tree keybindings
map <C-m> :NERDTreeToggle<CR>

" Taglist Toggle
" map <C-t> :TlistToggle<CR>

" Make it so F2 toggles paste
set pastetoggle=<F2>

syn match tab display "\t"
hi link tab Error

let g:flake8_cmd="/usr/local/bin/flake8"
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

autocmd BufWritePost *.py call Flake8()

let g:CommandTFileScanner='watchman'
