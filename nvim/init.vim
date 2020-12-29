
"          _                     _
" ___  ___| |____     _ ____   _(_)_ __ ___
"/ __|/ _ \ |_  /____| '_ \ \ / / | '_ ` _ \
"\__ \  __/ |/ /_____| | | \ V /| | | | | | |
"|___/\___|_/___|    |_| |_|\_/ |_|_| |_| |_|
"
set mouse=a
set clipboard+=unnamedplus
set number ""relativenumber
set expandtab
set smarttab
set wrap
set linebreak
" set spell
set shiftwidth=2
set tabstop=2
set ignorecase
set splitbelow splitright
set shortmess=a
syntax on
filetype plugin on
"let g:python3_host_prog="/data/data/com.termux/files/usr/bin/python3"
set spelllang=en,it

"bracket completion
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

noremap x "_x
noremap g/ :noh<CR>
noremap j gj
noremap k gk
noremap l <Space>
noremap h <Backspace>
noremap <Down> gj
noremap <Up> gk
noremap <Right> <Space>
noremap <Left> <Backspace>
noremap ; :
noremap <C-;> q:
noremap H b
noremap L w
noremap J <C-d>
noremap K <C-u>
map Q gq
nnoremap <C-b> :call ToggleBar()<CR>

"Plug
call plug#begin('$HOME/.local/share/nvim/site/autoload/plug.nvim')
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets',
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'jreybert/vimagit'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

command W w! !sudo tee %
"compila source c
command C !gcc -lm % ~/source/c/library/library.c -pthread -o $(echo % | sed 's/..$//').out; out=$(echo % | sed 's/..$//').out ; tmux new-window "zsh -c './$out; echo ; echo $out finished ; read'"
command GCC !gcc -lm % ~/source/c/library/library.c -pthread -o $(echo % | sed 's/..$//').out; out=$(echo % | sed 's/..$//').out
command P !out=$(echo %); xfce4-terminal -e "zsh -c 'python3 $out; echo ; echo $out finished ; read'"
command H !xdg-open ./index.html
command Q q!
autocmd VimLeave *.js,*.js,*.css,*.c,*.cpp,*.h,*.html,*.xml,*.java,*.js,*.json,*.go,*.py Autoformat
autocmd VimEnter,BufWrite,BufNewFile,BufRead,BufReadPost,FileReadPost,BufNewFile * call system("tmux set-window-option window-status-current-style 'fg=black bg=yellow';tmux set-window-option window-status-style 'fg=yellow'")
autocmd VimEnter,BufWrite,BufNewFile,BufRead,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
" autocmd BufRead,BufNewFile *.txt silent! setlocal spell
" autocmd BufWrite ~/.local/alias :! < ~/.local/alias | grep 'alias conf-' | cut -c 6- | sed 's/ /$/1' > ~/.local/strings ;  
noremap cf :Autoformat<CR>
noremap gp :P<CR>

set signcolumn=no
inoremap <silent><expr> <c-space> coc#refresh()

" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" autocmd VimEnter,VimLeave * :silent !tmux set status
let NERDTreeShowHidden=1
noremap <C-o> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" hi TabLine      ctermfg=Black  ctermbg=Yellow     cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=NONE     cterm=NONE
" hi TabLineSel   ctermfg=White  ctermbg=11  cterm=NONE

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'


function! HideBar()
  let s:Hidden = 1
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
endfunction

function! ShowBar()
  let s:Hidden = 0
  set noshowmode
  set noruler
  set laststatus=2
  set noshowcmd
endfunction

function! ToggleBar()
  if s:Hidden  == 0
    : call HideBar()
  else
    : call ShowBar()
  endif
endfunction

:call HideBar()

