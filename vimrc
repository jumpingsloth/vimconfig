set encoding=utf-8
set number
" set relativenumber
set autoindent
" set smartindent
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

set visualbell

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

vnoremap <C-S-c> "+y
inoremap <C-S-v> <C-r><C-p>+
nnoremap <c-S-v> "+p

# nnoremap <C-S-v> <C-v>
# nnoremap <C-S-r> <C-r>

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

command ToolbarOff set guioptions-=m | set guioptions-=T | set guioptions-=r | set guioptions-=L
command ToolbarOn set guioptions+=m | set guioptions+=T | set guioptions+=r | set guioptions+=L

" autocmd filetype c nnoremap <C-r> :w <bar> silent exec '! xterm -e "make run ; read"'<CR>

autocmd filetype c nnoremap <C-S-r> :AsyncRun terminator -e "make run ; echo -e '\n\nPress enter to continue...' ; read"<CR>
autocmd filetype cpp nnoremap <C-S-r> :AsyncRun terminator -e "make run ; echo -e '\n\nPress enter to continue...' ; read"<CR>

autocmd filetype julia nnoremap <C-S-r> :AsyncRun terminator -e "julia $(VIM_FILEPATH) ; echo -e '\nPress enter to continue...' ; read"<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'vim-scripts/matchit.zip'

Plug 'mhinz/vim-startify'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'JuliaEditorSupport/julia-vim'

Plug 'skywind3000/asyncrun.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"""" Configuration for coc

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  " inoremap <silent><expr> <c-@> coc#refresh()
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

""""""""""""""""""""""

colorscheme dracula
