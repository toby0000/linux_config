" vim-plug
let plug_path='~/.config/nvim/plugged/'
call plug#begin(plug_path)
Plug 'davidhalter/jedi-vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'kien/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sjl/gundo.vim'
Plug plug_path.'Solarized'
Plug plug_path.'mark.vim'
call plug#end()

scriptencoding utf-8
syntax on
syntax enable
set undofile
set mouse=                 " disable mouse usage
set background=dark
set mousehide               " Hide the mouse cursor while typing
set cursorline                  " Highlight current line
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set autoindent                  " Indent at the same level of the previous line
set smartindent
set cindent
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set cinkeys=0{,0},0),:,!^F,o,O,e
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set showcmd                     " show the cmd you input
set ruler                       " show the current position

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set foldmethod=marker
set foldlevel=99
set updatetime=1000

let mapleader = ','
nnoremap <c-p> :<c-p>
nnoremap <c-n> :<c-n>

nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>

nnoremap <c-b> gt

nnoremap <leader>" ciw""<esc>P
nnoremap <leader>' ciw''<esc>P
nnoremap <leader>< ciw<><esc>P
nnoremap <leader>( ciw()<esc>P
nnoremap <leader>[ ciw[]<esc>P
nnoremap <leader>{ ciw{}<esc>P
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>e :qa<cr>
nnoremap <leader>x :x<cr>
" close <c-q> fun, avoid launch vitual mode
nnoremap <c-q> <esc>

vnoremap <leader>" di""<esc>P
vnoremap <leader>' di''<esc>P
vnoremap <leader>< di<><esc>P
vnoremap <leader>( di()<esc>P
vnoremap <leader>[ di[]<esc>P
vnoremap <leader>{ di{}<esc>P
vnoremap * y/0<cr>
vnoremap # y?0<cr>

"insert mode keymap
inoremap <c-b> <left>
inoremap <c-f> <right>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-j> <esc>o

"ex mode keymap
cnoremap <c-d> <del>
cnoremap <c-a> <Home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-x> <c-f>

" nvim/neovim terminal
tnoremap <c-q> <c-\><c-n>
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
let $CONF = "~/.config/nvim/init.vim"

nnoremap <leader>C :!rm ~/.local/share/nvim/swap/* -rf<cr>
nnoremap <leader>T :vs term://zsh<cr>a

nnoremap <leader><leader>/ :nohlsearch<CR>

" mark.vim
nnoremap <leader>c :MarkClear<cr>

" molokai
" let g:molokai_original=1
let g:rehash256=1

" solarized
 colorscheme solarized
" colorscheme distinguished
" colorscheme github
" colorscheme molokai
" colorscheme zenburn
set t_Co=256
" set term=screen-256color

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1000

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

let OmniCpp_NamespaceSearch = 2 "search namespaces in the current buffer and in include files

" tag
set tags=tags;
nmap <leader>j :tn<cr>
nmap <leader>k :tp<cr>
"nmap <leader>ts :ts<cr>

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_root_markers = ["tags", "cscope.out"]
let g:ctrlp_clear_cache_on_exit = 0
set wildignore=*.o,*.obj,*.d,*/.git/*,*.a,*.so
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>u :CtrlPMRUFiles<cr>

" cscope
set cspc=3
let g:cscope_auto_update = 1
"set csprg=/usr/local/bin/cscope
set csto=0
set nocst
let g:cscope_silent = 1
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.java$'
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" easymotion
map <leader><leader>h <plug>(easymotion-linebackward)
map <leader><leader>l <plug>(easymotion-lineforward)
map f <leader><leader>w
map F <leader><leader>b

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<c-l>"
let g:jedi#popup_on_dot = 0

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" deoplete
let g:deoplete#enable_at_startup=1

" neomake
let g:neomake_python_enable_makers = ['pylint', 'flake8', 'pep8']
let g:neomake_shell_enable_makers = ['shellcheck']
autocmd! BufWritePost * Neomake

" vim-better-whitespace
autocmd! BufEnter *.py EnableStripWhitespaceOnSave
autocmd! BufWritePost *.py StripWhitespace

" nerdcommenter
" let g:NERDRemoveExtraSpaces = 0
let g:NERDDefaultAlign = 'left'

" ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'
nnoremap <leader>a :Ack! -w <c-r><c-w><cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" gundo
nnoremap <f5> :GundoToggle<CR>


" not need to set follow config when use nvim
"set encoding=utf-8
"set termencoding=cp936
"set fileencodings=ucs-bom,utf-8,cp936,gdk
"let &termencoding=&encoding

" set python config
"autocmd BufNewFile,BufRead *.py exec ":call SetPythonConfig()"
"func SetPythonConfig()
"    set textwidth=79
"    set fileformat=unix
"    set foldmethod=indent
"    nnoremap <space> za
"endfunc
autocmd BufNewFile,BufRead *.py
            \ set textwidth=79 |
            \ set fileformat=unix |
            \ set foldmethod=indent |
			\ set expandtab |  " Tabs are spaces, not tabs
			\ set shiftround   " round indent to multiple of 'shiftwidth'"

" highlight the char which over length of 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight OverLength ctermbg=red
match OverLength /\%81v.\+/

" highlight the redundance space
"highlight BadWhitespace ctermbg=red
"match BadWhitespace /\s\+$/

" set web config
au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2

nnoremap <f10> :!python %<cr>
nnoremap <f9> :!python3 %<cr>
source ~/.config/nvim/google_python_style.vim
"autocmd FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p autocmd FileType python set errorformat=%f:%l:\ %m
