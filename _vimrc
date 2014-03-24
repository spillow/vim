augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
  au! BufRead,BufNewFile *.cl	    setf opencl
augroup END

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<cr>

filetype on
filetype plugin on

syntax on

set backspace=indent,eol,start

" line numbering
set nu

set autoindent

set smartindent

set shiftwidth=2
set tabstop=2

set expandtab

set smarttab

" Highlight search results
set hlsearch

" incremental search
set incsearch

" work well with standard windows commands
source $VIMRUNTIME/mswin.vim

"map <C-f> <ESC>:%!indent -kr -i8<CR>`'
map <C-f> <ESC>gg=G`'

" kill trailing whitespace
map <C-d> <ESC>:%s/\s\+$//<CR>`'

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

set noesckeys "gets rid of lag for shift-o

highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

"set the font to 9 in gvim
"set gfn=Monospace\ 9

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

"Easier split navigations

"We can use different key mappings for easy navigation between
"splits to save a keystroke. So instead of ctrl-w then j, it's just ctrl-j:

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" toggle between relative and absolute line numbers
function! g:ToggleNuMode()
	if(&rnu == 1)
		set nornu
	else
		set rnu
	endif
endfunc

nnoremap <f5> :call g:ToggleNuMode()<cr>

function! KillSpace()
python << EOF
import vim
currLine = int(vim.eval('line(".")')) - 1
#print vim.current.line
cb = vim.current.buffer
bufferLen = len(cb)

if cb[currLine].strip() == '':
  while currLine > 0 and cb[currLine-1].strip() == '':
    currLine -= 1

  startLine = currLine

  endLine = startLine
  while endLine < bufferLen and cb[endLine].strip() == '':
    endLine += 1

  if endLine - startLine > 1:
    del cb[startLine:endLine-1]
EOF
endfunc

nnoremap K :call KillSpace()<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

