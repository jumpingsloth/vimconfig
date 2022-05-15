set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set linebreak
set hidden
set incsearch
set hlsearch

set spelllang=de

set autochdir

set lines=45 columns=100

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <C-TAB> :bnext<CR>
nnoremap <C-S-TAB> :bprevious<CR>
nnoremap <C-w> :bp <BAR> bd #<CR>
nnoremap <C-n> :enew<CR>
nnoremap <C-t> :e .<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-S-s> :browse saveas<CR>
inoremap <C-s> <C-o>:w<CR>
nnoremap <C-q> :q<CR>

nnoremap <C-h> :noh<CR>

inoremap jj <Esc>
inoremap LL <Esc>A
inoremap HH <Esc>I

vnoremap <C-c> "+y
inoremap <C-v> <C-r><C-p>+
nnoremap <c-v> "+p

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

command ToolbarOff set guioptions-=m | set guioptions-=T | set guioptions-=r | set guioptions-=L
command ToolbarOn set guioptions+=m | set guioptions+=T | set guioptions+=r | set guioptions+=L

" autocmd filetype c nnoremap <C-r> :w <bar> silent exec '! xterm -e "make run ; read"'<CR>

autocmd filetype c nnoremap <C-r> :AsyncRun xterm -e "make run ; echo '\n\nPress enter to continue...' ; read"<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'vim-scripts/matchit.zip'

Plug 'mhinz/vim-startify'

Plug 'dracula/vim', { 'as': 'dracula' }

" Plug 'vimwiki/vimwiki'

call plug#end()

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vimwiki configuration
" let g:vimwiki_list = [{ 'path': '/data/Nextcloud/Notes/VimWiki/',
	" \ 'syntax':'markdown', 'ext': '.md' }]

" autocmd FileType vimwiki set ft=markdown

if has("gui_running")
if has("gui_gtk2")
  set guifont=Inconsolata\ 12
elseif has("gui_macvim")
  set guifont=Menlo\ Regular:h14
elseif has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif
endif

colorscheme dracula
