call plug#begin('~/.vim/plugged')

Plug 'JulesWang/css.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'genoma/vim-less'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

set nocompatible

" Search ignores case, unless case is specified
set ignorecase
set smartcase

" Ignore case for autocompletion
set wildignorecase

" Always show autocomplete menu, always complete to longest first
set completeopt=longest

" Highlight search as its typed
set incsearch

" Maintain same indentation on new lines
set autoindent

" Always show cursor position
set ruler

" Always show status line
set laststatus=1
set showcmd
set showmode

" Global indentation rules (may be overridden by ftplugin)
set joinspaces
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4

" No epilepsy
set noerrorbells
set novisualbell
set t_vb=

" Ignore these files
set wildignore=*.class,*.hi,*.o,*.so,*.os,*.pyc

" Don't worry about backups
set nobackup
set noswapfile
set nowb

" Fast terminal connection
set ttyfast

" Easier shifting
vnoremap , <
vnoremap . >

" Disable arrowkeys navigation
noremap <down> <nop>
noremap <up> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Disable space bar normally
noremap <space> <nop>

" Disable EOL append
nnoremap A a

" Disable EX mode
noremap Q <nop>

" Disable man lookup
noremap K <nop>

" Disable recording
noremap q <nop>

" No help
inoremap <F1> <nop>
noremap <F1> <nop>

" Navigate wrapped lines
set nolinebreak
set wrap
nnoremap j gj
nnoremap k gk

" Find replace in vselection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Paste but use dead register
vmap p "_dp
vmap P "_dP

" Terminal 256 colour
set t_Co=256

" Colorscheme settings
syntax enable
set background=dark
colorscheme wombat256mod

" Non-annoying paste-mode
set pastetoggle=<F2>

" Define language-specific comment characters
au FileType c,cpp,cs,d,java,less let b:commentchar='//'
au FileType fortran let b:commentchar='!'
au FileType sql let b:commentchar='--'
au FileType conf,make,markdown,r,ruby,sh let b:commentchar='#'
au FileType plaintex,tex let b:commentchar='%'
au FileType vim let b:commentchar='"'

" Strip trailing whitespace on save
au FileType c,conf,cpp,cs,d,fortran,haskell,html,less,java,javascript,json,make,markdown,plaintex,python,ruby,sh,tex,vim,xml au BufWritePre <buffer> :%s/\s\+$//e

" Define mappings for mass-line commenting
let mapleader=","

map <leader>c :s/^/<C-R>=escape(b:commentchar,'\/')<CR>/g<CR>
map <leader>C :s/^\V<C-R>=escape(b:commentchar,'\/')<CR>//g<CR>

" Less tears
nnoremap ; :
vnoremap ; :

" Syntastic jshintrc
let g:syntastic_javascript_jshint_args="--config ~/.jshintrc"
let g:syntastic_javascript_checkers=["jsxhint", "jshint"]

" Syntastic C++
let g:syntastic_cpp_compiler_options = '-pedantic -std=c++14 -W -Wall -Wcast-qual -Wconversion -Wextra -Wfatal-errors -Wwrite-strings'

" Git Gutter fixes
hi clear SignColumn
hi GitGutterAdd ctermbg=none
hi GitGutterChange ctermbg=none
hi GitGutterDelete ctermbg=none
hi GitGutterChangeDelete ctermbg=none
