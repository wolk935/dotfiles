set nocompatible

" Search ignores case, unless case is specified
set ignorecase
set smartcase

" Highlight search as its typed
"set hlsearch, :noh required to reset highlighting...
set incsearch

" Maintain same indentation on new lines
set autoindent

" Always show cursor position
set ruler

" Always show status line
set laststatus=1
set showcmd
set showmode

" Indentation rules
set noexpandtab
set shiftwidth=6
set tabstop=6

" Errors are visual flashing
set visualbell

" Ignore these files
set wildignore=*.class,*.o,*.so,*.os,*.pyc

" Don't worry about backups
set nobackup
set noswapfile
set nowb

" Fast terminal connection
set ttyfast

" Disable arrowkeys navigation
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Disable man lookup
nnoremap K <nop>
vnoremap K <nop>

" Navigate wrapped lines
nnoremap <down> gj
nnoremap <up> gk
nnoremap j gj
nnoremap k gk

" Find replace in vselection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Paste replace (into the dead register)
vmap r "_dP

" Colorscheme settings
syntax on
set t_Co=256
set background=dark
colorscheme wombat256mod

" Define language-specific comment characters
au FileType c,cpp,cs,d,java,javascript let b:commentchar='//'
au FileType fortran let b:commentchar='!'
au FileType conf,make,python,ruby,sh let b:commentchar='#'
au FileType plaintex,tex let b:commentchar='%'
au FileType vim let b:commentchar='"'

" Strip trailing whitespace on save
autocmd FileType c,conf,cpp,cs,d,fortran,java,javascript,make,md,plaintex,python,ruby,sh,tex,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

let mapleader=","

" Define mappings for mass-line commenting
map <leader>c :s/^/<C-R>=escape(b:commentchar,'\/')<CR>/g<CR>
map <leader>C :s/^\V<C-R>=escape(b:commentchar,'\/')<CR>//g<CR>
